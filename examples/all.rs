use std::path::Path;

use anyhow::Result;
use rabex::tpk::TpkTypeTreeBlob;

fn main() -> Result<()> {
    tracing_subscriber::fmt().without_time().init();

    let tpk = TpkTypeTreeBlob::embedded();

    let mut types: Vec<_> = tpk
        .class_information
        .iter()
        .filter_map(|(class_id, versions)| {
            let unity_class = versions.last()?.1.as_ref()?;
            let tt = tpk.get_typetree_node_for_class(unity_class, false)?;
            Some((class_id, tt))
        })
        .collect();
    types.sort_by(|a, b| a.0.cmp(b.0));

    for (class_id, tt) in types {
        tracing::info!("{class_id:?}");

        let cx = typetree2ksy::Context::default();
        let ksy = cx.generate(&tt);
        let ksy_yaml = serde_yaml_ng::to_string(&ksy)?;

        let out_dir = Path::new("schemas");
        std::fs::create_dir_all(out_dir)?;
        std::fs::write(
            out_dir.join(tt.m_Type).with_added_extension("ksy"),
            ksy_yaml,
        )?;
    }
    Ok(())
}
