meta:
  bit-endian: le
  endian: le
  id: particlesystemforcefield
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_parameters
  type: particlesystemforcefieldparameters
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
  pptr_texture3d:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  particlesystemforcefieldparameters:
    seq:
    - id: m_shape
      type: s4
    - id: m_startrange
      type: f4
    - id: m_endrange
      type: f4
    - id: m_length
      type: f4
    - id: m_gravityfocus
      type: f4
    - id: m_rotationrandomness
      type: vector2f
    - id: m_directioncurvex
      type: minmaxcurve
    - id: m_directioncurvey
      type: minmaxcurve
    - id: m_directioncurvez
      type: minmaxcurve
    - id: m_gravitycurve
      type: minmaxcurve
    - id: m_rotationspeedcurve
      type: minmaxcurve
    - id: m_rotationattractioncurve
      type: minmaxcurve
    - id: m_dragcurve
      type: minmaxcurve
    - id: m_vectorfield
      type: pptr_texture3d
    - id: m_vectorfieldspeedcurve
      type: minmaxcurve
    - id: m_vectorfieldattractioncurve
      type: minmaxcurve
    - id: m_multiplydragbyparticlesize
      type: b1
    - id: m_multiplydragbyparticlevelocity
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
