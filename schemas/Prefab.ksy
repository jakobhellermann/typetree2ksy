meta:
  bit-endian: le
  endian: le
  id: prefab
seq:
- id: m_rootgameobject
  type: pptr_gameobject
- id: m_hideflagsbehaviour
  type: s4
- id: m_containsmissingserializereferencetypes
  type: b1
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
