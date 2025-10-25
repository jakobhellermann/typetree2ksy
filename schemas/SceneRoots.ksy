meta:
  bit-endian: le
  endian: le
  id: sceneroots
seq:
- id: m_roots
  type: array
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
