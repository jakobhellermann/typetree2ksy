meta:
  bit-endian: le
  endian: le
  id: meshfilter
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_mesh
  type: pptr_mesh
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_mesh:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
