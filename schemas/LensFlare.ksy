meta:
  bit-endian: le
  endian: le
  id: lensflare
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_flare
  type: pptr_flare
- id: m_color
  type: colorrgba
- id: m_brightness
  type: f4
- id: m_fadespeed
  type: f4
- id: m_ignorelayers
  type: bitfield
- id: m_directional
  type: b1
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_flare:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  colorrgba:
    seq:
    - id: r
      type: f4
    - id: g
      type: f4
    - id: b
      type: f4
    - id: a
      type: f4
  bitfield:
    seq:
    - id: m_bits
      type: u4
