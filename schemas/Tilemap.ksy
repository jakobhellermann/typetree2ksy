meta:
  bit-endian: le
  endian: le
  id: tilemap
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_tiles
  type: map
- id: m_animatedtiles
  type: map_d1
- id: m_tileassetarray
  type: array_d3
- id: m_tilespritearray
  type: array_d4
- id: m_tilematrixarray
  type: array_d5
- id: m_tilecolorarray
  type: array_d6
- id: m_tileobjecttoinstantiatearray
  type: array_d7
- id: m_animationframerate
  type: f4
- id: m_color
  type: colorrgba
- id: m_origin
  type: int3_storage
- id: m_size
  type: int3_storage
- id: m_tileanchor
  type: vector3f
- id: m_tileorientation
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_tileorientationmatrix
  type: matrix4x4f
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  int3_storage:
    seq:
    - id: x
      type: s4
    - id: y
      type: s4
    - id: z
      type: s4
  tile:
    seq:
    - id: m_tileindex
      type: u4
    - id: m_tilespriteindex
      type: u4
    - id: m_tilematrixindex
      type: u2
    - id: m_tilecolorindex
      type: u2
    - id: m_tileobjecttoinstantiateindex
      type: u2
    - id: dummyalignment
      type: u2
    - id: m_alltileflags
      type: u4
  pair:
    seq:
    - id: first
      type: int3_storage
    - id: second
      type: tile
  array:
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
      type: array
  pptr_sprite:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_sprite
  tileanimationdata:
    seq:
    - id: m_animatedsprites
      type: array_d1
    - id: m_animationspeed
      type: f4
    - id: m_animationtimeoffset
      type: f4
    - id: m_flags
      type: u4
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pair_d1:
    seq:
    - id: first
      type: int3_storage
    - id: second
      type: tileanimationdata
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d1
  map_d1:
    seq:
    - id: array
      type: array_d2
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  tilemaprefcounteddata:
    seq:
    - id: m_refcount
      type: u4
    - id: m_data
      type: pptr_object
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: tilemaprefcounteddata
  tilemaprefcounteddata_d1:
    seq:
    - id: m_refcount
      type: u4
    - id: m_data
      type: pptr_sprite
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: tilemaprefcounteddata_d1
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
  tilemaprefcounteddata_d2:
    seq:
    - id: m_refcount
      type: u4
    - id: m_data
      type: matrix4x4f
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: tilemaprefcounteddata_d2
  colorrgba:
    seq:
    - id: r
      type: f4
    - id: g
      type: f4
    - id: b
      type: f4
    - id: a
      type: f4
  tilemaprefcounteddata_d3:
    seq:
    - id: m_refcount
      type: u4
    - id: m_data
      type: colorrgba
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: tilemaprefcounteddata_d3
  tilemaprefcounteddata_d4:
    seq:
    - id: m_refcount
      type: u4
    - id: m_data
      type: pptr_gameobject
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: tilemaprefcounteddata_d4
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
