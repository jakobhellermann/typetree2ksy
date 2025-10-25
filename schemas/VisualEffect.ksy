meta:
  bit-endian: le
  endian: le
  id: visualeffect
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_asset
  type: pptr_visualeffectasset
- id: m_initialeventname
  type: string
- id: m_initialeventnameoverriden
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_startseed
  type: u4
- id: m_resetseedonplay
  type: u1
- id: m_allowinstancing
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_propertysheet
  type: vfxpropertysheetserializedbase
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_visualeffectasset:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
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
  vfxentryexposed:
    seq:
    - id: m_value
      type: f4
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_name
      type: string
    - id: m_overridden
      type: b1
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
      type: vfxentryexposed
  vfxfield:
    seq:
    - id: m_array
      type: array
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  vfxentryexposed_d1:
    seq:
    - id: m_value
      type: vector2f
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_name
      type: string
    - id: m_overridden
      type: b1
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
      type: vfxentryexposed_d1
  vfxfield_d1:
    seq:
    - id: m_array
      type: array_d1
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  vfxentryexposed_d2:
    seq:
    - id: m_value
      type: vector3f
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_name
      type: string
    - id: m_overridden
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
      type: vfxentryexposed_d2
  vfxfield_d2:
    seq:
    - id: m_array
      type: array_d2
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
  vfxentryexposed_d3:
    seq:
    - id: m_value
      type: vector4f
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_name
      type: string
    - id: m_overridden
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxentryexposed_d3
  vfxfield_d3:
    seq:
    - id: m_array
      type: array_d3
  vfxentryexposed_d4:
    seq:
    - id: m_value
      type: u4
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_name
      type: string
    - id: m_overridden
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxentryexposed_d4
  vfxfield_d4:
    seq:
    - id: m_array
      type: array_d4
  vfxentryexposed_d5:
    seq:
    - id: m_value
      type: s4
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_name
      type: string
    - id: m_overridden
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxentryexposed_d5
  vfxfield_d5:
    seq:
    - id: m_array
      type: array_d5
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
  vfxentryexposed_d6:
    seq:
    - id: m_value
      type: matrix4x4f
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_name
      type: string
    - id: m_overridden
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxentryexposed_d6
  vfxfield_d6:
    seq:
    - id: m_array
      type: array_d6
  keyframe:
    seq:
    - id: time
      type: f4
    - id: value
      type: f4
    - id: inslope
      type: f4
    - id: outslope
      type: f4
    - id: weightedmode
      type: s4
    - id: inweight
      type: f4
    - id: outweight
      type: f4
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: keyframe
  animationcurve:
    seq:
    - id: m_curve
      type: array_d7
    - id: m_preinfinity
      type: s4
    - id: m_postinfinity
      type: s4
    - id: m_rotationorder
      type: s4
  vfxentryexposed_d7:
    seq:
    - id: m_value
      type: animationcurve
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_name
      type: string
    - id: m_overridden
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d8:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxentryexposed_d7
  vfxfield_d7:
    seq:
    - id: m_array
      type: array_d8
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
  gradient:
    seq:
    - id: key0
      type: colorrgba
    - id: key1
      type: colorrgba
    - id: key2
      type: colorrgba
    - id: key3
      type: colorrgba
    - id: key4
      type: colorrgba
    - id: key5
      type: colorrgba
    - id: key6
      type: colorrgba
    - id: key7
      type: colorrgba
    - id: ctime0
      type: u2
    - id: ctime1
      type: u2
    - id: ctime2
      type: u2
    - id: ctime3
      type: u2
    - id: ctime4
      type: u2
    - id: ctime5
      type: u2
    - id: ctime6
      type: u2
    - id: ctime7
      type: u2
    - id: atime0
      type: u2
    - id: atime1
      type: u2
    - id: atime2
      type: u2
    - id: atime3
      type: u2
    - id: atime4
      type: u2
    - id: atime5
      type: u2
    - id: atime6
      type: u2
    - id: atime7
      type: u2
    - id: m_mode
      type: u1
    - id: m_colorspace
      type: s1
    - id: m_numcolorkeys
      type: u1
    - id: m_numalphakeys
      type: u1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  vfxentryexposed_d8:
    seq:
    - id: m_value
      type: gradient
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_name
      type: string
    - id: m_overridden
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d9:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxentryexposed_d8
  vfxfield_d8:
    seq:
    - id: m_array
      type: array_d9
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  vfxentryexposed_d9:
    seq:
    - id: m_value
      type: pptr_object
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_name
      type: string
    - id: m_overridden
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d10:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxentryexposed_d9
  vfxfield_d9:
    seq:
    - id: m_array
      type: array_d10
  vfxentryexposed_d10:
    seq:
    - id: m_value
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_name
      type: string
    - id: m_overridden
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d11:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxentryexposed_d10
  vfxfield_d10:
    seq:
    - id: m_array
      type: array_d11
  vfxpropertysheetserializedbase:
    seq:
    - id: m_float
      type: vfxfield
    - id: m_vector2f
      type: vfxfield_d1
    - id: m_vector3f
      type: vfxfield_d2
    - id: m_vector4f
      type: vfxfield_d3
    - id: m_uint
      type: vfxfield_d4
    - id: m_int
      type: vfxfield_d5
    - id: m_matrix4x4f
      type: vfxfield_d6
    - id: m_animationcurve
      type: vfxfield_d7
    - id: m_gradient
      type: vfxfield_d8
    - id: m_namedobject
      type: vfxfield_d9
    - id: m_bool
      type: vfxfield_d10
