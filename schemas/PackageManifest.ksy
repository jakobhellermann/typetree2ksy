meta:
  bit-endian: le
  endian: le
  id: packagemanifest
seq:
- id: m_name
  type: string
- id: m_script
  type: string
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
