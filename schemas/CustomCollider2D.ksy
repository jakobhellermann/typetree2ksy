meta:
  bit-endian: le
  endian: le
  id: customcollider2d
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_density
  type: f4
- id: m_material
  type: pptr_physicsmaterial2d
- id: m_includelayers
  type: bitfield
- id: m_excludelayers
  type: bitfield
- id: m_layeroverridepriority
  type: s4
- id: m_forcesendlayers
  type: bitfield
- id: m_forcereceivelayers
  type: bitfield
- id: m_contactcapturelayers
  type: bitfield
- id: m_callbacklayers
  type: bitfield
- id: m_istrigger
  type: b1
- id: m_usedbyeffector
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_compositeoperation
  type: s4
- id: m_compositeorder
  type: s4
- id: m_offset
  type: vector2f
- id: m_customshapes
  type: physicsshapegroup2d
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_physicsmaterial2d:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  bitfield:
    seq:
    - id: m_bits
      type: u4
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  physicsshape:
    seq:
    - id: m_shapetype
      type: s4
    - id: m_radius
      type: f4
    - id: m_vertexstartindex
      type: s4
    - id: m_vertexcount
      type: s4
    - id: m_useadjacentstart
      type: s4
    - id: m_useadjacentend
      type: s4
    - id: m_adjacentstart
      type: vector2f
    - id: m_adjacentend
      type: vector2f
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: physicsshape
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vector2f
  physicsshapegroup2d:
    seq:
    - id: m_shapes
      type: array
    - id: m_vertices
      type: array_d1
