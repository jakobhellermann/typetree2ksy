meta:
  bit-endian: le
  endian: le
  id: occlusioncullingdata
seq:
- id: m_name
  type: string
- id: m_pvsdata
  type: array
- id: m_scenes
  type: array_d1
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
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  guid:
    seq:
    - id: data_0
      type: u4
    - id: data_1
      type: u4
    - id: data_2
      type: u4
    - id: data_3
      type: u4
  occlusionscene:
    seq:
    - id: indexrenderers
      type: s4
    - id: sizerenderers
      type: s4
    - id: indexportals
      type: s4
    - id: sizeportals
      type: s4
    - id: scene
      type: guid
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: occlusionscene
