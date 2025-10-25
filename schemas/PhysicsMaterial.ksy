meta:
  bit-endian: le
  endian: le
  id: physicsmaterial
seq:
- id: m_name
  type: string
- id: m_dynamicfriction
  type: f4
- id: m_staticfriction
  type: f4
- id: m_bounciness
  type: f4
- id: m_frictioncombine
  type: s4
- id: m_bouncecombine
  type: s4
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
