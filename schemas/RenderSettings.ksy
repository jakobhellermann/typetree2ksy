meta:
  bit-endian: le
  endian: le
  id: rendersettings
seq:
- id: m_fog
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_fogcolor
  type: colorrgba
- id: m_fogmode
  type: s4
- id: m_fogdensity
  type: f4
- id: m_linearfogstart
  type: f4
- id: m_linearfogend
  type: f4
- id: m_ambientskycolor
  type: colorrgba
- id: m_ambientequatorcolor
  type: colorrgba
- id: m_ambientgroundcolor
  type: colorrgba
- id: m_ambientintensity
  type: f4
- id: m_ambientmode
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_subtractiveshadowcolor
  type: colorrgba
- id: m_skyboxmaterial
  type: pptr_material
- id: m_halostrength
  type: f4
- id: m_flarestrength
  type: f4
- id: m_flarefadespeed
  type: f4
- id: m_halotexture
  type: pptr_texture2d
- id: m_spotcookie
  type: pptr_texture2d
- id: m_defaultreflectionmode
  type: s4
- id: m_defaultreflectionresolution
  type: s4
- id: m_reflectionbounces
  type: s4
- id: m_reflectionintensity
  type: f4
- id: m_customreflection
  type: pptr_texture
- id: m_ambientprobe
  type: sphericalharmonicsl2
- id: m_generatedskyboxreflection
  type: pptr_cubemap
- id: m_sun
  type: pptr_light
- id: m_indirectspecularcolor
  type: colorrgba
- id: m_useradianceambientprobe
  type: b1
types:
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
  pptr_material:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_texture2d:
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
  sphericalharmonicsl2:
    seq:
    - id: sh__0
      type: f4
    - id: sh__1
      type: f4
    - id: sh__2
      type: f4
    - id: sh__3
      type: f4
    - id: sh__4
      type: f4
    - id: sh__5
      type: f4
    - id: sh__6
      type: f4
    - id: sh__7
      type: f4
    - id: sh__8
      type: f4
    - id: sh__9
      type: f4
    - id: sh_10
      type: f4
    - id: sh_11
      type: f4
    - id: sh_12
      type: f4
    - id: sh_13
      type: f4
    - id: sh_14
      type: f4
    - id: sh_15
      type: f4
    - id: sh_16
      type: f4
    - id: sh_17
      type: f4
    - id: sh_18
      type: f4
    - id: sh_19
      type: f4
    - id: sh_20
      type: f4
    - id: sh_21
      type: f4
    - id: sh_22
      type: f4
    - id: sh_23
      type: f4
    - id: sh_24
      type: f4
    - id: sh_25
      type: f4
    - id: sh_26
      type: f4
  pptr_cubemap:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_light:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
