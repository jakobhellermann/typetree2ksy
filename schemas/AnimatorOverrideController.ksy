meta:
  bit-endian: le
  endian: le
  id: animatoroverridecontroller
seq:
- id: m_name
  type: string
- id: m_controller
  type: pptr_runtimeanimatorcontroller
- id: m_clips
  type: array
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
  pptr_runtimeanimatorcontroller:
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
  animationclipoverride:
    seq:
    - id: m_originalclip
      type: pptr_animationclip
    - id: m_overrideclip
      type: pptr_animationclip
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: animationclipoverride
