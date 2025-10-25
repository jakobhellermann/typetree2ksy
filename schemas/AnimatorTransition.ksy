meta:
  bit-endian: le
  endian: le
  id: animatortransition
seq:
- id: m_name
  type: string
- id: m_conditions
  type: array
- id: m_dststatemachine
  type: pptr_animatorstatemachine
- id: m_dststate
  type: pptr_animatorstate
- id: m_solo
  type: b1
- id: m_mute
  type: b1
- id: m_isexit
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
  animatorcondition:
    seq:
    - id: m_conditionmode
      type: s4
    - id: m_conditionevent
      type: string
    - id: m_eventtreshold
      type: f4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: animatorcondition
  pptr_animatorstatemachine:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_animatorstate:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
