meta:
  bit-endian: le
  endian: le
  id: hierarchystate
seq:
- id: expanded
  type: array
- id: selection
  type: array
- id: scrollposition_x
  type: f4
- id: scrollposition_y
  type: f4
types:
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
