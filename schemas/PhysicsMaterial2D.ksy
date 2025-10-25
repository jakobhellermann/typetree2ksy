meta:
  bit-endian: le
  endian: le
  id: physicsmaterial2d
seq:
- id: m_name
  type: string
- id: friction
  type: f4
- id: bounciness
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
