meta:
  bit-endian: le
  endian: le
  id: spriteatlas
seq:
- id: m_name
  type: string
- id: m_packedsprites
  type: array
- id: m_packedspritenamestoindex
  type: array_d1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_renderdatamap
  type: map
- id: m_tag
  type: string
- id: m_isvariant
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
  pptr_sprite:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_sprite
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
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
  pair:
    seq:
    - id: first
      type: guid
    - id: second
      type: s8
  pptr_texture2d:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  rectf:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: width
      type: f4
    - id: height
      type: f4
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  vector4f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
    - id: w
      type: f4
  secondaryspritetexture:
    seq:
    - id: texture
      type: pptr_texture2d
    - id: name
      type: string
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: secondaryspritetexture
  spriteatlasdata:
    seq:
    - id: texture
      type: pptr_texture2d
    - id: alphatexture
      type: pptr_texture2d
    - id: texturerect
      type: rectf
    - id: texturerectoffset
      type: vector2f
    - id: atlasrectoffset
      type: vector2f
    - id: uvtransform
      type: vector4f
    - id: downscalemultiplier
      type: f4
    - id: settingsraw
      type: u4
    - id: secondarytextures
      type: array_d2
  pair_d1:
    seq:
    - id: first
      type: pair
    - id: second
      type: spriteatlasdata
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d1
  map:
    seq:
    - id: array
      type: array_d3
