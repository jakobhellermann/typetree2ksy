meta:
  bit-endian: le
  endian: le
  id: videoclip
seq:
- id: m_name
  type: string
- id: m_originalpath
  type: string
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_proxywidth
  type: u4
- id: m_proxyheight
  type: u4
- id: width
  type: u4
- id: height
  type: u4
- id: m_pixelaspecrationum
  type: u4
- id: m_pixelaspecratioden
  type: u4
- id: m_framerate
  type: f8
- id: m_framecount
  type: u8
- id: m_format
  type: s4
- id: m_audiochannelcount
  type: array
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_audiosamplerate
  type: array_d1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_audiolanguage
  type: array_d2
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_videoshaders
  type: array_d3
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_externalresources
  type: streamedresource
- id: m_hassplitalpha
  type: b1
- id: m_srgb
  type: b1
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
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u2
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
  pptr_shader:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_shader
  streamedresource:
    seq:
    - id: m_source
      type: string
    - id: m_offset
      type: u8
    - id: m_size
      type: u8
