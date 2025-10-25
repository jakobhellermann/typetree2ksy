meta:
  bit-endian: le
  endian: le
  id: offmeshlink
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_areaindex
  type: u4
- id: m_agenttypeid
  type: s4
- id: m_start
  type: pptr_transform
- id: m_end
  type: pptr_transform
- id: m_costoverride
  type: f4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_bidirectional
  type: b1
- id: m_activated
  type: b1
- id: m_autoupdatepositions
  type: b1
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_transform:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
