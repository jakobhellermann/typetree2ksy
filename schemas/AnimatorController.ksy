meta:
  bit-endian: le
  endian: le
  id: animatorcontroller
seq:
- id: m_name
  type: string
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_controllersize
  type: u4
- id: m_controller
  type: controllerconstant
- id: m_tos
  type: map
- id: m_animationclips
  type: array_d20
- id: m_statemachinebehaviourvectordescription
  type: statemachinebehaviourvectordescription
- id: m_statemachinebehaviours
  type: array_d22
- id: m_multithreadedstatemachine
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
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
  humanposemask:
    seq:
    - id: word0
      type: u4
    - id: word1
      type: u4
    - id: word2
      type: u4
  skeletonmaskelement:
    seq:
    - id: m_pathhash
      type: u4
    - id: m_weight
      type: f4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: skeletonmaskelement
  skeletonmask:
    seq:
    - id: m_data
      type: array
  offsetptr:
    seq:
    - id: data
      type: skeletonmask
  layerconstant:
    seq:
    - id: m_statemachineindex
      type: u4
    - id: m_statemachinesynchronizedlayerindex
      type: u4
    - id: m_bodymask
      type: humanposemask
    - id: m_skeletonmask
      type: offsetptr
    - id: m_binding
      type: u4
    - id: m_layerblendingmode
      type: s4
    - id: m_defaultweight
      type: f4
    - id: m_ikpass
      type: b1
    - id: m_syncedlayeraffectstiming
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  offsetptr_d1:
    seq:
    - id: data
      type: layerconstant
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: offsetptr_d1
  conditionconstant:
    seq:
    - id: m_conditionmode
      type: u4
    - id: m_eventid
      type: u4
    - id: m_eventthreshold
      type: f4
    - id: m_exittime
      type: f4
  offsetptr_d2:
    seq:
    - id: data
      type: conditionconstant
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: offsetptr_d2
  transitionconstant:
    seq:
    - id: m_conditionconstantarray
      type: array_d2
    - id: m_destinationstate
      type: u4
    - id: m_fullpathid
      type: u4
    - id: m_id
      type: u4
    - id: m_userid
      type: u4
    - id: m_transitionduration
      type: f4
    - id: m_transitionoffset
      type: f4
    - id: m_exittime
      type: f4
    - id: m_hasexittime
      type: b1
    - id: m_hasfixedduration
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_interruptionsource
      type: s4
    - id: m_orderedinterruption
      type: b1
    - id: m_cantransitiontoself
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  offsetptr_d3:
    seq:
    - id: data
      type: transitionconstant
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: offsetptr_d3
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s4
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: f4
  blend1ddataconstant:
    seq:
    - id: m_childthresholdarray
      type: array_d6
  offsetptr_d4:
    seq:
    - id: data
      type: blend1ddataconstant
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vector2f
  motionneighborlist:
    seq:
    - id: m_neighborarray
      type: array_d5
  array_d8:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: motionneighborlist
  blend2ddataconstant:
    seq:
    - id: m_childpositionarray
      type: array_d7
    - id: m_childmagnitudearray
      type: array_d6
    - id: m_childpairvectorarray
      type: array_d7
    - id: m_childpairavgmaginvarray
      type: array_d6
    - id: m_childneighborlistarray
      type: array_d8
  offsetptr_d5:
    seq:
    - id: data
      type: blend2ddataconstant
  blenddirectdataconstant:
    seq:
    - id: m_childblendeventidarray
      type: array_d5
    - id: m_normalizedblendvalues
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  offsetptr_d6:
    seq:
    - id: data
      type: blenddirectdataconstant
  blendtreenodeconstant:
    seq:
    - id: m_blendtype
      type: u4
    - id: m_blendeventid
      type: u4
    - id: m_blendeventyid
      type: u4
    - id: m_childindices
      type: array_d5
    - id: m_blend1ddata
      type: offsetptr_d4
    - id: m_blend2ddata
      type: offsetptr_d5
    - id: m_blenddirectdata
      type: offsetptr_d6
    - id: m_clipid
      type: u4
    - id: m_duration
      type: f4
    - id: m_cycleoffset
      type: f4
    - id: m_mirror
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  offsetptr_d7:
    seq:
    - id: data
      type: blendtreenodeconstant
  array_d9:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: offsetptr_d7
  blendtreeconstant:
    seq:
    - id: m_nodearray
      type: array_d9
  offsetptr_d8:
    seq:
    - id: data
      type: blendtreeconstant
  array_d10:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: offsetptr_d8
  stateconstant:
    seq:
    - id: m_transitionconstantarray
      type: array_d3
    - id: m_blendtreeconstantindexarray
      type: array_d4
    - id: m_blendtreeconstantarray
      type: array_d10
    - id: m_nameid
      type: u4
    - id: m_pathid
      type: u4
    - id: m_fullpathid
      type: u4
    - id: m_tagid
      type: u4
    - id: m_speedparamid
      type: u4
    - id: m_mirrorparamid
      type: u4
    - id: m_cycleoffsetparamid
      type: u4
    - id: m_timeparamid
      type: u4
    - id: m_speed
      type: f4
    - id: m_cycleoffset
      type: f4
    - id: m_ikonfeet
      type: b1
    - id: m_writedefaultvalues
      type: b1
    - id: m_loop
      type: b1
    - id: m_mirror
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  offsetptr_d9:
    seq:
    - id: data
      type: stateconstant
  array_d11:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: offsetptr_d9
  selectortransitionconstant:
    seq:
    - id: m_destination
      type: u4
    - id: m_conditionconstantarray
      type: array_d2
  offsetptr_d10:
    seq:
    - id: data
      type: selectortransitionconstant
  array_d12:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: offsetptr_d10
  selectorstateconstant:
    seq:
    - id: m_transitionconstantarray
      type: array_d12
    - id: m_fullpathid
      type: u4
    - id: m_isentry
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  offsetptr_d11:
    seq:
    - id: data
      type: selectorstateconstant
  array_d13:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: offsetptr_d11
  statemachineconstant:
    seq:
    - id: m_stateconstantarray
      type: array_d11
    - id: m_anystatetransitionconstantarray
      type: array_d3
    - id: m_selectorstateconstantarray
      type: array_d13
    - id: m_defaultstate
      type: u4
    - id: m_synchronizedlayercount
      type: u4
  offsetptr_d12:
    seq:
    - id: data
      type: statemachineconstant
  array_d14:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: offsetptr_d12
  valueconstant:
    seq:
    - id: m_id
      type: u4
    - id: m_type
      type: u4
    - id: m_index
      type: u4
  array_d15:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: valueconstant
  valuearrayconstant:
    seq:
    - id: m_valuearray
      type: array_d15
  offsetptr_d13:
    seq:
    - id: data
      type: valuearrayconstant
  float3:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  array_d16:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: float3
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
  array_d17:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: float4
  array_d18:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: b1
  valuearray:
    seq:
    - id: m_positionvalues
      type: array_d16
    - id: m_quaternionvalues
      type: array_d17
    - id: m_scalevalues
      type: array_d16
    - id: m_floatvalues
      type: array_d6
    - id: m_intvalues
      type: array_d4
    - id: m_boolvalues
      type: array_d18
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  offsetptr_d14:
    seq:
    - id: data
      type: valuearray
  controllerconstant:
    seq:
    - id: m_layerarray
      type: array_d1
    - id: m_statemachinearray
      type: array_d14
    - id: m_values
      type: offsetptr_d13
    - id: m_defaultvalues
      type: offsetptr_d14
  pair:
    seq:
    - id: first
      type: u4
    - id: second
      type: string
  array_d19:
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
      type: array_d19
  pptr_animationclip:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d20:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_animationclip
  statekey:
    seq:
    - id: m_stateid
      type: u4
    - id: m_layerindex
      type: s4
  staterange:
    seq:
    - id: m_startindex
      type: u4
    - id: m_count
      type: u4
  pair_d1:
    seq:
    - id: first
      type: statekey
    - id: second
      type: staterange
  array_d21:
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
      type: array_d21
  statemachinebehaviourvectordescription:
    seq:
    - id: m_statemachinebehaviourranges
      type: map_d1
    - id: m_statemachinebehaviourindices
      type: array_d5
  pptr_monobehaviour:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d22:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_monobehaviour
