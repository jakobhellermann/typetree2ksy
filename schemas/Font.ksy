meta:
  bit-endian: le
  endian: le
  id: font
seq:
- id: m_name
  type: string
- id: m_linespacing
  type: f4
- id: m_defaultmaterial
  type: pptr_material
- id: m_fontsize
  type: f4
- id: m_texture
  type: pptr_texture
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_asciistartoffset
  type: s4
- id: m_tracking
  type: f4
- id: m_characterspacing
  type: s4
- id: m_characterpadding
  type: s4
- id: m_convertcase
  type: s4
- id: m_characterrects
  type: array
- id: m_kerningvalues
  type: map
- id: m_pixelscale
  type: f4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_fontdata
  type: array_d2
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_ascent
  type: f4
- id: m_descent
  type: f4
- id: m_defaultstyle
  type: u4
- id: m_fontnames
  type: array_d3
- id: m_fallbackfonts
  type: array_d4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_fontrenderingmode
  type: s4
- id: m_uselegacyboundscalculation
  type: b1
- id: m_shouldroundadvancevalue
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
  pptr_material:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_texture:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
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
  characterinfo:
    seq:
    - id: index
      type: u4
    - id: uv
      type: rectf
    - id: vert
      type: rectf
    - id: advance
      type: f4
    - id: flipped
      type: b1
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
      type: characterinfo
  pair:
    seq:
    - id: first
      type: u2
    - id: second
      type: u2
  pair_d1:
    seq:
    - id: first
      type: pair
    - id: second
      type: f4
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d1
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
      type: u1
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
  pptr_font:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_font
