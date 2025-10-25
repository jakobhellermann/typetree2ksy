meta:
  bit-endian: le
  endian: le
  id: qualitysettings
seq:
- id: m_currentquality
  type: s4
- id: m_qualitysettings
  type: array_d1
- id: m_texturemipmaplimitgroupnames
  type: array_d2
- id: m_strippedmaximumlodlevel
  type: s4
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
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  mipmaplimitsettings:
    seq:
    - id: limitbiasmode
      type: s4
    - id: limitbias
      type: s4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: mipmaplimitsettings
  pptr_monobehaviour:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  qualitysetting:
    seq:
    - id: name
      type: string
    - id: pixellightcount
      type: s4
    - id: shadows
      type: s4
    - id: shadowresolution
      type: s4
    - id: shadowprojection
      type: s4
    - id: shadowcascades
      type: s4
    - id: shadowdistance
      type: f4
    - id: shadownearplaneoffset
      type: f4
    - id: shadowcascade2split
      type: f4
    - id: shadowcascade4split
      type: vector3f
    - id: shadowmaskmode
      type: s4
    - id: skinweights
      type: s4
    - id: globaltexturemipmaplimit
      type: s4
    - id: texturemipmaplimitsettings
      type: array
    - id: anisotropictextures
      type: s4
    - id: antialiasing
      type: s4
    - id: softparticles
      type: b1
    - id: softvegetation
      type: b1
    - id: realtimereflectionprobes
      type: b1
    - id: billboardsfacecameraposition
      type: b1
    - id: uselegacydetaildistribution
      type: b1
    - id: adaptivevsync
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: vsynccount
      type: s4
    - id: realtimegicpuusage
      type: s4
    - id: adaptivevsyncextraa
      type: s4
    - id: adaptivevsyncextrab
      type: s4
    - id: lodbias
      type: f4
    - id: maximumlodlevel
      type: s4
    - id: enablelodcrossfade
      type: b1
    - id: streamingmipmapsactive
      type: b1
    - id: streamingmipmapsaddallcameras
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: streamingmipmapsmemorybudget
      type: f4
    - id: streamingmipmapsrenderersperframe
      type: s4
    - id: streamingmipmapsmaxlevelreduction
      type: s4
    - id: streamingmipmapsmaxfileiorequests
      type: s4
    - id: particleraycastbudget
      type: s4
    - id: asyncuploadtimeslice
      type: s4
    - id: asyncuploadbuffersize
      type: s4
    - id: asyncuploadpersistentbuffer
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: resolutionscalingfixeddpifactor
      type: f4
    - id: customrenderpipeline
      type: pptr_monobehaviour
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: terrainqualityoverrides
      type: s4
    - id: terrainpixelerror
      type: f4
    - id: terraindetaildensityscale
      type: f4
    - id: terrainbasemapdistance
      type: f4
    - id: terraindetaildistance
      type: f4
    - id: terraintreedistance
      type: f4
    - id: terrainbillboardstart
      type: f4
    - id: terrainfadelength
      type: f4
    - id: terrainmaxtrees
      type: s4
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
      type: qualitysetting
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
