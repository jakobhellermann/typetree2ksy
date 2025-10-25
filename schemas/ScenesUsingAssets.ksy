meta:
  bit-endian: le
  endian: le
  id: scenesusingassets
seq:
- id: m_scenesusingassets
  type: array_d1
- id: m_listofscenesusingeachasset
  type: map
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
      type: string
  buildreportscenesusingasset:
    seq:
    - id: assetpath
      type: string
    - id: scenepaths
      type: array
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: buildreportscenesusingasset
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
  pair:
    seq:
    - id: first
      type: string
    - id: second
      type: array_d2
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair
  map:
    seq:
    - id: array
      type: array_d3
