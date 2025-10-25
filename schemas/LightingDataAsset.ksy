meta:
  bit-endian: le
  endian: le
  id: lightingdataasset
seq:
- id: m_name
  type: string
- id: m_scene
  type: pptr_sceneasset
- id: m_lightmaps
  type: array
- id: m_aotextures
  type: array_d1
- id: m_lightprobes
  type: pptr_lightprobes
- id: m_lightmapsmode
  type: s4
- id: m_bakedambientprobeinlinear
  type: sphericalharmonicsl2
- id: m_lightmappedrendererdata
  type: array_d2
- id: m_lightmappedrendererdataids
  type: array_d3
- id: m_enlightenscenemapping
  type: enlightenscenemapping
- id: m_enlightenscenemappingrendererids
  type: array_d3
- id: m_lights
  type: array_d3
- id: m_lightbakingoutputs
  type: array_d9
- id: m_bakedreflectionprobecubemaps
  type: array_d10
- id: m_bakedreflectionprobes
  type: array_d3
- id: m_enlightendata
  type: array_d11
- id: m_enlightendataversion
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
  pptr_sceneasset:
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
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: lightmapdata
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_texture2d
  pptr_lightprobes:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  sphericalharmonicsl2:
    seq:
    - id: sh__0
      type: f4
    - id: sh__1
      type: f4
    - id: sh__2
      type: f4
    - id: sh__3
      type: f4
    - id: sh__4
      type: f4
    - id: sh__5
      type: f4
    - id: sh__6
      type: f4
    - id: sh__7
      type: f4
    - id: sh__8
      type: f4
    - id: sh__9
      type: f4
    - id: sh_10
      type: f4
    - id: sh_11
      type: f4
    - id: sh_12
      type: f4
    - id: sh_13
      type: f4
    - id: sh_14
      type: f4
    - id: sh_15
      type: f4
    - id: sh_16
      type: f4
    - id: sh_17
      type: f4
    - id: sh_18
      type: f4
    - id: sh_19
      type: f4
    - id: sh_20
      type: f4
    - id: sh_21
      type: f4
    - id: sh_22
      type: f4
    - id: sh_23
      type: f4
    - id: sh_24
      type: f4
    - id: sh_25
      type: f4
    - id: sh_26
      type: f4
  pptr_mesh:
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
  rendererdata:
    seq:
    - id: uvmesh
      type: pptr_mesh
    - id: terraindynamicuvst
      type: vector4f
    - id: terrainchunkdynamicuvst
      type: vector4f
    - id: lightmapindex
      type: u2
    - id: lightmapindexdynamic
      type: u2
    - id: lightmapst
      type: vector4f
    - id: lightmapstdynamic
      type: vector4f
    - id: explicitprobesethash
      type: hash128
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: rendererdata
  sceneobjectidentifier:
    seq:
    - id: targetobject
      type: s8
    - id: targetprefab
      type: s8
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: sceneobjectidentifier
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
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
  array_d4:
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
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: enlightensysteminformation
  array_d6:
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
  array_d7:
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
  array_d8:
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
      type: array_d4
    - id: m_systems
      type: array_d5
    - id: m_probesets
      type: array_d6
    - id: m_systematlases
      type: array_d7
    - id: m_terrainchunks
      type: array_d8
  lightmapbakemode:
    seq:
    - id: lightmapbaketype
      type: s4
    - id: mixedlightingmode
      type: s4
  lightbakingoutput:
    seq:
    - id: probeocclusionlightindex
      type: s4
    - id: occlusionmaskchannel
      type: s4
    - id: lightmapbakemode
      type: lightmapbakemode
    - id: isbaked
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d9:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: lightbakingoutput
  pptr_texture:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d10:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_texture
  array_d11:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
