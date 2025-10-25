meta:
  bit-endian: le
  endian: le
  id: lightmapsettings
seq:
- id: m_enlightenscenemapping
  type: enlightenscenemapping
- id: m_bakeonsceneload
  type: s4
- id: m_lightprobes
  type: pptr_lightprobes
- id: m_lightmaps
  type: array_d5
- id: m_lightmapsmode
  type: s4
- id: m_gisettings
  type: gisettings
- id: m_lightingsettings
  type: pptr_lightingsettings
types:
  pptr_object:
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
  hash128:
    seq:
    - id: bytes_0
      type: u1
    - id: bytes_1
      type: u1
    - id: bytes_2
      type: u1
    - id: bytes_3
      type: u1
    - id: bytes_4
      type: u1
    - id: bytes_5
      type: u1
    - id: bytes_6
      type: u1
    - id: bytes_7
      type: u1
    - id: bytes_8
      type: u1
    - id: bytes_9
      type: u1
    - id: bytes_10
      type: u1
    - id: bytes_11
      type: u1
    - id: bytes_12
      type: u1
    - id: bytes_13
      type: u1
    - id: bytes_14
      type: u1
    - id: bytes_15
      type: u1
  enlightenrendererinformation:
    seq:
    - id: renderer
      type: pptr_object
    - id: dynamiclightmapstinsystem
      type: vector4f
    - id: systemid
      type: s4
    - id: instancehash
      type: hash128
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: enlightenrendererinformation
  enlightensysteminformation:
    seq:
    - id: rendererindex
      type: u4
    - id: renderersize
      type: u4
    - id: atlasindex
      type: s4
    - id: atlasoffsetx
      type: s4
    - id: atlasoffsety
      type: s4
    - id: inputsystemhash
      type: hash128
    - id: radiositysystemhash
      type: hash128
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: enlightensysteminformation
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: hash128
  enlightensystematlasinformation:
    seq:
    - id: atlassize
      type: s4
    - id: atlashash
      type: hash128
    - id: firstsystemid
      type: s4
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: enlightensystematlasinformation
  enlightenterrainchunksinformation:
    seq:
    - id: firstsystemid
      type: s4
    - id: numchunksinx
      type: s4
    - id: numchunksiny
      type: s4
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: enlightenterrainchunksinformation
  enlightenscenemapping:
    seq:
    - id: m_renderers
      type: array
    - id: m_systems
      type: array_d1
    - id: m_probesets
      type: array_d2
    - id: m_systematlases
      type: array_d3
    - id: m_terrainchunks
      type: array_d4
  pptr_lightprobes:
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
  lightmapdata:
    seq:
    - id: m_lightmap
      type: pptr_texture2d
    - id: m_dirlightmap
      type: pptr_texture2d
    - id: m_shadowmask
      type: pptr_texture2d
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: lightmapdata
  gisettings:
    seq:
    - id: m_bouncescale
      type: f4
    - id: m_indirectoutputscale
      type: f4
    - id: m_albedoboost
      type: f4
    - id: m_environmentlightingmode
      type: u4
    - id: m_enablebakedlightmaps
      type: b1
    - id: m_enablerealtimelightmaps
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pptr_lightingsettings:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
