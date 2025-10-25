meta:
  bit-endian: le
  endian: le
  id: gameobject
seq:
- id: m_component
  type: array
- id: m_layer
  type: u4
- id: m_name
  type: string
- id: m_tag
  type: u2
- id: m_isactive
  type: b1
types:
  pptr_component:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  componentpair:
    seq:
    - id: component
      type: pptr_component
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: componentpair
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
