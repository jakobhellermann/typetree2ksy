meta:
  bit-endian: le
  endian: le
  id: lightprobes
seq:
- id: m_name
  type: string
- id: m_data
  type: lightprobedata
- id: m_bakedcoefficients
  type: array_d4
- id: m_bakedlightocclusion
  type: array_d8
- id: m_hasbeenedited
  type: b1
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
  matrix3x4f:
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
  tetrahedron:
    seq:
    - id: indices_0
      type: s4
    - id: indices_1
      type: s4
    - id: indices_2
      type: s4
    - id: indices_3
      type: s4
    - id: neighbors_0
      type: s4
    - id: neighbors_1
      type: s4
    - id: neighbors_2
      type: s4
    - id: neighbors_3
      type: s4
    - id: matrix
      type: matrix3x4f
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: tetrahedron
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vector3f
  probesettetrahedralization:
    seq:
    - id: m_tetrahedra
      type: array
    - id: m_hullrays
      type: array_d1
  hash128:
    seq:
    - id: bytes_0
      type: u1
    - id: bytes_1
      type: u1
    - id: bytes_2
      type: u1
    - id: bytes_3
      type: u1
    - id: bytes_4
      type: u1
    - id: bytes_5
      type: u1
    - id: bytes_6
      type: u1
    - id: bytes_7
      type: u1
    - id: bytes_8
      type: u1
    - id: bytes_9
      type: u1
    - id: bytes_10
      type: u1
    - id: bytes_11
      type: u1
    - id: bytes_12
      type: u1
    - id: bytes_13
      type: u1
    - id: bytes_14
      type: u1
    - id: bytes_15
      type: u1
  probesetindex:
    seq:
    - id: m_hash
      type: hash128
    - id: m_offset
      type: s4
    - id: m_size
      type: s4
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: probesetindex
  pair:
    seq:
    - id: first
      type: hash128
    - id: second
      type: s4
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
  lightprobedata:
    seq:
    - id: m_tetrahedralization
      type: probesettetrahedralization
    - id: m_probesets
      type: array_d2
    - id: m_positions
      type: array_d1
    - id: m_nontetrahedralizedprobesetindexmap
      type: map
  sphericalharmonicsl2:
    seq:
    - id: sh__0
      type: f4
    - id: sh__1
      type: f4
    - id: sh__2
      type: f4
    - id: sh__3
      type: f4
    - id: sh__4
      type: f4
    - id: sh__5
      type: f4
    - id: sh__6
      type: f4
    - id: sh__7
      type: f4
    - id: sh__8
      type: f4
    - id: sh__9
      type: f4
    - id: sh_10
      type: f4
    - id: sh_11
      type: f4
    - id: sh_12
      type: f4
    - id: sh_13
      type: f4
    - id: sh_14
      type: f4
    - id: sh_15
      type: f4
    - id: sh_16
      type: f4
    - id: sh_17
      type: f4
    - id: sh_18
      type: f4
    - id: sh_19
      type: f4
    - id: sh_20
      type: f4
    - id: sh_21
      type: f4
    - id: sh_22
      type: f4
    - id: sh_23
      type: f4
    - id: sh_24
      type: f4
    - id: sh_25
      type: f4
    - id: sh_26
      type: f4
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: sphericalharmonicsl2
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s4
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: f4
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s1
  lightprobeocclusion:
    seq:
    - id: m_probeocclusionlightindex
      type: array_d5
    - id: m_occlusion
      type: array_d6
    - id: m_occlusionmaskchannel
      type: array_d7
  array_d8:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: lightprobeocclusion
