meta:
  bit-endian: le
  endian: le
  id: surfaceeffector2d
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_usecollidermask
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_collidermask
  type: bitfield
- id: m_speed
  type: f4
- id: m_speedvariation
  type: f4
- id: m_forcescale
  type: f4
- id: m_usecontactforce
  type: b1
- id: m_usefriction
  type: b1
- id: m_usebounce
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  bitfield:
    seq:
    - id: m_bits
      type: u4
