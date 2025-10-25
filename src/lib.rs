use anyhow::Context as _;
use indexmap::IndexMap;
use rabex::typetree::TypeTreeNode;
use rabex::typetree::TypetreeNodeKind as Kind;
use rustc_hash::FxHashMap;

use std::hash::Hash;

use crate::ksy::AttributeId;
use crate::ksy::AttributeRepeat;
use crate::ksy::CharacterEncoding;
use crate::ksy::Identifier;
use crate::ksy::KsySchema;
use crate::ksy::KsySchemaMeta;
use crate::ksy::KsySchemaMetaBitEndian;
use crate::ksy::KsySchemaMetaEndianVariant0;
use crate::ksy::TypeRef;
use crate::ksy::TypesSpec;
use crate::ksy::{
    Attribute, AttributeIf, AttributeType, Attributes, StringOrInteger, TypeSpec, TypesSpecKey,
};

#[allow(clippy::derivable_impls)]
pub mod ksy;

#[derive(Eq)]
struct TypeOnlyHash<'a>(&'a TypeTreeNode);

impl<'a> PartialEq for TypeOnlyHash<'a> {
    fn eq(&self, other: &Self) -> bool {
        self.0.m_Type == other.0.m_Type
            && self.0.children.len() == other.0.children.len()
            && self
                .0
                .children
                .iter()
                .zip(&other.0.children)
                .all(|(a, b)| TypeOnlyHash(a) == TypeOnlyHash(b))
    }
}
impl Hash for TypeOnlyHash<'_> {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        fn hash_type_only<H: std::hash::Hasher>(val: &TypeTreeNode, state: &mut H) {
            val.m_Type.hash(state);
            for child in &val.children {
                hash_type_only(child, state);
            }
        }
        hash_type_only(self.0, state);
    }
}

#[derive(Default)]
pub struct Context<'a> {
    type_names: FxHashMap<TypeOnlyHash<'a>, String>,
    used_type_names: FxHashMap<String, usize>,

    types: IndexMap<TypesSpecKey, TypeSpec>,
}
impl<'a> Context<'a> {
    pub fn generate(mut self, tt: &'a TypeTreeNode) -> KsySchema {
        let attrs = self.tt_to_attributes(tt);
        KsySchema {
            meta: Some(KsySchemaMeta {
                id: Identifier::String(name_to_identifier(&tt.m_Type).parse().unwrap()),
                application: None,
                bit_endian: KsySchemaMetaBitEndian::Le,
                endian: Some(KsySchemaMetaEndianVariant0::Le.into()),
                encoding: None,
                file_extension: None,
                imports: None,
                ks_debug: false,
                ks_opaque_types: false,
                ks_version: None,
                license: None,
                tags: vec![],
                title: None,
                xref: None,
            }),
            seq: Some(attrs),
            types: Some(TypesSpec::from(self.types)),
            ..default()
        }
    }

    fn tt_to_typespec(&mut self, tt: &'a TypeTreeNode) -> TypeSpec {
        TypeSpec {
            seq: Some(self.tt_to_attributes(tt)),
            ..default()
        }
    }

    fn tt_to_attributes(&mut self, tt: &'a TypeTreeNode) -> Attributes {
        tracing::info!("Build '{} {}'", tt.m_Type, tt.m_Name);
        let mut attributes = Vec::new();

        for child in &tt.children {
            tracing::debug!("{} {}", child.m_Type, child.m_Name);
            attributes.push(Attribute {
                id: Some(self.attribute_id(child)),
                type_: Some(AttributeType::TypeRef(self.type_ref(child))),
                ..default()
            });
            if child.requires_align() {
                attributes.push(Context::align4_attribute());
            }
        }

        Attributes(attributes)
    }

    fn align4_attribute() -> Attribute {
        Self::align_attribute(4)
    }
    fn align_attribute(align: usize) -> Attribute {
        Attribute {
            id: Some("align4".parse().unwrap()),
            size: Some(StringOrInteger::String(format!(
                "({align} - (_io.pos % {align}) % {align})"
            ))),
            if_: Some(AttributeIf::String(format!("(_io.pos % {align}) != 0"))),
            ..default()
        }
    }

    fn type_ref(&mut self, tt: &'a TypeTreeNode) -> TypeRef {
        let key = TypeOnlyHash(tt);
        if let Some(type_ref) = self.type_names.get(&key) {
            return type_ref.clone();
        };

        tracing::debug!("[uncached] Building type reference for '{}'", tt.m_Type);
        let result = match tt.classify() {
            Kind::Bool => "b1".into(),
            Kind::U8 => "u1".into(),
            Kind::U16 => "u2".into(),
            Kind::U32 => "u4".into(),
            Kind::U64 => "u8".into(),
            Kind::I8 => "s1".into(),
            Kind::I16 => "s2".into(),
            Kind::I32 => "s4".into(),
            Kind::I64 => "s8".into(),
            Kind::Float => "f4".into(),
            Kind::Double => "f8".into(),
            Kind::Char => "u1".into(),
            Kind::Untyped => self.add_array_type(tt),
            Kind::Empty => todo!(),
            Kind::Array => self.add_array_type(&tt.children[0]),
            Kind::ArrayInner => self.add_array_type(tt),
            Kind::String => self.add_string_type(tt),
            Kind::Map | Kind::Struct => self.add_type(tt),
            Kind::TodoReferenced => todo!(),
            Kind::TodoType => todo!(),
        };

        assert!(self.type_names.insert(key, result.clone()).is_none());
        result
    }
    fn attribute_id(&self, tt: &TypeTreeNode) -> AttributeId {
        let identifier = name_to_identifier(&tt.m_Name);
        identifier.parse().context(identifier).unwrap()
    }

    fn add_string_type(&mut self, tt: &'a TypeTreeNode) -> TypeRef {
        let size_name = "size";
        let attributes = vec![
            Attribute {
                id: Some(size_name.parse().unwrap()),
                type_: Some(AttributeType::TypeRef("s4".into())),
                ..default()
            },
            Attribute {
                id: Some("data".parse().unwrap()),
                type_: Some(AttributeType::TypeRef("str".into())),
                encoding: Some(CharacterEncoding::Utf8),
                size: Some(StringOrInteger::String(size_name.into())),
                ..default()
            },
            Context::align4_attribute(),
        ];
        let spec = TypeSpec {
            seq: Some(Attributes(attributes)),
            ..default()
        };
        self.add_type_spec(tt, spec)
    }

    fn add_array_type(&mut self, tt: &'a TypeTreeNode) -> TypeRef {
        let [len_ty, item_ty] = tt.children.as_slice() else {
            unreachable!()
        };

        let size_name = name_to_identifier(&len_ty.m_Name);

        let attributes = vec![
            Attribute {
                id: Some(size_name.parse().unwrap()),
                type_: Some(AttributeType::TypeRef(self.type_ref(len_ty))),
                ..default()
            },
            Attribute {
                id: Some("data".parse().unwrap()),
                type_: Some(self.type_ref(item_ty).into()),
                repeat: Some(AttributeRepeat::Expr),
                repeat_expr: Some(StringOrInteger::String(size_name)),
                ..default()
            },
        ];
        let spec = TypeSpec {
            seq: Some(Attributes(attributes)),
            ..default()
        };
        self.add_type_spec(tt, spec)
    }

    fn add_type(&mut self, tt: &'a TypeTreeNode) -> TypeRef {
        let spec = self.tt_to_typespec(tt);
        self.add_type_spec(tt, spec)
    }

    fn get_next_type_name(&mut self, tt: &TypeTreeNode) -> TypeRef {
        let candidate = name_to_identifier(&tt.m_Type);
        if let Some(count) = self.used_type_names.get_mut(&candidate) {
            *count += 1;
            let disambiguated = format!("{candidate}_d{count}");
            assert!(
                self.used_type_names
                    .insert(disambiguated.clone(), 0)
                    .is_none()
            );
            disambiguated
        } else {
            self.used_type_names.insert(candidate.clone(), 0);
            candidate
        }
    }

    fn add_type_spec(&mut self, tt: &'a TypeTreeNode, spec: TypeSpec) -> TypeRef {
        tracing::info!("Add type spec for '{} {}'", tt.m_Type, tt.m_Name);

        let type_ref = self.get_next_type_name(tt);
        self.types.insert(type_ref.parse().unwrap(), spec);
        type_ref
    }
}

fn name_to_identifier(name: &str) -> String {
    name.to_ascii_lowercase()
        .replace(['<', '[', ' '], "_")
        .replace(['>', ']'], "")
        .replace("(int&)", "")
}

fn default<T: Default>() -> T {
    T::default()
}

#[cfg(test)]
mod tests {
    use crate::name_to_identifier;

    #[test]
    fn name_to_identifier_values() {
        assert_eq!(name_to_identifier("m_GameObject"), "m_gameobject");
        assert_eq!(name_to_identifier("PPtr<Material>"), "pptr_material");
        assert_eq!(name_to_identifier("with space"), "with_space");
        assert_eq!(name_to_identifier("data[0][1]"), "data_0_1");
        assert_eq!(
            name_to_identifier("(int&)m_layerblendingmode"),
            "m_layerblendingmode"
        );
    }
}
