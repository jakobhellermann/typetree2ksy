meta:
  bit-endian: le
  endian: le
  id: particlesystem
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: lengthinsec
  type: f4
- id: simulationspeed
  type: f4
- id: stopaction
  type: s4
- id: cullingmode
  type: s4
- id: ringbuffermode
  type: s4
- id: ringbufferlooprange
  type: vector2f
- id: emittervelocitymode
  type: s4
- id: looping
  type: b1
- id: prewarm
  type: b1
- id: playonawake
  type: b1
- id: useunscaledtime
  type: b1
- id: autorandomseed
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: startdelay
  type: minmaxcurve
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: movewithtransform
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: movewithcustomtransform
  type: pptr_transform
- id: scalingmode
  type: s4
- id: randomseed
  type: s4
- id: initialmodule
  type: initialmodule
- id: shapemodule
  type: shapemodule
- id: emissionmodule
  type: emissionmodule
- id: sizemodule
  type: sizemodule
- id: rotationmodule
  type: rotationmodule
- id: colormodule
  type: colormodule
- id: uvmodule
  type: uvmodule
- id: velocitymodule
  type: velocitymodule
- id: inheritvelocitymodule
  type: inheritvelocitymodule
- id: lifetimebyemitterspeedmodule
  type: lifetimebyemitterspeedmodule
- id: forcemodule
  type: forcemodule
- id: externalforcesmodule
  type: externalforcesmodule
- id: clampvelocitymodule
  type: clampvelocitymodule
- id: noisemodule
  type: noisemodule
- id: sizebyspeedmodule
  type: sizebyspeedmodule
- id: rotationbyspeedmodule
  type: rotationbyspeedmodule
- id: colorbyspeedmodule
  type: colorbyspeedmodule
- id: collisionmodule
  type: collisionmodule
- id: triggermodule
  type: triggermodule
- id: submodule
  type: submodule
- id: lightsmodule
  type: lightsmodule
- id: trailmodule
  type: trailmodule
- id: customdatamodule
  type: customdatamodule
types:
  pptr_gameobject:
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
  array:
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
      type: array
    - id: m_preinfinity
      type: s4
    - id: m_postinfinity
      type: s4
    - id: m_rotationorder
      type: s4
  minmaxcurve:
    seq:
    - id: minmaxstate
      type: u2
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: scalar
      type: f4
    - id: minscalar
      type: f4
    - id: maxcurve
      type: animationcurve
    - id: mincurve
      type: animationcurve
  pptr_transform:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
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
  minmaxgradient:
    seq:
    - id: minmaxstate
      type: u2
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: mincolor
      type: colorrgba
    - id: maxcolor
      type: colorrgba
    - id: maxgradient
      type: gradient
    - id: mingradient
      type: gradient
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  initialmodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: startlifetime
      type: minmaxcurve
    - id: startspeed
      type: minmaxcurve
    - id: startcolor
      type: minmaxgradient
    - id: startsize
      type: minmaxcurve
    - id: startsizey
      type: minmaxcurve
    - id: startsizez
      type: minmaxcurve
    - id: startrotationx
      type: minmaxcurve
    - id: startrotationy
      type: minmaxcurve
    - id: startrotation
      type: minmaxcurve
    - id: randomizerotationdirection
      type: f4
    - id: gravitysource
      type: s4
    - id: maxnumparticles
      type: s4
    - id: customemittervelocity
      type: vector3f
    - id: size3d
      type: b1
    - id: rotation3d
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: gravitymodifier
      type: minmaxcurve
  multimodeparameter:
    seq:
    - id: mode
      type: s4
    - id: spread
      type: f4
    - id: speed
      type: minmaxcurve
  pptr_mesh:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_meshrenderer:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_skinnedmeshrenderer:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_sprite:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_spriterenderer:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_texture2d:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  multimodeparameter_d1:
    seq:
    - id: value
      type: f4
    - id: mode
      type: s4
    - id: spread
      type: f4
    - id: speed
      type: minmaxcurve
  shapemodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: type
      type: s4
    - id: angle
      type: f4
    - id: length
      type: f4
    - id: boxthickness
      type: vector3f
    - id: radiusthickness
      type: f4
    - id: donutradius
      type: f4
    - id: m_position
      type: vector3f
    - id: m_rotation
      type: vector3f
    - id: m_scale
      type: vector3f
    - id: placementmode
      type: s4
    - id: m_meshmaterialindex
      type: s4
    - id: m_meshnormaloffset
      type: f4
    - id: m_meshspawn
      type: multimodeparameter
    - id: m_mesh
      type: pptr_mesh
    - id: m_meshrenderer
      type: pptr_meshrenderer
    - id: m_skinnedmeshrenderer
      type: pptr_skinnedmeshrenderer
    - id: m_sprite
      type: pptr_sprite
    - id: m_spriterenderer
      type: pptr_spriterenderer
    - id: m_usemeshmaterialindex
      type: b1
    - id: m_usemeshcolors
      type: b1
    - id: aligntodirection
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_texture
      type: pptr_texture2d
    - id: m_textureclipchannel
      type: s4
    - id: m_textureclipthreshold
      type: f4
    - id: m_textureuvchannel
      type: s4
    - id: m_texturecoloraffectsparticles
      type: b1
    - id: m_texturealphaaffectsparticles
      type: b1
    - id: m_texturebilinearfiltering
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: randomdirectionamount
      type: f4
    - id: sphericaldirectionamount
      type: f4
    - id: randompositionamount
      type: f4
    - id: radius
      type: multimodeparameter_d1
    - id: arc
      type: multimodeparameter_d1
  particlesystememissionburst:
    seq:
    - id: time
      type: f4
    - id: countcurve
      type: minmaxcurve
    - id: cyclecount
      type: s4
    - id: repeatinterval
      type: f4
    - id: probability
      type: f4
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: particlesystememissionburst
  emissionmodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: rateovertime
      type: minmaxcurve
    - id: rateoverdistance
      type: minmaxcurve
    - id: m_burstcount
      type: s4
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_bursts
      type: array_d1
  sizemodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: curve
      type: minmaxcurve
    - id: y
      type: minmaxcurve
    - id: z
      type: minmaxcurve
    - id: separateaxes
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  rotationmodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: x
      type: minmaxcurve
    - id: y
      type: minmaxcurve
    - id: curve
      type: minmaxcurve
    - id: separateaxes
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  colormodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: gradient
      type: minmaxgradient
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  spritedata:
    seq:
    - id: sprite
      type: pptr_object
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: spritedata
  uvmodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: mode
      type: s4
    - id: timemode
      type: s4
    - id: fps
      type: f4
    - id: frameovertime
      type: minmaxcurve
    - id: startframe
      type: minmaxcurve
    - id: speedrange
      type: vector2f
    - id: tilesx
      type: s4
    - id: tilesy
      type: s4
    - id: animationtype
      type: s4
    - id: rowindex
      type: s4
    - id: cycles
      type: f4
    - id: uvchannelmask
      type: s4
    - id: rowmode
      type: s4
    - id: sprites
      type: array_d2
    - id: flipu
      type: f4
    - id: flipv
      type: f4
  velocitymodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: x
      type: minmaxcurve
    - id: y
      type: minmaxcurve
    - id: z
      type: minmaxcurve
    - id: orbitalx
      type: minmaxcurve
    - id: orbitaly
      type: minmaxcurve
    - id: orbitalz
      type: minmaxcurve
    - id: orbitaloffsetx
      type: minmaxcurve
    - id: orbitaloffsety
      type: minmaxcurve
    - id: orbitaloffsetz
      type: minmaxcurve
    - id: radial
      type: minmaxcurve
    - id: speedmodifier
      type: minmaxcurve
    - id: inworldspace
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  inheritvelocitymodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_mode
      type: s4
    - id: m_curve
      type: minmaxcurve
  lifetimebyemitterspeedmodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_curve
      type: minmaxcurve
    - id: m_range
      type: vector2f
  forcemodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: x
      type: minmaxcurve
    - id: y
      type: minmaxcurve
    - id: z
      type: minmaxcurve
    - id: inworldspace
      type: b1
    - id: randomizeperframe
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  bitfield:
    seq:
    - id: m_bits
      type: u4
  pptr_particlesystemforcefield:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_particlesystemforcefield
  externalforcesmodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: multipliercurve
      type: minmaxcurve
    - id: influencefilter
      type: s4
    - id: influencemask
      type: bitfield
    - id: influencelist
      type: array_d3
  clampvelocitymodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: x
      type: minmaxcurve
    - id: y
      type: minmaxcurve
    - id: z
      type: minmaxcurve
    - id: magnitude
      type: minmaxcurve
    - id: separateaxis
      type: b1
    - id: inworldspace
      type: b1
    - id: multiplydragbyparticlesize
      type: b1
    - id: multiplydragbyparticlevelocity
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: dampen
      type: f4
    - id: drag
      type: minmaxcurve
  noisemodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: strength
      type: minmaxcurve
    - id: strengthy
      type: minmaxcurve
    - id: strengthz
      type: minmaxcurve
    - id: separateaxes
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: frequency
      type: f4
    - id: damping
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: octaves
      type: s4
    - id: octavemultiplier
      type: f4
    - id: octavescale
      type: f4
    - id: quality
      type: s4
    - id: scrollspeed
      type: minmaxcurve
    - id: remap
      type: minmaxcurve
    - id: remapy
      type: minmaxcurve
    - id: remapz
      type: minmaxcurve
    - id: remapenabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: positionamount
      type: minmaxcurve
    - id: rotationamount
      type: minmaxcurve
    - id: sizeamount
      type: minmaxcurve
  sizebyspeedmodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: curve
      type: minmaxcurve
    - id: y
      type: minmaxcurve
    - id: z
      type: minmaxcurve
    - id: range
      type: vector2f
    - id: separateaxes
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  rotationbyspeedmodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: x
      type: minmaxcurve
    - id: y
      type: minmaxcurve
    - id: curve
      type: minmaxcurve
    - id: separateaxes
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: range
      type: vector2f
  colorbyspeedmodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: gradient
      type: minmaxgradient
    - id: range
      type: vector2f
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_transform
  collisionmodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: type
      type: s4
    - id: collisionmode
      type: s4
    - id: colliderforce
      type: f4
    - id: multiplycolliderforcebyparticlesize
      type: b1
    - id: multiplycolliderforcebyparticlespeed
      type: b1
    - id: multiplycolliderforcebycollisionangle
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_planes
      type: array_d4
    - id: m_dampen
      type: minmaxcurve
    - id: m_bounce
      type: minmaxcurve
    - id: m_energylossoncollision
      type: minmaxcurve
    - id: minkillspeed
      type: f4
    - id: maxkillspeed
      type: f4
    - id: radiusscale
      type: f4
    - id: collideswith
      type: bitfield
    - id: maxcollisionshapes
      type: s4
    - id: quality
      type: s4
    - id: voxelsize
      type: f4
    - id: collisionmessages
      type: b1
    - id: collideswithdynamic
      type: b1
    - id: interiorcollisions
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pptr_component:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_component
  triggermodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: inside
      type: s4
    - id: outside
      type: s4
    - id: enter
      type: s4
    - id: exit
      type: s4
    - id: colliderquerymode
      type: s4
    - id: radiusscale
      type: f4
    - id: primitives
      type: array_d5
  pptr_particlesystem:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  subemitterdata:
    seq:
    - id: emitter
      type: pptr_particlesystem
    - id: type
      type: s4
    - id: properties
      type: s4
    - id: emitprobability
      type: f4
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: subemitterdata
  submodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: subemitters
      type: array_d6
  pptr_light:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  lightsmodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: ratio
      type: f4
    - id: light
      type: pptr_light
    - id: randomdistribution
      type: b1
    - id: color
      type: b1
    - id: range
      type: b1
    - id: intensity
      type: b1
    - id: rangecurve
      type: minmaxcurve
    - id: intensitycurve
      type: minmaxcurve
    - id: maxlights
      type: s4
  trailmodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: mode
      type: s4
    - id: ratio
      type: f4
    - id: lifetime
      type: minmaxcurve
    - id: minvertexdistance
      type: f4
    - id: texturemode
      type: s4
    - id: texturescale
      type: vector2f
    - id: ribboncount
      type: s4
    - id: shadowbias
      type: f4
    - id: worldspace
      type: b1
    - id: diewithparticles
      type: b1
    - id: sizeaffectswidth
      type: b1
    - id: sizeaffectslifetime
      type: b1
    - id: inheritparticlecolor
      type: b1
    - id: generatelightingdata
      type: b1
    - id: splitsubemitterribbons
      type: b1
    - id: attachribbonstotransform
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: coloroverlifetime
      type: minmaxgradient
    - id: widthovertrail
      type: minmaxcurve
    - id: colorovertrail
      type: minmaxgradient
  customdatamodule:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: mode0
      type: s4
    - id: vectorcomponentcount0
      type: s4
    - id: color0
      type: minmaxgradient
    - id: vector0_0
      type: minmaxcurve
    - id: vector0_1
      type: minmaxcurve
    - id: vector0_2
      type: minmaxcurve
    - id: vector0_3
      type: minmaxcurve
    - id: mode1
      type: s4
    - id: vectorcomponentcount1
      type: s4
    - id: color1
      type: minmaxgradient
    - id: vector1_0
      type: minmaxcurve
    - id: vector1_1
      type: minmaxcurve
    - id: vector1_2
      type: minmaxcurve
    - id: vector1_3
      type: minmaxcurve
