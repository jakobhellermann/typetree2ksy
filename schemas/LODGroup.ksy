meta:
  bit-endian: le
  endian: le
  id: lodgroup
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_localreferencepoint
  type: vector3f
- id: m_size
  type: f4
- id: m_fademode
  type: s4
- id: m_animatecrossfading
  type: b1
- id: m_lastlodisbillboard
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_lods
  type: array_d1
- id: m_enabled
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
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  pptr_renderer:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  lodrenderer:
    seq:
    - id: renderer
      type: pptr_renderer
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: lodrenderer
  lod:
    seq:
    - id: screenrelativeheight
      type: f4
    - id: fadetransitionwidth
      type: f4
    - id: renderers
      type: array
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: lod
