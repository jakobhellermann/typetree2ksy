meta:
  bit-endian: le
  endian: le
  id: visualeffectasset
seq:
- id: m_name
  type: string
- id: m_infos
  type: visualeffectinfo
- id: m_systems
  type: array_d24
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
  vfxrenderersettings:
    seq:
    - id: motionvectorgenerationmode
      type: s4
    - id: shadowcastingmode
      type: s4
    - id: raytracingmode
      type: s4
    - id: receiveshadows
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: reflectionprobeusage
      type: s4
    - id: lightprobeusage
      type: s4
  expression:
    seq:
    - id: op
      type: s4
    - id: valueindex
      type: s4
    - id: data_0
      type: s4
    - id: data_1
      type: s4
    - id: data_2
      type: s4
    - id: data_3
      type: s4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: expression
  vfxexpressioncontainer:
    seq:
    - id: m_expressions
      type: array
    - id: m_maxcommonexpressionsindex
      type: u4
    - id: m_constantbakecurvecount
      type: u4
    - id: m_constantbakegradientcount
      type: u4
    - id: m_dynamicbakecurvecount
      type: u4
    - id: m_dynamicbakegradientcount
      type: u4
    - id: m_needslocaltoworld
      type: b1
    - id: m_needsworldtolocal
      type: b1
    - id: m_needsmaincamera
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_neededmaincamerabuffers
      type: s4
  vfxentryexpressionvalue:
    seq:
    - id: m_expressionindex
      type: u4
    - id: m_value
      type: f4
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
      type: vfxentryexpressionvalue
  vfxfield:
    seq:
    - id: m_array
      type: array_d1
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  vfxentryexpressionvalue_d1:
    seq:
    - id: m_expressionindex
      type: u4
    - id: m_value
      type: vector2f
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
      type: vfxentryexpressionvalue_d1
  vfxfield_d1:
    seq:
    - id: m_array
      type: array_d2
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  vfxentryexpressionvalue_d2:
    seq:
    - id: m_expressionindex
      type: u4
    - id: m_value
      type: vector3f
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
      type: vfxentryexpressionvalue_d2
  vfxfield_d2:
    seq:
    - id: m_array
      type: array_d3
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
  vfxentryexpressionvalue_d3:
    seq:
    - id: m_expressionindex
      type: u4
    - id: m_value
      type: vector4f
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
      type: vfxentryexpressionvalue_d3
  vfxfield_d3:
    seq:
    - id: m_array
      type: array_d4
  vfxentryexpressionvalue_d4:
    seq:
    - id: m_expressionindex
      type: u4
    - id: m_value
      type: u4
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
      type: vfxentryexpressionvalue_d4
  vfxfield_d4:
    seq:
    - id: m_array
      type: array_d5
  vfxentryexpressionvalue_d5:
    seq:
    - id: m_expressionindex
      type: u4
    - id: m_value
      type: s4
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
      type: vfxentryexpressionvalue_d5
  vfxfield_d5:
    seq:
    - id: m_array
      type: array_d6
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
  vfxentryexpressionvalue_d6:
    seq:
    - id: m_expressionindex
      type: u4
    - id: m_value
      type: matrix4x4f
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxentryexpressionvalue_d6
  vfxfield_d6:
    seq:
    - id: m_array
      type: array_d7
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
  array_d8:
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
      type: array_d8
    - id: m_preinfinity
      type: s4
    - id: m_postinfinity
      type: s4
    - id: m_rotationorder
      type: s4
  vfxentryexpressionvalue_d7:
    seq:
    - id: m_expressionindex
      type: u4
    - id: m_value
      type: animationcurve
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
      type: vfxentryexpressionvalue_d7
  vfxfield_d7:
    seq:
    - id: m_array
      type: array_d9
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
  vfxentryexpressionvalue_d8:
    seq:
    - id: m_expressionindex
      type: u4
    - id: m_value
      type: gradient
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
      type: vfxentryexpressionvalue_d8
  vfxfield_d8:
    seq:
    - id: m_array
      type: array_d10
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  vfxentryexpressionvalue_d9:
    seq:
    - id: m_expressionindex
      type: u4
    - id: m_value
      type: pptr_object
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
      type: vfxentryexpressionvalue_d9
  vfxfield_d9:
    seq:
    - id: m_array
      type: array_d11
  vfxentryexpressionvalue_d10:
    seq:
    - id: m_expressionindex
      type: u4
    - id: m_value
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d12:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxentryexpressionvalue_d10
  vfxfield_d10:
    seq:
    - id: m_array
      type: array_d12
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
  vfxmapping:
    seq:
    - id: nameid
      type: string
    - id: index
      type: s4
  vfxexposedmapping:
    seq:
    - id: mapping
      type: vfxmapping
    - id: space
      type: s4
  array_d13:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxexposedmapping
  vfxlayoutoffset:
    seq:
    - id: bucket
      type: u4
    - id: structure
      type: u4
    - id: element
      type: u4
  vfxlayoutelementdesc:
    seq:
    - id: name
      type: string
    - id: type
      type: s4
    - id: offset
      type: vfxlayoutoffset
  array_d14:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxlayoutelementdesc
  vfxgpubufferdesc:
    seq:
    - id: target
      type: s4
    - id: size
      type: u4
    - id: layout
      type: array_d14
    - id: capacity
      type: u4
    - id: stride
      type: u4
    - id: mode
      type: s4
  array_d15:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxgpubufferdesc
  vfxtemporarygpubufferdesc:
    seq:
    - id: desc
      type: vfxgpubufferdesc
    - id: framecount
      type: u4
  array_d16:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxtemporarygpubufferdesc
  array_d17:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
  vfxcpubufferdata:
    seq:
    - id: data
      type: array_d17
  vfxcpubufferdesc:
    seq:
    - id: capacity
      type: u4
    - id: stride
      type: u4
    - id: layout
      type: array_d14
    - id: initialdata
      type: vfxcpubufferdata
  array_d18:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxcpubufferdesc
  vfxeventdesc:
    seq:
    - id: name
      type: string
    - id: playsystems
      type: array_d17
    - id: stopsystems
      type: array_d17
    - id: initsystems
      type: array_d17
  array_d19:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxeventdesc
  visualeffectinfo:
    seq:
    - id: m_renderersettings
      type: vfxrenderersettings
    - id: m_cullingflags
      type: s4
    - id: m_updatemode
      type: s4
    - id: m_prewarmdeltatime
      type: f4
    - id: m_prewarmstepcount
      type: u4
    - id: m_initialeventname
      type: string
    - id: m_instancingmode
      type: s4
    - id: m_instancingcapacity
      type: u4
    - id: m_expressions
      type: vfxexpressioncontainer
    - id: m_propertysheet
      type: vfxpropertysheetserializedbase
    - id: m_exposedexpressions
      type: array_d13
    - id: m_buffers
      type: array_d15
    - id: m_temporarybuffers
      type: array_d16
    - id: m_cpubuffers
      type: array_d18
    - id: m_events
      type: array_d19
    - id: m_instancingdisabledreason
      type: s4
    - id: m_runtimeversion
      type: u4
    - id: m_compilationversion
      type: u4
  array_d20:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxmapping
  vfxmappingtemporary:
    seq:
    - id: mapping
      type: vfxmapping
    - id: pastframeindex
      type: u4
    - id: percamerabuffer
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d21:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxmappingtemporary
  pptr_namedobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  vfxtaskdesc:
    seq:
    - id: type
      type: s4
    - id: buffers
      type: array_d20
    - id: temporarybuffers
      type: array_d21
    - id: values
      type: array_d20
    - id: params
      type: array_d20
    - id: processor
      type: pptr_namedobject
    - id: instancesplitindex
      type: u4
  array_d22:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxtaskdesc
  vfxinstancesplitdesc:
    seq:
    - id: values
      type: array_d17
  array_d23:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxinstancesplitdesc
  vfxsystemdesc:
    seq:
    - id: type
      type: s4
    - id: flags
      type: s4
    - id: capacity
      type: u4
    - id: layer
      type: u4
    - id: name
      type: string
    - id: buffers
      type: array_d20
    - id: values
      type: array_d20
    - id: tasks
      type: array_d22
    - id: instancesplitdescs
      type: array_d23
  array_d24:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vfxsystemdesc
