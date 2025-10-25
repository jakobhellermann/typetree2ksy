ksy_schema.json:
    curl https://raw.githubusercontent.com/kaitai-io/ksy_schema/refs/heads/master/ksy_schema.json -o ksy_schema.json

src/ksy.rs:
	cargo typify ksy_schema.json -o src/ksy.rs --no-builder --map-type indexmap::IndexMap

.PHONY: dump
dump:
	ksdump ../../unity/rabex-env/out.data animation_clip.ksy
