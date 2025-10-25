meta:
  bit-endian: le
  endian: le
  id: game_object
seq:
- id: m_gameobject
  type: pptr_gameobject
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
