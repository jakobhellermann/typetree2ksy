meta:
  bit-endian: le
  endian: le
  id: compositecollider2d
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
- id: m_geometrytype
  type: s4
- id: m_generationtype
  type: s4
- id: m_edgeradius
  type: f4
- id: m_colliderpaths
  type: array_d2
- id: m_compositepaths
  type: polygon2d
- id: m_vertexdistance
  type: f4
- id: m_offsetdistance
  type: f4
- id: m_usedelaunaymesh
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_compositegameobject
  type: pptr_gameobject
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
  pptr_collider2d:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  intpoint:
    seq:
    - id: x
      type: s8
    - id: y
      type: s8
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: intpoint
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: array
  subcollider:
    seq:
    - id: m_collider
      type: pptr_collider2d
    - id: m_colliderpaths
      type: array_d1
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: subcollider
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vector2f
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: array_d3
  polygon2d:
    seq:
    - id: m_paths
      type: array_d4
