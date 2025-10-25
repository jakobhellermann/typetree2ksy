meta:
  bit-endian: le
  endian: le
  id: customrendertexture
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
- id: m_material
  type: pptr_material
- id: m_initsource
  type: s4
- id: m_initmaterial
  type: pptr_material
- id: m_initcolor
  type: colorrgba
- id: m_inittexture
  type: pptr_texture
- id: m_updatemode
  type: s4
- id: m_initializationmode
  type: s4
- id: m_updatezonespace
  type: s4
- id: m_currentupdatezonespace
  type: s4
- id: m_updatezones
  type: array
- id: m_updateperiod
  type: f4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_shaderpass
  type: u4
- id: m_cubemapfacemask
  type: u4
- id: m_doublebuffered
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_wrapupdatezones
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
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
  pptr_material:
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
  pptr_texture:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  updatezoneinfo:
    seq:
    - id: updatezonecenter
      type: vector3f
    - id: updatezonesize
      type: vector3f
    - id: rotation
      type: f4
    - id: passindex
      type: s4
    - id: needswap
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
      type: updatezoneinfo
