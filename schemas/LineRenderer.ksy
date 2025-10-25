meta:
  bit-endian: le
  endian: le
  id: linerenderer
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: b1
- id: m_castshadows
  type: u1
- id: m_receiveshadows
  type: u1
- id: m_dynamicoccludee
  type: u1
- id: m_staticshadowcaster
  type: u1
- id: m_motionvectors
  type: u1
- id: m_lightprobeusage
  type: u1
- id: m_reflectionprobeusage
  type: u1
- id: m_raytracingmode
  type: u1
- id: m_raytraceprocedural
  type: u1
- id: m_raytracingaccelstructbuildflagsoverride
  type: u1
- id: m_raytracingaccelstructbuildflags
  type: u1
- id: m_smallmeshculling
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_renderinglayermask
  type: u4
- id: m_rendererpriority
  type: s4
- id: m_lightmapindex
  type: u2
- id: m_lightmapindexdynamic
  type: u2
- id: m_lightmaptilingoffset
  type: vector4f
- id: m_lightmaptilingoffsetdynamic
  type: vector4f
- id: m_materials
  type: array
- id: m_staticbatchinfo
  type: staticbatchinfo
- id: m_staticbatchroot
  type: pptr_transform
- id: m_probeanchor
  type: pptr_transform
- id: m_lightprobevolumeoverride
  type: pptr_gameobject
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_sortinglayerid
  type: s4
- id: m_sortinglayer
  type: s2
- id: m_sortingorder
  type: s2
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_positions
  type: array_d1
- id: m_parameters
  type: lineparameters
- id: m_maskinteraction
  type: s4
- id: m_useworldspace
  type: b1
- id: m_loop
  type: b1
- id: m_applyactivecolorspace
  type: b1
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
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
  pptr_material:
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
      type: pptr_material
  staticbatchinfo:
    seq:
    - id: firstsubmesh
      type: u2
    - id: submeshcount
      type: u2
  pptr_transform:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
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
  array_d2:
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
      type: array_d2
    - id: m_preinfinity
      type: s4
    - id: m_postinfinity
      type: s4
    - id: m_rotationorder
      type: s4
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
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  lineparameters:
    seq:
    - id: widthmultiplier
      type: f4
    - id: widthcurve
      type: animationcurve
    - id: colorgradient
      type: gradient
    - id: numcornervertices
      type: s4
    - id: numcapvertices
      type: s4
    - id: alignment
      type: s4
    - id: texturemode
      type: s4
    - id: texturescale
      type: vector2f
    - id: shadowbias
      type: f4
    - id: generatelightingdata
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
