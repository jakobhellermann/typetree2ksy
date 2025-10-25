meta:
  bit-endian: le
  endian: le
  id: cubemaparray
seq:
- id: m_name
  type: string
- id: m_isalphachanneloptional
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_colorspace
  type: s4
- id: m_format
  type: s4
- id: m_width
  type: s4
- id: m_cubemapcount
  type: s4
- id: m_mipcount
  type: s4
- id: m_datasize
  type: u4
- id: m_texturesettings
  type: gltexturesettings
- id: m_usagemode
  type: s4
- id: m_isreadable
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
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
