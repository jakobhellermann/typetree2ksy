meta:
  bit-endian: le
  endian: le
  id: preloaddata
seq:
- id: m_name
  type: string
- id: m_assets
  type: array
- id: m_dependencies
  type: array_d1
- id: m_explicitdatalayout
  type: b1
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
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_object
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
