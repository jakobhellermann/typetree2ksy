meta:
  bit-endian: le
  endian: le
  id: animatorstatemachine
seq:
- id: m_name
  type: string
- id: m_childstates
  type: array
- id: m_childstatemachines
  type: array_d1
- id: m_anystatetransitions
  type: array_d2
- id: m_entrytransitions
  type: array_d3
- id: m_statemachinetransitions
  type: map
- id: m_statemachinebehaviours
  type: array_d5
- id: m_anystateposition
  type: vector3f
- id: m_entryposition
  type: vector3f
- id: m_exitposition
  type: vector3f
- id: m_parentstatemachineposition
  type: vector3f
- id: m_defaultstate
  type: pptr_animatorstate
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
  pptr_animatorstate:
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
  childanimatorstate:
    seq:
    - id: m_state
      type: pptr_animatorstate
    - id: m_position
      type: vector3f
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: childanimatorstate
  pptr_animatorstatemachine:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  childanimatorstatemachine:
    seq:
    - id: m_statemachine
      type: pptr_animatorstatemachine
    - id: m_position
      type: vector3f
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: childanimatorstatemachine
  pptr_animatorstatetransition:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_animatorstatetransition
  pptr_animatortransition:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_animatortransition
  pair:
    seq:
    - id: first
      type: pptr_animatorstatemachine
    - id: second
      type: array_d3
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair
  map:
    seq:
    - id: array
      type: array_d4
  pptr_monobehaviour:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_monobehaviour
