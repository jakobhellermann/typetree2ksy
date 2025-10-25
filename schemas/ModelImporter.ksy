meta:
  bit-endian: le
  endian: le
  id: modelimporter
seq:
- id: m_name
  type: string
- id: m_internalidtonametable
  type: array
- id: m_externalobjects
  type: map
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_usedfileids
  type: array_d2
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_supportsembeddedmaterials
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_materialimportmode
  type: s4
- id: m_materialname
  type: s4
- id: m_materialsearch
  type: s4
- id: m_materiallocation
  type: s4
- id: m_materials
  type: array_d3
- id: m_legacygenerateanimations
  type: s4
- id: m_bakesimulation
  type: b1
- id: m_resamplecurves
  type: b1
- id: m_optimizegameobjects
  type: b1
- id: m_removeconstantscalecurves
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_motionnodename
  type: string
- id: m_animationimporterrors
  type: string
- id: m_animationimportwarnings
  type: string
- id: m_animationretargetingwarnings
  type: string
- id: m_animationdoretargetingwarnings
  type: b1
- id: m_importanimatedcustomproperties
  type: b1
- id: m_importconstraints
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_animationcompression
  type: s4
- id: m_animationrotationerror
  type: f4
- id: m_animationpositionerror
  type: f4
- id: m_animationscaleerror
  type: f4
- id: m_animationwrapmode
  type: s4
- id: m_extraexposedtransformpaths
  type: array_d4
- id: m_extrauserproperties
  type: array_d4
- id: m_clipanimations
  type: array_d10
- id: m_isreadable
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_lodscreenpercentages
  type: array_d11
- id: m_globalscale
  type: f4
- id: m_meshcompression
  type: s4
- id: m_addcolliders
  type: b1
- id: m_usesrgbmaterialcolor
  type: b1
- id: m_sorthierarchybyname
  type: b1
- id: m_importphysicalcameras
  type: b1
- id: m_importvisibility
  type: b1
- id: m_importblendshapes
  type: b1
- id: m_importcameras
  type: b1
- id: m_importlights
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_nodenamecollisionstrategy
  type: s4
- id: m_fileidsgeneration
  type: s4
- id: swapuvchannels
  type: b1
- id: generatesecondaryuv
  type: b1
- id: m_usefileunits
  type: b1
- id: keepquads
  type: b1
- id: weldvertices
  type: b1
- id: bakeaxisconversion
  type: b1
- id: m_preservehierarchy
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: skinweightsmode
  type: s4
- id: maxbonespervertex
  type: s4
- id: minboneweight
  type: f4
- id: optimizebones
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: meshoptimizationflags
  type: s4
- id: indexformat
  type: s4
- id: secondaryuvangledistortion
  type: f4
- id: secondaryuvareadistortion
  type: f4
- id: secondaryuvhardangle
  type: f4
- id: secondaryuvmarginmethod
  type: s4
- id: secondaryuvminlightmapresolution
  type: f4
- id: secondaryuvminobjectscale
  type: f4
- id: secondaryuvpackmargin
  type: f4
- id: m_usefilescale
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_filescale
  type: f4
- id: m_filescaleunit
  type: string
- id: m_filescalefactor
  type: f4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_strictvertexdatachecks
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: normalsmoothangle
  type: f4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: normalimportmode
  type: s4
- id: tangentimportmode
  type: s4
- id: normalcalculationmode
  type: s4
- id: legacycomputeallnormalsfromsmoothinggroupswhenmeshhasblendshapes
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: blendshapenormalimportmode
  type: s4
- id: normalsmoothingsource
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_importedtakeinfos
  type: array_d12
- id: m_importedroots
  type: array_d13
- id: m_hasextraroot
  type: b1
- id: m_hasembeddedtextures
  type: b1
- id: m_containsanimation
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_referencedclips
  type: array_d14
- id: m_importanimation
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_humandescription
  type: humandescription
- id: m_lasthumandescriptionavatarsource
  type: pptr_avatar
- id: m_autogenerateavatarmappingifunspecified
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_animationtype
  type: s4
- id: m_humanoidoversampling
  type: s4
- id: m_avatarsetup
  type: s4
- id: m_addhumanoidextrarootonlywhenusingavatar
  type: b1
- id: m_importblendshapedeformpercent
  type: b1
- id: m_remapmaterialsifmaterialimportmodeisnone
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_additionalbone
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_userdata
  type: string
- id: m_assetbundlename
  type: string
- id: m_assetbundlevariant
  type: string
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
  pair:
    seq:
    - id: first
      type: s4
    - id: second
      type: s8
  pair_d1:
    seq:
    - id: first
      type: pair
    - id: second
      type: string
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d1
  sourceassetidentifier:
    seq:
    - id: type
      type: string
    - id: assembly
      type: string
    - id: name
      type: string
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pair_d2:
    seq:
    - id: first
      type: sourceassetidentifier
    - id: second
      type: pptr_object
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d2
  map:
    seq:
    - id: array
      type: array_d1
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s8
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: sourceassetidentifier
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
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
  array_d6:
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
      type: array_d6
    - id: m_preinfinity
      type: s4
    - id: m_postinfinity
      type: s4
    - id: m_rotationorder
      type: s4
  clipanimationinfocurve:
    seq:
    - id: name
      type: string
    - id: curve
      type: animationcurve
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: clipanimationinfocurve
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
  array_d8:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: animationevent
  transformmaskelement:
    seq:
    - id: m_path
      type: string
    - id: m_weight
      type: f4
  array_d9:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: transformmaskelement
  pptr_avatarmask:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  clipanimationinfo:
    seq:
    - id: name
      type: string
    - id: takename
      type: string
    - id: internalid
      type: s8
    - id: firstframe
      type: f4
    - id: lastframe
      type: f4
    - id: wrapmode
      type: s4
    - id: orientationoffsety
      type: f4
    - id: level
      type: f4
    - id: cycleoffset
      type: f4
    - id: loop
      type: b1
    - id: hasadditivereferencepose
      type: b1
    - id: looptime
      type: b1
    - id: loopblend
      type: b1
    - id: loopblendorientation
      type: b1
    - id: loopblendpositiony
      type: b1
    - id: loopblendpositionxz
      type: b1
    - id: keeporiginalorientation
      type: b1
    - id: keeporiginalpositiony
      type: b1
    - id: keeporiginalpositionxz
      type: b1
    - id: heightfromfeet
      type: b1
    - id: mirror
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: bodymask
      type: array_d5
    - id: curves
      type: array_d7
    - id: events
      type: array_d8
    - id: transformmask
      type: array_d9
    - id: masktype
      type: s4
    - id: masksource
      type: pptr_avatarmask
    - id: additivereferenceposeframe
      type: f4
  array_d10:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: clipanimationinfo
  array_d11:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: f4
  pptr_animationclip:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  takeinfo:
    seq:
    - id: name
      type: string
    - id: defaultclipname
      type: string
    - id: internalid
      type: s8
    - id: starttime
      type: f4
    - id: stoptime
      type: f4
    - id: bakestarttime
      type: f4
    - id: bakestoptime
      type: f4
    - id: samplerate
      type: f4
    - id: clip
      type: pptr_animationclip
  array_d12:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: takeinfo
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d13:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_gameobject
  guid:
    seq:
    - id: data_0
      type: u4
    - id: data_1
      type: u4
    - id: data_2
      type: u4
    - id: data_3
      type: u4
  array_d14:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: guid
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  skeletonbonelimit:
    seq:
    - id: m_min
      type: vector3f
    - id: m_max
      type: vector3f
    - id: m_value
      type: vector3f
    - id: m_length
      type: f4
    - id: m_modified
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  humanbone:
    seq:
    - id: m_bonename
      type: string
    - id: m_humanname
      type: string
    - id: m_limit
      type: skeletonbonelimit
  array_d15:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: humanbone
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
  skeletonbone:
    seq:
    - id: m_name
      type: string
    - id: m_parentname
      type: string
    - id: m_position
      type: vector3f
    - id: m_rotation
      type: quaternionf
    - id: m_scale
      type: vector3f
  array_d16:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: skeletonbone
  humandescription:
    seq:
    - id: m_human
      type: array_d15
    - id: m_skeleton
      type: array_d16
    - id: m_armtwist
      type: f4
    - id: m_forearmtwist
      type: f4
    - id: m_upperlegtwist
      type: f4
    - id: m_legtwist
      type: f4
    - id: m_armstretch
      type: f4
    - id: m_legstretch
      type: f4
    - id: m_feetspacing
      type: f4
    - id: m_globalscale
      type: f4
    - id: m_rootmotionbonename
      type: string
    - id: m_hastranslationdof
      type: b1
    - id: m_hasextraroot
      type: b1
    - id: m_skeletonhasparents
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pptr_avatar:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
