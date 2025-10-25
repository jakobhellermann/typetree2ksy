meta:
  bit-endian: le
  endian: le
  id: mesh
seq:
- id: m_name
  type: string
- id: m_submeshes
  type: array
- id: m_shapes
  type: blendshapedata
- id: m_bindpose
  type: array_d5
- id: m_bonenamehashes
  type: array_d6
- id: m_rootbonenamehash
  type: u4
- id: m_bonesaabb
  type: array_d7
- id: m_variablebonecountweights
  type: variablebonecountweights
- id: m_meshcompression
  type: u1
- id: m_isreadable
  type: b1
- id: m_keepvertices
  type: b1
- id: m_keepindices
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_indexformat
  type: s4
- id: m_indexbuffer
  type: array_d8
- id: m_vertexdata
  type: vertexdata
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_compressedmesh
  type: compressedmesh
- id: m_localaabb
  type: aabb
- id: m_meshusageflags
  type: s4
- id: m_cookingoptions
  type: s4
- id: m_bakedconvexcollisionmesh
  type: array_d8
- id: m_bakedtrianglecollisionmesh
  type: array_d8
- id: m_meshmetrics_0
  type: f4
- id: m_meshmetrics_1
  type: f4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_streamdata
  type: streaminginfo
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
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: submesh
  blendshapevertex:
    seq:
    - id: vertex
      type: vector3f
    - id: normal
      type: vector3f
    - id: tangent
      type: vector3f
    - id: index
      type: u4
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: blendshapevertex
  meshblendshape:
    seq:
    - id: firstvertex
      type: u4
    - id: vertexcount
      type: u4
    - id: hasnormals
      type: b1
    - id: hastangents
      type: b1
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
      type: meshblendshape
  meshblendshapechannel:
    seq:
    - id: name
      type: string
    - id: namehash
      type: u4
    - id: frameindex
      type: s4
    - id: framecount
      type: s4
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: meshblendshapechannel
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: f4
  blendshapedata:
    seq:
    - id: vertices
      type: array_d1
    - id: shapes
      type: array_d2
    - id: channels
      type: array_d3
    - id: fullweights
      type: array_d4
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
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
  minmaxaabb:
    seq:
    - id: m_min
      type: vector3f
    - id: m_max
      type: vector3f
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: minmaxaabb
  variablebonecountweights:
    seq:
    - id: m_data
      type: array_d6
  array_d8:
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
  array_d9:
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
      type: array_d9
    - id: m_datasize
      type: typelessdata
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  packedbitvector:
    seq:
    - id: m_numitems
      type: u4
    - id: m_range
      type: f4
    - id: m_start
      type: f4
    - id: m_data
      type: array_d8
    - id: m_bitsize
      type: u1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  packedbitvector_d1:
    seq:
    - id: m_numitems
      type: u4
    - id: m_data
      type: array_d8
    - id: m_bitsize
      type: u1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  compressedmesh:
    seq:
    - id: m_vertices
      type: packedbitvector
    - id: m_uv
      type: packedbitvector
    - id: m_normals
      type: packedbitvector
    - id: m_tangents
      type: packedbitvector
    - id: m_weights
      type: packedbitvector_d1
    - id: m_normalsigns
      type: packedbitvector_d1
    - id: m_tangentsigns
      type: packedbitvector_d1
    - id: m_floatcolors
      type: packedbitvector
    - id: m_boneindices
      type: packedbitvector_d1
    - id: m_triangles
      type: packedbitvector_d1
    - id: m_uvinfo
      type: u4
  streaminginfo:
    seq:
    - id: offset
      type: u8
    - id: size
      type: u4
    - id: path
      type: string
