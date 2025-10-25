meta:
  bit-endian: le
  endian: le
  id: localizationasset
seq:
- id: m_name
  type: string
- id: locale_iso_code
  type: string
- id: editor_asset
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: string_table
  type: map
types:
  string:
    seq:
    - id: size
      type: s4
    - encoding: UTF-8
      id: data
      size: size
      type: str
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pair:
    seq:
    - id: first
      type: string
    - id: second
      type: string
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair
  map:
    seq:
    - id: array
      type: array
