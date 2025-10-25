meta:
  bit-endian: le
  endian: le
  id: terrainlayer
seq:
- id: m_name
  type: string
- id: m_diffusetexture
  type: pptr_texture2d
- id: m_normalmaptexture
  type: pptr_texture2d
- id: m_maskmaptexture
  type: pptr_texture2d
- id: m_tilesize
  type: vector2f
- id: m_tileoffset
  type: vector2f
- id: m_specular
  type: colorrgba
- id: m_metallic
  type: f4
- id: m_smoothness
  type: f4
- id: m_normalscale
  type: f4
- id: m_diffuseremapmin
  type: vector4f
- id: m_diffuseremapmax
  type: vector4f
- id: m_maskmapremapmin
  type: vector4f
- id: m_maskmapremapmax
  type: vector4f
- id: m_smoothnesssource
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
  pptr_texture2d:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
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
  vector4f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
    - id: w
      type: f4
