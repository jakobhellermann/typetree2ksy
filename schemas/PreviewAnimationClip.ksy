meta:
  bit-endian: le
  endian: le
  id: previewanimationclip
seq:
- id: m_name
  type: string
- id: m_legacy
  type: b1
- id: m_compressed
  type: b1
- id: m_usehighqualitycurve
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_rotationcurves
  type: array_d1
- id: m_compressedrotationcurves
  type: array_d3
- id: m_eulercurves
  type: array_d5
- id: m_positioncurves
  type: array_d5
- id: m_scalecurves
  type: array_d5
- id: m_floatcurves
  type: array_d7
- id: m_pptrcurves
  type: array_d9
- id: m_samplerate
  type: f4
- id: m_wrapmode
  type: s4
- id: m_bounds
  type: aabb
- id: m_muscleclipsize
  type: u4
- id: m_muscleclip
  type: clipmuscleconstant
- id: m_clipbindingconstant
  type: animationclipbindingconstant
- id: m_hasgenericroottransform
  type: b1
- id: m_hasmotionfloatcurves
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_events
  type: array_d19
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
  quaternionf:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
    - id: w
      type: f4
  keyframe:
    seq:
    - id: time
      type: f4
    - id: value
      type: quaternionf
    - id: inslope
      type: quaternionf
    - id: outslope
      type: quaternionf
    - id: weightedmode
      type: s4
    - id: inweight
      type: quaternionf
    - id: outweight
      type: quaternionf
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
  quaternioncurve:
    seq:
    - id: curve
      type: animationcurve
    - id: path
      type: string
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: quaternioncurve
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  packedbitvector:
    seq:
    - id: m_numitems
      type: u4
    - id: m_data
      type: array_d2
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
      type: array_d2
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  packedbitvector_d2:
    seq:
    - id: m_numitems
      type: u4
    - id: m_range
      type: f4
    - id: m_start
      type: f4
    - id: m_data
      type: array_d2
    - id: m_bitsize
      type: u1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  compressedanimationcurve:
    seq:
    - id: m_path
      type: string
    - id: m_times
      type: packedbitvector
    - id: m_values
      type: packedbitvector_d1
    - id: m_slopes
      type: packedbitvector_d2
    - id: m_preinfinity
      type: s4
    - id: m_postinfinity
      type: s4
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: compressedanimationcurve
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  keyframe_d1:
    seq:
    - id: time
      type: f4
    - id: value
      type: vector3f
    - id: inslope
      type: vector3f
    - id: outslope
      type: vector3f
    - id: weightedmode
      type: s4
    - id: inweight
      type: vector3f
    - id: outweight
      type: vector3f
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: keyframe_d1
  animationcurve_d1:
    seq:
    - id: m_curve
      type: array_d4
    - id: m_preinfinity
      type: s4
    - id: m_postinfinity
      type: s4
    - id: m_rotationorder
      type: s4
  vector3curve:
    seq:
    - id: curve
      type: animationcurve_d1
    - id: path
      type: string
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vector3curve
  keyframe_d2:
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
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: keyframe_d2
  animationcurve_d2:
    seq:
    - id: m_curve
      type: array_d6
    - id: m_preinfinity
      type: s4
    - id: m_postinfinity
      type: s4
    - id: m_rotationorder
      type: s4
  pptr_monoscript:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  floatcurve:
    seq:
    - id: curve
      type: animationcurve_d2
    - id: attribute
      type: string
    - id: path
      type: string
    - id: classid
      type: u4
    - id: script
      type: pptr_monoscript
    - id: flags
      type: s4
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: floatcurve
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptrkeyframe:
    seq:
    - id: time
      type: f4
    - id: value
      type: pptr_object
  array_d8:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptrkeyframe
  pptrcurve:
    seq:
    - id: curve
      type: array_d8
    - id: attribute
      type: string
    - id: path
      type: string
    - id: classid
      type: u4
    - id: script
      type: pptr_monoscript
    - id: flags
      type: s4
  array_d9:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptrcurve
  aabb:
    seq:
    - id: m_center
      type: vector3f
    - id: m_extent
      type: vector3f
  float3:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  float4:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
    - id: w
      type: f4
  xform:
    seq:
    - id: t
      type: float3
    - id: q
      type: float4
    - id: s
      type: float3
  humangoal:
    seq:
    - id: m_x
      type: xform
    - id: m_weightt
      type: f4
    - id: m_weightr
      type: f4
    - id: m_hintt
      type: float3
    - id: m_hintweightt
      type: f4
  array_d10:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: humangoal
  array_d11:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: f4
  handpose:
    seq:
    - id: m_grabx
      type: xform
    - id: m_dofarray
      type: array_d11
    - id: m_override
      type: f4
    - id: m_closeopen
      type: f4
    - id: m_inout
      type: f4
    - id: m_grab
      type: f4
  array_d12:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: float3
  humanpose:
    seq:
    - id: m_rootx
      type: xform
    - id: m_lookatposition
      type: float3
    - id: m_lookatweight
      type: float4
    - id: m_goalarray
      type: array_d10
    - id: m_lefthandpose
      type: handpose
    - id: m_righthandpose
      type: handpose
    - id: m_dofarray
      type: array_d11
    - id: m_tdofarray
      type: array_d12
  array_d13:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
  streamedclip:
    seq:
    - id: data
      type: array_d13
    - id: curvecount
      type: u2
    - id: discretecurvecount
      type: u2
  array_d14:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: f4
  denseclip:
    seq:
    - id: m_framecount
      type: s4
    - id: m_curvecount
      type: u4
    - id: m_samplerate
      type: f4
    - id: m_begintime
      type: f4
    - id: m_samplearray
      type: array_d14
  constantclip:
    seq:
    - id: data
      type: array_d14
  clip:
    seq:
    - id: m_streamedclip
      type: streamedclip
    - id: m_denseclip
      type: denseclip
    - id: m_constantclip
      type: constantclip
  offsetptr:
    seq:
    - id: data
      type: clip
  array_d15:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s4
  valuedelta:
    seq:
    - id: m_start
      type: f4
    - id: m_stop
      type: f4
  array_d16:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: valuedelta
  clipmuscleconstant:
    seq:
    - id: m_deltapose
      type: humanpose
    - id: m_startx
      type: xform
    - id: m_stopx
      type: xform
    - id: m_leftfootstartx
      type: xform
    - id: m_rightfootstartx
      type: xform
    - id: m_averagespeed
      type: float3
    - id: m_clip
      type: offsetptr
    - id: m_starttime
      type: f4
    - id: m_stoptime
      type: f4
    - id: m_orientationoffsety
      type: f4
    - id: m_level
      type: f4
    - id: m_cycleoffset
      type: f4
    - id: m_averageangularspeed
      type: f4
    - id: m_indexarray
      type: array_d15
    - id: m_valuearraydelta
      type: array_d16
    - id: m_valuearrayreferencepose
      type: array_d14
    - id: m_mirror
      type: b1
    - id: m_looptime
      type: b1
    - id: m_loopblend
      type: b1
    - id: m_loopblendorientation
      type: b1
    - id: m_loopblendpositiony
      type: b1
    - id: m_loopblendpositionxz
      type: b1
    - id: m_startatorigin
      type: b1
    - id: m_keeporiginalorientation
      type: b1
    - id: m_keeporiginalpositiony
      type: b1
    - id: m_keeporiginalpositionxz
      type: b1
    - id: m_heightfromfeet
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  genericbinding:
    seq:
    - id: path
      type: u4
    - id: attribute
      type: u4
    - id: script
      type: pptr_object
    - id: typeid
      type: s4
    - id: customtype
      type: u1
    - id: ispptrcurve
      type: u1
    - id: isintcurve
      type: u1
    - id: isserializereferencecurve
      type: u1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d17:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: genericbinding
  array_d18:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_object
  animationclipbindingconstant:
    seq:
    - id: genericbindings
      type: array_d17
    - id: pptrcurvemapping
      type: array_d18
  animationevent:
    seq:
    - id: time
      type: f4
    - id: functionname
      type: string
    - id: data
      type: string
    - id: objectreferenceparameter
      type: pptr_object
    - id: floatparameter
      type: f4
    - id: intparameter
      type: s4
    - id: messageoptions
      type: s4
  array_d19:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: animationevent
