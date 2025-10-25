meta:
  bit-endian: le
  endian: le
  id: textmesh
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_text
  type: string
- id: m_offsetz
  type: f4
- id: m_charactersize
  type: f4
- id: m_linespacing
  type: f4
- id: m_anchor
  type: s2
- id: m_alignment
  type: s2
- id: m_tabsize
  type: f4
- id: m_fontsize
  type: s4
- id: m_fontstyle
  type: s4
- id: m_richtext
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_font
  type: pptr_font
- id: m_color
  type: colorrgba
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
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
  pptr_font:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  colorrgba:
    seq:
    - id: rgba
      type: u4
