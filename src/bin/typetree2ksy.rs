use std::collections::hash_map::Entry;
use std::path::Path;

use anyhow::{Context as _, Result};
use indexmap::IndexMap;
use katai::ksy::{
    Attribute, AttributeId, AttributeIf, AttributeRepeat, AttributeType, Attributes, Identifier,
    KsySchema, KsySchemaMeta, StringOrInteger, TypeRef, TypeSpec, TypesSpec, TypesSpecKey,
};
use rabex::typetree::TypetreeNodeKind as Kind;
use rabex::{objects::ClassId, tpk::TpkTypeTreeBlob, typetree::TypeTreeNode};
use rustc_hash::{FxHashMap, FxHashSet};

fn default<T: Default>() -> T {
    T::default()
}

fn main() -> Result<()> {
    let mut args = std::env::args().skip(1);
    let version = args.next();
    let tpk = TpkTypeTreeBlob::embedded();

    let version = version
        .map(|v| v.parse())
        .transpose()?
        .unwrap_or(tpk.versions.last().unwrap().clone());
    let tt = tpk
        .get_typetree_node(ClassId::GameObject, &version)
        .unwrap();
    println!("{}", tt.dump());

    let cx = Context::default();
    let ksy = cx.generate(&tt);
    let ksy_yaml = serde_yaml_ng::to_string(&ksy)?;
    println!("{}", ksy_yaml);

    let out_dir = Path::new("schemas");
    std::fs::create_dir_all(out_dir)?;
    std::fs::write(
        out_dir.join(tt.m_Type).with_added_extension("ksy"),
        ksy_yaml,
    )?;
    println!("---");
    Ok(())
}

#[derive(Default)]
struct Context<'a> {
    type_names: FxHashMap<&'a TypeTreeNode, String>,
    used_type_names: FxHashSet<String>,

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
                encoding: Some(katai::ksy::CharacterEncoding::Utf8),
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
        let mut candidate = name_to_identifier(&tt.m_Type);
        while self.used_type_names.contains(&candidate) {
            candidate.push_str("_disambig");
        }
        assert!(self.used_type_names.insert(candidate.clone()));
        candidate
    }

    fn defer_type_spec(&mut self, tt: &'a TypeTreeNode, spec: TypeSpec) -> TypeRef {
        let type_ref = self.get_next_type_name(tt);

        let type_ref = match self.type_names.entry(tt) {
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
                bit_endian: katai::ksy::KsySchemaMetaBitEndian::Le,
                endian: Some(katai::ksy::KsySchemaMetaEndianVariant0::Le.into()),
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
