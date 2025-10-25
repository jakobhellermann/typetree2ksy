meta:
  bit-endian: le
  endian: le
  id: terrain
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_terraindata
  type: pptr_terraindata
- id: m_treedistance
  type: f4
- id: m_treebillboarddistance
  type: f4
- id: m_treecrossfadelength
  type: f4
- id: m_treemaximumfulllodcount
  type: s4
- id: m_detailobjectdistance
  type: f4
- id: m_detailobjectdensity
  type: f4
- id: m_heightmappixelerror
  type: f4
- id: m_splatmapdistance
  type: f4
- id: m_heightmapminimumlodsimplification
  type: s4
- id: m_heightmapmaximumlod
  type: s4
- id: m_shadowcastingmode
  type: s4
- id: m_drawheightmap
  type: b1
- id: m_drawinstanced
  type: b1
- id: m_drawtreesandfoliage
  type: b1
- id: m_staticshadowcaster
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_ignorequalitysettings
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_reflectionprobeusage
  type: s4
- id: m_materialtemplate
  type: pptr_material
- id: m_lightmapindex
  type: u2
- id: m_lightmapindexdynamic
  type: u2
- id: m_lightmaptilingoffset
  type: vector4f
- id: m_lightmaptilingoffsetdynamic
  type: vector4f
- id: m_explicitprobesethash
  type: hash128
- id: m_bakelightprobesfortrees
  type: b1
- id: m_preservetreeprototypelayers
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_dynamicuvst
  type: vector4f
- id: m_chunkdynamicuvst
  type: vector4f
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_groupingid
  type: s4
- id: m_renderinglayermask
  type: u4
- id: m_allowautoconnect
  type: b1
- id: m_enableheightmapraytracing
  type: b1
- id: m_enabletreesanddetailsraytracing
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_treemotionvectormodeoverride
  type: s4
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_terraindata:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_material:
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
