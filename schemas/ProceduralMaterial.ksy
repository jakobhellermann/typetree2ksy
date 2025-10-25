meta:
  bit-endian: le
  endian: le
  id: proceduralmaterial
seq:
- id: m_name
  type: string
- id: m_shader
  type: pptr_shader
- id: m_validkeywords
  type: array
- id: m_invalidkeywords
  type: array
- id: m_lightmapflags
  type: u4
- id: m_enableinstancingvariants
  type: b1
- id: m_doublesidedgi
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_customrenderqueue
  type: s4
- id: stringtagmap
  type: map
- id: disabledshaderpasses
  type: array
- id: m_savedproperties
  type: unitypropertysheet
- id: m_buildtexturestacks
  type: array_d6
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
  pptr_shader:
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
      type: string
  pair:
    seq:
    - id: first
      type: string
    - id: second
      type: string
  array_d1:
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
      type: array_d1
  pptr_texture:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  unitytexenv:
    seq:
    - id: m_texture
      type: pptr_texture
    - id: m_scale
      type: vector2f
    - id: m_offset
      type: vector2f
  pair_d1:
    seq:
    - id: first
      type: string
    - id: second
      type: unitytexenv
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
  pair_d2:
    seq:
    - id: first
      type: string
    - id: second
      type: s4
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d2
  map_d2:
    seq:
    - id: array
      type: array_d3
  pair_d3:
    seq:
    - id: first
      type: string
    - id: second
      type: f4
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d3
  map_d3:
    seq:
    - id: array
      type: array_d4
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
  pair_d4:
    seq:
    - id: first
      type: string
    - id: second
      type: colorrgba
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d4
  map_d4:
    seq:
    - id: array
      type: array_d5
  unitypropertysheet:
    seq:
    - id: m_texenvs
      type: map_d1
    - id: m_ints
      type: map_d2
    - id: m_floats
      type: map_d3
    - id: m_colors
      type: map_d4
  buildtexturestackreference:
    seq:
    - id: groupname
      type: string
    - id: itemname
      type: string
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: buildtexturestackreference
