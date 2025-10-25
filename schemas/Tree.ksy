meta:
  bit-endian: le
  endian: le
  id: tree
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_speedtreewindasset
  type: pptr_speedtreewindasset
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_speedtreewindasset:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
