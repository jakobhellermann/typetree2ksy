meta:
  bit-endian: le
  endian: le
  id: animator
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_avatar
  type: pptr_avatar
- id: m_controller
  type: pptr_runtimeanimatorcontroller
- id: m_cullingmode
  type: s4
- id: m_updatemode
  type: s4
- id: m_applyrootmotion
  type: b1
- id: m_linearvelocityblending
  type: b1
- id: m_stabilizefeet
  type: b1
- id: m_animatephysics
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_hastransformhierarchy
  type: b1
- id: m_allowconstantclipsamplingoptimization
  type: b1
- id: m_keepanimatorstateondisable
  type: b1
- id: m_writedefaultvaluesondisable
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
  pptr_avatar:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_runtimeanimatorcontroller:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
