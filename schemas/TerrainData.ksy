meta:
  bit-endian: le
  endian: le
  id: terraindata
seq:
- id: m_name
  type: string
- id: m_splatdatabase
  type: splatdatabase
- id: m_detaildatabase
  type: detaildatabase
- id: m_heightmap
  type: heightmap
- id: m_preloadshaders
  type: array_d9
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
  pptr_terrainlayer:
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
      type: pptr_terrainlayer
  pptr_texture2d:
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
      type: pptr_texture2d
  splatdatabase:
    seq:
    - id: m_terrainlayers
      type: array
    - id: m_alphatextures
      type: array_d1
    - id: m_alphamapresolution
      type: s4
    - id: m_basemapresolution
      type: s4
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  detailpatch:
    seq:
    - id: layerindices
      type: array_d2
    - id: coverage
      type: array_d2
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: detailpatch
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  colorrgba:
    seq:
    - id: r
      type: f4
    - id: g
      type: f4
    - id: b
      type: f4
    - id: a
      type: f4
  detailprototype:
    seq:
    - id: prototype
      type: pptr_gameobject
    - id: prototypetexture
      type: pptr_texture2d
    - id: minwidth
      type: f4
    - id: maxwidth
      type: f4
    - id: minheight
      type: f4
    - id: maxheight
      type: f4
    - id: noiseseed
      type: s4
    - id: noisespread
      type: f4
    - id: holetestradius
      type: f4
    - id: density
      type: f4
    - id: healthycolor
      type: colorrgba
    - id: drycolor
      type: colorrgba
    - id: rendermode
      type: s4
    - id: useprototypemesh
      type: s4
    - id: useinstancing
      type: s4
    - id: usedensityscaling
      type: s4
    - id: aligntoground
      type: f4
    - id: positionjitter
      type: f4
    - id: targetcoverage
      type: f4
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: detailprototype
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  colorrgba_d1:
    seq:
    - id: rgba
      type: u4
  treeinstance:
    seq:
    - id: position
      type: vector3f
    - id: widthscale
      type: f4
    - id: heightscale
      type: f4
    - id: rotation
      type: f4
    - id: color
      type: colorrgba_d1
    - id: lightmapcolor
      type: colorrgba_d1
    - id: index
      type: s4
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: treeinstance
  treeprototype:
    seq:
    - id: prefab
      type: pptr_gameobject
    - id: bendfactor
      type: f4
    - id: navmeshlod
      type: s4
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: treeprototype
  pptr_shader:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  detaildatabase:
    seq:
    - id: m_patches
      type: array_d3
    - id: m_detailprototypes
      type: array_d4
    - id: m_patchcount
      type: s4
    - id: m_patchsamples
      type: s4
    - id: wavinggrasstint
      type: colorrgba
    - id: m_wavinggrassstrength
      type: f4
    - id: m_wavinggrassamount
      type: f4
    - id: m_wavinggrassspeed
      type: f4
    - id: m_detailscattermode
      type: s4
    - id: m_treeinstances
      type: array_d5
    - id: m_treeprototypes
      type: array_d6
    - id: m_preloadtextureatlasdata
      type: array_d1
    - id: m_defaultshaders_0
      type: pptr_shader
    - id: m_defaultshaders_1
      type: pptr_shader
    - id: m_defaultshaders_2
      type: pptr_shader
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s2
  array_d8:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: f4
  heightmap:
    seq:
    - id: m_heights
      type: array_d7
    - id: m_holes
      type: array_d2
    - id: m_holeslod
      type: array_d2
    - id: m_enableholestexturecompression
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_precomputederror
      type: array_d8
    - id: m_minmaxpatchheights
      type: array_d8
    - id: m_resolution
      type: s4
    - id: m_levels
      type: s4
    - id: m_scale
      type: vector3f
  array_d9:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_shader
