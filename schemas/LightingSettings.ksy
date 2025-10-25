meta:
  bit-endian: le
  endian: le
  id: lightingsettings
seq:
- id: m_name
  type: string
- id: m_enablebakedlightmaps
  type: b1
- id: m_enablerealtimelightmaps
  type: b1
- id: m_realtimeenvironmentlighting
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_bouncescale
  type: f4
- id: m_albedoboost
  type: f4
- id: m_indirectoutputscale
  type: f4
- id: m_usingshadowmask
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
types:
  string:
    seq:
    - id: size
      type: s4
    - encoding: UTF-8
      id: data
      size: size
      type: str
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
