meta:
  bit-endian: le
  endian: le
  id: audiobuildinfo
seq:
- id: m_isaudiodisabled
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_audioclipcount
  type: s4
- id: m_audiomixercount
  type: s4
types: {}
