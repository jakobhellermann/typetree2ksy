meta:
  bit-endian: le
  endian: le
  id: flare
seq:
- id: m_name
  type: string
- id: m_flaretexture
  type: pptr_texture
- id: m_texturelayout
  type: s4
- id: m_elements
  type: array
- id: m_usefog
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
  pptr_texture:
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
  flareelement:
    seq:
    - id: m_imageindex
      type: u4
    - id: m_position
      type: f4
    - id: m_size
      type: f4
    - id: m_color
      type: colorrgba
    - id: m_uselightcolor
      type: b1
    - id: m_rotate
      type: b1
    - id: m_zoom
      type: b1
    - id: m_fade
      type: b1
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: flareelement
