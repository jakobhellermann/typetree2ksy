meta:
  bit-endian: le
  endian: le
  id: truetypefontimporter
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
- id: m_fontsize
  type: s4
- id: m_forcetexturecase
  type: s4
- id: m_characterspacing
  type: s4
- id: m_characterpadding
  type: s4
- id: m_includefontdata
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_fontname
  type: string
- id: m_fontnames
  type: array_d2
- id: m_fallbackfontreferences
  type: array_d3
- id: m_customcharacters
  type: string
- id: m_fontrenderingmode
  type: s4
- id: m_output
  type: output
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_ascentcalculationmode
  type: s4
- id: m_uselegacyboundscalculation
  type: b1
- id: m_shouldroundadvancevalue
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
  array_d2:
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
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_font
  output:
    seq:
    - id: hasemptyfontdata
      type: b1
