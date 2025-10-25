meta:
  bit-endian: le
  endian: le
  id: textureimporter
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
- id: m_mipmapmode
  type: s4
- id: m_enablemipmap
  type: s4
- id: m_srgbtexture
  type: s4
- id: m_lineartexture
  type: s4
- id: m_fadeout
  type: s4
- id: m_bordermipmap
  type: s4
- id: m_mipmapspreservecoverage
  type: s4
- id: m_alphatestreferencevalue
  type: f4
- id: m_mipmapfadedistancestart
  type: s4
- id: m_mipmapfadedistanceend
  type: s4
- id: m_converttonormalmap
  type: s4
- id: m_externalnormalmap
  type: s4
- id: m_heightscale
  type: f4
- id: m_normalmapfilter
  type: s4
- id: m_flipgreenchannel
  type: s4
- id: m_isreadable
  type: s4
- id: m_streamingmipmaps
  type: s4
- id: m_streamingmipmapspriority
  type: s4
- id: m_vtonly
  type: s4
- id: m_ignoremipmaplimit
  type: s4
- id: m_grayscaletoalpha
  type: s4
- id: m_generatecubemap
  type: s4
- id: m_cubemapconvolution
  type: s4
- id: m_seamlesscubemap
  type: s4
- id: m_textureformat
  type: s4
- id: m_maxtexturesize
  type: s4
- id: m_texturesettings
  type: gltexturesettings
- id: m_npotscale
  type: s4
- id: m_lightmap
  type: s4
- id: m_compressionquality
  type: s4
- id: m_spritemode
  type: s4
- id: m_spriteextrude
  type: u4
- id: m_spritemeshtype
  type: s4
- id: m_alignment
  type: s4
- id: m_spritepivot
  type: vector2f
- id: m_spritepixelstounits
  type: f4
- id: m_spriteborder
  type: vector4f
- id: m_spritegeneratefallbackphysicsshape
  type: s4
- id: m_alphausage
  type: s4
- id: m_alphaistransparency
  type: s4
- id: m_spritetessellationdetail
  type: f4
- id: m_texturetype
  type: s4
- id: m_textureshape
  type: s4
- id: m_singlechannelcomponent
  type: s4
- id: m_flipbookrows
  type: s4
- id: m_flipbookcolumns
  type: s4
- id: m_maxtexturesizeset
  type: s4
- id: m_compressionqualityset
  type: s4
- id: m_textureformatset
  type: s4
- id: m_ignorepnggamma
  type: s4
- id: m_applygammadecoding
  type: s4
- id: m_swizzle
  type: u4
- id: m_cookielighttype
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_platformsettings
  type: array_d3
- id: m_spritesheet
  type: spritesheetmetadata
- id: m_mipmaplimitgroupname
  type: string
- id: m_output
  type: textureimportoutput
- id: m_psdremovematte
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
  gltexturesettings:
    seq:
    - id: m_filtermode
      type: s4
    - id: m_aniso
      type: s4
    - id: m_mipbias
      type: f4
    - id: m_wrapu
      type: s4
    - id: m_wrapv
      type: s4
    - id: m_wrapw
      type: s4
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
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
  textureimporterplatformsettings:
    seq:
    - id: m_buildtarget
      type: string
    - id: m_maxtexturesize
      type: s4
    - id: m_resizealgorithm
      type: s4
    - id: m_textureformat
      type: s4
    - id: m_texturecompression
      type: s4
    - id: m_compressionquality
      type: s4
    - id: m_crunchedcompression
      type: b1
    - id: m_allowsalphasplitting
      type: b1
    - id: m_overridden
      type: b1
    - id: m_ignoreplatformsupport
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_androidetc2fallbackoverride
      type: s4
    - id: m_forcemaximumcompressionquality_bc6h_bc7
      type: b1
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: textureimporterplatformsettings
  rectf:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: width
      type: f4
    - id: height
      type: f4
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vector2f
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: array_d4
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
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
  colorrgba:
    seq:
    - id: rgba
      type: u4
  spritebone:
    seq:
    - id: name
      type: string
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: guid
      type: string
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: position
      type: vector3f
    - id: rotation
      type: quaternionf
    - id: length
      type: f4
    - id: parentid
      type: s4
    - id: color
      type: colorrgba
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: spritebone
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s4
  int2_storage:
    seq:
    - id: x
      type: s4
    - id: y
      type: s4
  array_d8:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: int2_storage
  boneweights4:
    seq:
    - id: weight_0
      type: f4
    - id: weight_1
      type: f4
    - id: weight_2
      type: f4
    - id: weight_3
      type: f4
    - id: boneindex_0
      type: s4
    - id: boneindex_1
      type: s4
    - id: boneindex_2
      type: s4
    - id: boneindex_3
      type: s4
  array_d9:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: boneweights4
  spritemetadata:
    seq:
    - id: m_name
      type: string
    - id: m_rect
      type: rectf
    - id: m_alignment
      type: s4
    - id: m_pivot
      type: vector2f
    - id: m_border
      type: vector4f
    - id: m_customdata
      type: string
    - id: m_outline
      type: array_d5
    - id: m_physicsshape
      type: array_d5
    - id: m_tessellationdetail
      type: f4
    - id: m_bones
      type: array_d6
    - id: m_spriteid
      type: string
    - id: m_internalid
      type: s8
    - id: m_vertices
      type: array_d4
    - id: m_indices
      type: array_d7
    - id: m_edges
      type: array_d8
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_weights
      type: array_d9
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d10:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: spritemetadata
  pptr_texture2d:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  secondaryspritetexture:
    seq:
    - id: texture
      type: pptr_texture2d
    - id: name
      type: string
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d11:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: secondaryspritetexture
  spritecustomdataentry:
    seq:
    - id: m_key
      type: string
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_value
      type: string
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d12:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: spritecustomdataentry
  spritecustommetadata:
    seq:
    - id: m_entries
      type: array_d12
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pair_d3:
    seq:
    - id: first
      type: string
    - id: second
      type: s8
  array_d13:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d3
  map_d1:
    seq:
    - id: array
      type: array_d13
  spritesheetmetadata:
    seq:
    - id: m_sprites
      type: array_d10
    - id: m_outline
      type: array_d5
    - id: m_customdata
      type: string
    - id: m_physicsshape
      type: array_d5
    - id: m_bones
      type: array_d6
    - id: m_spriteid
      type: string
    - id: m_internalid
      type: s8
    - id: m_vertices
      type: array_d4
    - id: m_indices
      type: array_d7
    - id: m_edges
      type: array_d8
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_weights
      type: array_d9
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_secondarytextures
      type: array_d11
    - id: m_spritecustommetadata
      type: spritecustommetadata
    - id: m_namefileidtable
      type: map_d1
  textureimportinstructions:
    seq:
    - id: compressedformat
      type: s4
    - id: uncompressedformat
      type: s4
    - id: desiredformat
      type: s4
    - id: usagemode
      type: s4
    - id: colorspace
      type: s4
    - id: width
      type: s4
    - id: height
      type: s4
    - id: depth
      type: s4
    - id: cubeintermediatesize
      type: s4
    - id: cubemode
      type: s4
    - id: cubelayout
      type: s4
    - id: compressionquality
      type: s4
    - id: vtonly
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  sourcetextureinformation:
    seq:
    - id: width
      type: s4
    - id: height
      type: s4
    - id: doestexturecontainalpha
      type: b1
    - id: sourcewashdr
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  textureimportoutput:
    seq:
    - id: textureimportinstructions
      type: textureimportinstructions
    - id: sourcetextureinformation
      type: sourcetextureinformation
    - id: importinspectorwarnings
      type: string
