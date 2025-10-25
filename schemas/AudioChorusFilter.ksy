meta:
  bit-endian: le
  endian: le
  id: audiochorusfilter
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_drymix
  type: f4
- id: m_wetmix1
  type: f4
- id: m_wetmix2
  type: f4
- id: m_wetmix3
  type: f4
- id: m_delay
  type: f4
- id: m_rate
  type: f4
- id: m_depth
  type: f4
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
