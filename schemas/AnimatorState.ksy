meta:
  bit-endian: le
  endian: le
  id: animatorstate
seq:
- id: m_name
  type: string
- id: m_speed
  type: f4
- id: m_cycleoffset
  type: f4
- id: m_transitions
  type: array
- id: m_statemachinebehaviours
  type: array_d1
- id: m_position
  type: vector3f
- id: m_ikonfeet
  type: b1
- id: m_writedefaultvalues
  type: b1
- id: m_mirror
  type: b1
- id: m_speedparameteractive
  type: b1
- id: m_mirrorparameteractive
  type: b1
- id: m_cycleoffsetparameteractive
  type: b1
- id: m_timeparameteractive
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_motion
  type: pptr_motion
- id: m_tag
  type: string
- id: m_speedparameter
  type: string
- id: m_mirrorparameter
  type: string
- id: m_cycleoffsetparameter
  type: string
- id: m_timeparameter
  type: string
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
  pptr_animatorstatetransition:
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
      type: pptr_animatorstatetransition
  pptr_monobehaviour:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_monobehaviour
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  pptr_motion:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
