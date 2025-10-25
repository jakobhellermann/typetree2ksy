meta:
  bit-endian: le
  endian: le
  id: avatar
seq:
- id: m_name
  type: string
- id: m_avatarsize
  type: u4
- id: m_avatar
  type: avatarconstant
- id: m_tos
  type: map
- id: m_humandescription
  type: humandescription
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
  node:
    seq:
    - id: m_parentid
      type: s4
    - id: m_axesid
      type: s4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: node
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
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
  float3:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  limit:
    seq:
    - id: m_min
      type: float3
    - id: m_max
      type: float3
  axes:
    seq:
    - id: m_preq
      type: float4
    - id: m_postq
      type: float4
    - id: m_sgn
      type: float3
    - id: m_limit
      type: limit
    - id: m_length
      type: f4
    - id: m_type
      type: u4
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: axes
  skeleton:
    seq:
    - id: m_node
      type: array
    - id: m_id
      type: array_d1
    - id: m_axesarray
      type: array_d2
  offsetptr:
    seq:
    - id: data
      type: skeleton
  xform:
    seq:
    - id: t
      type: float3
    - id: q
      type: float4
    - id: s
      type: float3
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: xform
  skeletonpose:
    seq:
    - id: m_x
      type: array_d3
  offsetptr_d1:
    seq:
    - id: data
      type: skeletonpose
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s4
  hand:
    seq:
    - id: m_handboneindex
      type: array_d4
  offsetptr_d2:
    seq:
    - id: data
      type: hand
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: f4
  human:
    seq:
    - id: m_rootx
      type: xform
    - id: m_skeleton
      type: offsetptr
    - id: m_skeletonpose
      type: offsetptr_d1
    - id: m_lefthand
      type: offsetptr_d2
    - id: m_righthand
      type: offsetptr_d2
    - id: m_humanboneindex
      type: array_d4
    - id: m_humanbonemass
      type: array_d5
    - id: m_scale
      type: f4
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
    - id: m_haslefthand
      type: b1
    - id: m_hasrighthand
      type: b1
    - id: m_hastdof
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  offsetptr_d3:
    seq:
    - id: data
      type: human
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s4
  avatarconstant:
    seq:
    - id: m_avatarskeleton
      type: offsetptr
    - id: m_avatarskeletonpose
      type: offsetptr_d1
    - id: m_defaultpose
      type: offsetptr_d1
    - id: m_skeletonnameidarray
      type: array_d1
    - id: m_human
      type: offsetptr_d3
    - id: m_humanskeletonindexarray
      type: array_d6
    - id: m_humanskeletonreverseindexarray
      type: array_d6
    - id: m_rootmotionboneindex
      type: s4
    - id: m_rootmotionbonex
      type: xform
    - id: m_rootmotionskeleton
      type: offsetptr
    - id: m_rootmotionskeletonpose
      type: offsetptr_d1
    - id: m_rootmotionskeletonindexarray
      type: array_d6
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pair:
    seq:
    - id: first
      type: u4
    - id: second
      type: string
  array_d7:
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
      type: array_d7
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
  array_d8:
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
  array_d9:
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
      type: array_d8
    - id: m_skeleton
      type: array_d9
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
