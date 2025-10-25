meta:
  bit-endian: le
  endian: le
  id: tilemaprenderer
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
- id: m_chunksize
  type: int3_storage
- id: m_chunkcullingbounds
  type: vector3f
- id: m_maxchunkcount
  type: u4
- id: m_maxframeage
  type: u4
- id: m_sortorder
  type: s4
- id: m_mode
  type: s4
- id: m_detectchunkcullingbounds
  type: s4
- id: m_maskinteraction
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
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
  int3_storage:
    seq:
    - id: x
      type: s4
    - id: y
      type: s4
    - id: z
      type: s4
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
