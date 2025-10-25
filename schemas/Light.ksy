meta:
  bit-endian: le
  endian: le
  id: light
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_type
  type: s4
- id: m_color
  type: colorrgba
- id: m_intensity
  type: f4
- id: m_range
  type: f4
- id: m_spotangle
  type: f4
- id: m_innerspotangle
  type: f4
- id: m_cookiesize
  type: f4
- id: m_shadows
  type: shadowsettings
- id: m_cookie
  type: pptr_texture
- id: m_drawhalo
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_bakingoutput
  type: lightbakingoutput
- id: m_flare
  type: pptr_flare
- id: m_rendermode
  type: s4
- id: m_cullingmask
  type: bitfield
- id: m_renderinglayermask
  type: u4
- id: m_lightmapping
  type: s4
- id: m_lightshadowcastermode
  type: s4
- id: m_areasize
  type: vector2f
- id: m_bounceintensity
  type: f4
- id: m_colortemperature
  type: f4
- id: m_usecolortemperature
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_boundingsphereoverride
  type: vector4f
- id: m_useboundingsphereoverride
  type: b1
- id: m_useviewfrustumforshadowcastercull
  type: b1
- id: m_forcevisible
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_lightunit
  type: s4
- id: m_luxatdistance
  type: f4
- id: m_enablespotreflector
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
types:
  pptr_gameobject:
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
  matrix4x4f:
    seq:
    - id: e00
      type: f4
    - id: e01
      type: f4
    - id: e02
      type: f4
    - id: e03
      type: f4
    - id: e10
      type: f4
    - id: e11
      type: f4
    - id: e12
      type: f4
    - id: e13
      type: f4
    - id: e20
      type: f4
    - id: e21
      type: f4
    - id: e22
      type: f4
    - id: e23
      type: f4
    - id: e30
      type: f4
    - id: e31
      type: f4
    - id: e32
      type: f4
    - id: e33
      type: f4
  shadowsettings:
    seq:
    - id: m_type
      type: s4
    - id: m_resolution
      type: s4
    - id: m_customresolution
      type: s4
    - id: m_strength
      type: f4
    - id: m_bias
      type: f4
    - id: m_normalbias
      type: f4
    - id: m_nearplane
      type: f4
    - id: m_cullingmatrixoverride
      type: matrix4x4f
    - id: m_usecullingmatrixoverride
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pptr_texture:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  lightmapbakemode:
    seq:
    - id: lightmapbaketype
      type: s4
    - id: mixedlightingmode
      type: s4
  lightbakingoutput:
    seq:
    - id: probeocclusionlightindex
      type: s4
    - id: occlusionmaskchannel
      type: s4
    - id: lightmapbakemode
      type: lightmapbakemode
    - id: isbaked
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pptr_flare:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  bitfield:
    seq:
    - id: m_bits
      type: u4
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
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
