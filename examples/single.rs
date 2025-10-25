use std::path::Path;

use anyhow::Result;
use rabex::{objects::ClassId, tpk::TpkTypeTreeBlob};

fn main() -> Result<()> {
    tracing_subscriber::fmt::init();

    let tpk = TpkTypeTreeBlob::embedded();
    let version = tpk.versions.last().unwrap();

    let tt = tpk.get_typetree_node(ClassId::Material, version).unwrap();
    println!("{}", tt.dump());

    let cx = typetree2ksy::Context::default();
    let ksy = cx.generate(&tt);
    let ksy_yaml = serde_yaml_ng::to_string(&ksy)?;

    let out_dir = Path::new("schemas");
    std::fs::create_dir_all(out_dir)?;
    std::fs::write(
        out_dir.join(tt.m_Type).with_added_extension("ksy"),
        ksy_yaml,
    )?;
    Ok(())
}
