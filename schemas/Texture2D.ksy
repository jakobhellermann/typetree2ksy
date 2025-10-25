meta:
  bit-endian: le
  endian: le
  id: texture2d
seq:
- id: m_name
  type: string
- id: m_isalphachanneloptional
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_width
  type: s4
- id: m_height
  type: s4
- id: m_completeimagesize
  type: u4
- id: m_mipsstripped
  type: s4
- id: m_textureformat
  type: s4
- id: m_mipcount
  type: s4
- id: m_isreadable
  type: b1
- id: m_ispreprocessed
  type: b1
- id: m_ignoremipmaplimit
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_mipmaplimitgroupname
  type: string
- id: m_streamingmipmaps
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_streamingmipmapspriority
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_imagecount
  type: s4
- id: m_texturedimension
  type: s4
- id: m_texturesettings
  type: gltexturesettings
- id: m_lightmapformat
  type: s4
- id: m_colorspace
  type: s4
- id: m_platformblob
  type: array
- id: image_data
  type: typelessdata
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_streamdata
  type: streaminginfo
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
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  typelessdata:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  streaminginfo:
    seq:
    - id: offset
      type: u8
    - id: size
      type: u4
    - id: path
      type: string
