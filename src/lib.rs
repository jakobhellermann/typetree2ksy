use anyhow::Context as _;
use indexmap::IndexMap;
use rabex::typetree::TypeTreeNode;
use rabex::typetree::TypetreeNodeKind as Kind;
use rustc_hash::FxHashMap;

use std::collections::hash_map::Entry;
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

#[derive(Eq, PartialEq)]
struct IgnorePositionTTHash<'a>(&'a TypeTreeNode);
impl Hash for IgnorePositionTTHash<'_> {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        self.0.m_Type.hash(state);
        self.0.m_Name.hash(state);
        self.0.children.hash(state);
    }
}

#[derive(Default)]
pub struct Context<'a> {
    type_names: FxHashMap<IgnorePositionTTHash<'a>, String>,
    used_type_names: FxHashMap<String, usize>,

    types: IndexMap<TypesSpecKey, TypeSpec>,
}
impl<'a> Context<'a> {
    fn tt_to_typespec(&mut self, tt: &'a TypeTreeNode) -> TypeSpec {
        TypeSpec {
            seq: Some(self.tt_to_attributes(tt)),
            ..default()
        }
    }

    fn tt_to_attributes(&mut self, tt: &'a TypeTreeNode) -> Attributes {
        let mut attributes = Vec::new();

        for child in &tt.children {
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
        match tt.classify() {
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
            Kind::Map => todo!(),
            Kind::Untyped => todo!(),
            Kind::Empty => todo!(),
            Kind::Array => self.defer_type_array(&tt.children[0]),
            Kind::ArrayInner => self.defer_type_array(tt),
            Kind::String => self.defer_type_string(tt),
            Kind::Struct => self.defer_type(tt),
            Kind::TodoReferenced => todo!(),
            Kind::TodoType => todo!(),
        }
    }
    fn attribute_id(&self, tt: &TypeTreeNode) -> AttributeId {
        let identifier = name_to_identifier(&tt.m_Name);
        identifier.parse().context(identifier).unwrap()
    }

    fn defer_type_string(&mut self, tt: &'a TypeTreeNode) -> TypeRef {
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
        self.defer_type_spec(tt, spec)
    }
    fn defer_type_array(&mut self, tt: &'a TypeTreeNode) -> TypeRef {
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
        self.defer_type_spec(tt, spec)
    }

    fn defer_type(&mut self, tt: &'a TypeTreeNode) -> TypeRef {
        let spec = self.tt_to_typespec(tt);
        self.defer_type_spec(tt, spec)
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

    fn defer_type_spec(&mut self, tt: &'a TypeTreeNode, spec: TypeSpec) -> TypeRef {
        let type_ref = self.get_next_type_name(tt);

        let type_ref = match self.type_names.entry(IgnorePositionTTHash(tt)) {
            Entry::Occupied(_) => todo!(),
            Entry::Vacant(vacant_entry) => vacant_entry.insert(type_ref).clone(),
        };

        self.types.insert(type_ref.parse().unwrap(), spec);
        type_ref
    }

    pub fn generate(mut self, tt: &'a TypeTreeNode) -> KsySchema {
        let attrs = self.tt_to_attributes(tt);
        KsySchema {
            meta: Some(KsySchemaMeta {
                id: Identifier::String("game_object".parse().unwrap()),
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
}

fn name_to_identifier(name: &str) -> String {
    name.to_ascii_lowercase()
        .replace(['<', ' '], "_")
        .replace('>', "")
}

fn default<T: Default>() -> T {
    T::default()
}
