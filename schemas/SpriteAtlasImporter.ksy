meta:
  bit-endian: le
  endian: le
  id: spriteatlasimporter
seq:
- id: m_name
  type: string
- id: m_externalobjects
  type: map
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_usedfileids
  type: array_d1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_texturesettings
  type: texturesettings
- id: m_platformsettings
  type: array_d2
- id: m_packingsettings
  type: packingsettings
- id: m_secondarytexturesettings
  type: map_d1
- id: m_variantmultiplier
  type: f4
- id: m_bindasdefault
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
  pair:
    seq:
    - id: first
      type: sourceassetidentifier
    - id: second
      type: pptr_object
  array:
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
      type: array
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s8
  texturesettings:
    seq:
    - id: anisolevel
      type: s4
    - id: compressionquality
      type: s4
    - id: maxtexturesize
      type: s4
    - id: texturecompression
      type: s4
    - id: filtermode
      type: s4
    - id: generatemipmaps
      type: b1
    - id: readable
      type: b1
    - id: crunchedcompression
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: srgb
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
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
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: textureimporterplatformsettings
  packingsettings:
    seq:
    - id: padding
      type: s4
    - id: blockoffset
      type: s4
    - id: allowalphasplitting
      type: b1
    - id: enablerotation
      type: b1
    - id: enabletightpacking
      type: b1
    - id: enablealphadilation
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  secondarytexturesettings:
    seq:
    - id: platformsettings
      type: array_d2
    - id: srgb
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pair_d1:
    seq:
    - id: first
      type: string
    - id: second
      type: secondarytexturesettings
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d1
  map_d1:
    seq:
    - id: array
      type: array_d3
