meta:
  bit-endian: le
  endian: le
  id: multiplayerrolesdata
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_gameobjectrolesmask
  type: s4
- id: m_componentsrolesmasks
  type: array
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  objectrolepair:
    seq:
    - id: m_object
      type: pptr_object
    - id: m_rolesmask
      type: s4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: objectrolepair
