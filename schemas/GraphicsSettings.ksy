meta:
  bit-endian: le
  endian: le
  id: graphicssettings
seq:
- id: m_deferred
  type: builtinshadersettings
- id: m_deferredreflections
  type: builtinshadersettings
- id: m_screenspaceshadows
  type: builtinshadersettings
- id: m_depthnormals
  type: builtinshadersettings
- id: m_motionvectors
  type: builtinshadersettings
- id: m_lighthalo
  type: builtinshadersettings
- id: m_lensflare
  type: builtinshadersettings
- id: m_videoshadersincludemode
  type: s4
- id: m_alwaysincludedshaders
  type: array
- id: m_preloadedshaders
  type: array_d1
- id: m_preloadshadersbatchtimelimit
  type: s4
- id: m_spritesdefaultmaterial
  type: pptr_material
- id: m_customrenderpipeline
  type: pptr_monobehaviour
- id: m_transparencysortmode
  type: s4
- id: m_transparencysortaxis
  type: vector3f
- id: m_tiersettings_tier1
  type: tiergraphicssettings
- id: m_tiersettings_tier2
  type: tiergraphicssettings
- id: m_tiersettings_tier3
  type: tiergraphicssettings
- id: m_shaderdefinespershadercompiler
  type: array_d3
- id: m_lightsuselinearintensity
  type: b1
- id: m_lightsusecolortemperature
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_logwhenshaderiscompiled
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_currentrenderpipelineglobalsettings
  type: pptr_object
- id: m_lightprobeoutsidehullstrategy
  type: s4
- id: m_camerarelativelightculling
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_camerarelativeshadowculling
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
types:
  pptr_shader:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  builtinshadersettings:
    seq:
    - id: m_mode
      type: s4
    - id: m_shader
      type: pptr_shader
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_shader
  pptr_shadervariantcollection:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_shadervariantcollection
  pptr_material:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_monobehaviour:
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
  tiergraphicssettings:
    seq:
    - id: renderingpath
      type: s4
    - id: hdrmode
      type: s4
    - id: realtimegicpuusage
      type: s4
    - id: usecascadedshadowmaps
      type: b1
    - id: prefer32bitshadowmaps
      type: b1
    - id: enablelppv
      type: b1
    - id: usehdr
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
      type: u4
  platformshaderdefines:
    seq:
    - id: shaderplatform
      type: s4
    - id: defines_tier1
      type: array_d2
    - id: defines_tier2
      type: array_d2
    - id: defines_tier3
      type: array_d2
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
      type: platformshaderdefines
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
