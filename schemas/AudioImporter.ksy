meta:
  bit-endian: le
  endian: le
  id: audioimporter
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
- id: m_defaultsettings
  type: samplesettings
- id: m_platformsettingoverrides
  type: map_d1
- id: m_forcetomono
  type: b1
- id: m_normalize
  type: b1
- id: m_loadinbackground
  type: b1
- id: m_ambisonic
  type: b1
- id: m_3d
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_previewdata
  type: previewdata
- id: m_output
  type: audioimporteroutput
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
  samplesettings:
    seq:
    - id: loadtype
      type: s4
    - id: sampleratesetting
      type: s4
    - id: samplerateoverride
      type: u4
    - id: compressionformat
      type: s4
    - id: quality
      type: f4
    - id: conversionmode
      type: s4
    - id: preloadaudiodata
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pair_d1:
    seq:
    - id: first
      type: string
    - id: second
      type: samplesettings
  array_d2:
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
      type: array_d2
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: f4
  previewdata:
    seq:
    - id: m_previewdata
      type: array_d3
    - id: m_origsize
      type: s4
    - id: m_compsize
      type: s4
  audioimporteroutput:
    seq:
    - id: outputsettings
      type: samplesettings
    - id: outputcontainerformat
      type: s4
    - id: editoroutputsettings
      type: samplesettings
    - id: editoroutputcontainerformat
      type: s4
