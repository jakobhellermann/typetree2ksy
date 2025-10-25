meta:
  bit-endian: le
  endian: le
  id: inspectorexpandedstate
seq:
- id: m_expandeddata
  type: array_d1
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
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
  expandeddata:
    seq:
    - id: m_inspectorexpanded
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_classid
      type: u4
    - id: m_scriptclass
      type: string
    - id: m_expandedproperties
      type: array
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: expandeddata
