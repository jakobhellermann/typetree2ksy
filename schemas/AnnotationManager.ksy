meta:
  bit-endian: le
  endian: le
  id: annotationmanager
seq:
- id: m_currentpreset_m_annotationlist
  type: array
- id: m_recentlychanged
  type: array
- id: m_worldiconsize
  type: f4
- id: m_fadegizmosize
  type: f4
- id: m_fadegizmos
  type: b1
- id: m_use3dgizmos
  type: b1
- id: m_showgrid
  type: b1
- id: m_showselectionoutline
  type: b1
- id: m_showselectionwire
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
  annotation:
    seq:
    - id: m_iconenabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_gizmoenabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_classid
      type: u4
    - id: m_scriptclass
      type: string
    - id: m_flags
      type: s4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: annotation
