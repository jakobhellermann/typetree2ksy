meta:
  bit-endian: le
  endian: le
  id: buildsettings
seq:
- id: scenes
  type: array
- id: preloadedplugins
  type: array
- id: enabledvrdevices
  type: array
- id: buildtags
  type: array
- id: hasproversion
  type: b1
- id: isnowatermarkbuild
  type: b1
- id: isprototypingbuild
  type: b1
- id: iseducationalbuild
  type: b1
- id: isembedded
  type: b1
- id: istrial
  type: b1
- id: haspublishingrights
  type: b1
- id: hasshadows
  type: b1
- id: hassoftshadows
  type: b1
- id: haslocallightshadows
  type: b1
- id: hasadvancedversion
  type: b1
- id: enabledynamicbatching
  type: b1
- id: usesonmouseevents
  type: b1
- id: hasclusterrendering
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_version
  type: string
- id: m_authtoken
  type: string
- id: m_graphicsapis
  type: array_d1
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
      type: string
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s4
