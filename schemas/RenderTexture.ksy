meta:
  bit-endian: le
  endian: le
  id: rendertexture
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
- id: m_antialiasing
  type: s4
- id: m_mipcount
  type: s4
- id: m_depthstencilformat
  type: s4
- id: m_colorformat
  type: s4
- id: m_mipmap
  type: b1
- id: m_generatemips
  type: b1
- id: m_srgb
  type: b1
- id: m_usedynamicscale
  type: b1
- id: m_usedynamicscaleexplicit
  type: b1
- id: m_bindms
  type: b1
- id: m_enablecompatibleformat
  type: b1
- id: m_enablerandomwrite
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_texturesettings
  type: gltexturesettings
- id: m_dimension
  type: s4
- id: m_volumedepth
  type: s4
- id: m_shadowsamplingmode
  type: s4
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
