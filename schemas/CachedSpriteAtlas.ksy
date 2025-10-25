meta:
  bit-endian: le
  endian: le
  id: cachedspriteatlas
seq:
- id: textures
  type: array
- id: alphatextures
  type: array
- id: frames
  type: map
types:
  pptr_texture2d:
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
      type: pptr_texture2d
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
  secondaryspritetexture:
    seq:
    - id: texture
      type: pptr_texture2d
    - id: name
      type: string
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: secondaryspritetexture
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  aabb:
    seq:
    - id: m_center
      type: vector3f
    - id: m_extent
      type: vector3f
  submesh:
    seq:
    - id: firstbyte
      type: u4
    - id: indexcount
      type: u4
    - id: topology
      type: s4
    - id: basevertex
      type: u4
    - id: firstvertex
      type: u4
    - id: vertexcount
      type: u4
    - id: localaabb
      type: aabb
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: submesh
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  channelinfo:
    seq:
    - id: stream
      type: u1
    - id: offset
      type: u1
    - id: format
      type: u1
    - id: dimension
      type: u1
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: channelinfo
  typelessdata:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  vertexdata:
    seq:
    - id: m_vertexcount
      type: u4
    - id: m_channels
      type: array_d4
    - id: m_datasize
      type: typelessdata
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  matrix4x4f:
    seq:
    - id: e00
      type: f4
    - id: e01
      type: f4
    - id: e02
      type: f4
    - id: e03
      type: f4
    - id: e10
      type: f4
    - id: e11
      type: f4
    - id: e12
      type: f4
    - id: e13
      type: f4
    - id: e20
      type: f4
    - id: e21
      type: f4
    - id: e22
      type: f4
    - id: e23
      type: f4
    - id: e30
      type: f4
    - id: e31
      type: f4
    - id: e32
      type: f4
    - id: e33
      type: f4
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: matrix4x4f
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
  spriterenderdata:
    seq:
    - id: texture
      type: pptr_texture2d
    - id: alphatexture
      type: pptr_texture2d
    - id: secondarytextures
      type: array_d1
    - id: m_submeshes
      type: array_d2
    - id: m_indexbuffer
      type: array_d3
    - id: m_vertexdata
      type: vertexdata
    - id: m_bindpose
      type: array_d5
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: texturerect
      type: rectf
    - id: texturerectoffset
      type: vector2f
    - id: atlasrectoffset
      type: vector2f
    - id: settingsraw
      type: u4
    - id: uvtransform
      type: vector4f
    - id: downscalemultiplier
      type: f4
  pair_d1:
    seq:
    - id: first
      type: pair
    - id: second
      type: spriterenderdata
  array_d6:
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
      type: array_d6
