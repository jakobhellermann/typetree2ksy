meta:
  bit-endian: le
  endian: le
  id: animation
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_animation
  type: pptr_animationclip
- id: m_animations
  type: array
- id: m_wrapmode
  type: s4
- id: m_playautomatically
  type: b1
- id: m_animatephysics
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_updatemode
  type: s4
- id: m_cullingtype
  type: s4
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_animationclip:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_animationclip
