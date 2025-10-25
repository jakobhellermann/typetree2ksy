meta:
  bit-endian: le
  endian: le
  id: speedtreeimporter
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
- id: m_maincolor
  type: colorrgba
- id: m_huevariation
  type: colorrgba
- id: m_alphatestref
  type: f4
- id: m_enablehuevariation
  type: b1
- id: m_enablebumpmapping
  type: b1
- id: m_enablesubsurfacescattering
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_bestwindquality
  type: s4
- id: m_selectedwindquality
  type: s4
- id: m_enableshadowcasting
  type: b1
- id: m_enableshadowreceiving
  type: b1
- id: m_enablelightprobes
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_reflectionprobeenumvalue
  type: s4
- id: m_hasbillboard
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_lodsettings
  type: array_d2
- id: m_enablesmoothlodtransition
  type: b1
- id: m_animatecrossfading
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_billboardtransitioncrossfadewidth
  type: f4
- id: m_fadeoutwidth
  type: f4
- id: m_scalefactor
  type: f4
- id: m_unitconversionenumvalue
  type: s4
- id: m_motionvectormodeenumvalue
  type: s4
- id: m_generatecolliders
  type: b1
- id: m_generaterigidbody
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_materialversion
  type: s4
- id: m_materiallocation
  type: s4
- id: m_materials
  type: array_d3
- id: m_supportsembeddedmaterials
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_fileidtype
  type: s4
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
  perlodsettings:
    seq:
    - id: enablesettingoverride
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: height
      type: f4
    - id: castshadows
      type: b1
    - id: receiveshadows
      type: b1
    - id: uselightprobes
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: reflectionprobeusage
      type: s4
    - id: enablebump
      type: b1
    - id: enablehue
      type: b1
    - id: enablesubsurface
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: windquality
      type: s4
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: perlodsettings
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: sourceassetidentifier
