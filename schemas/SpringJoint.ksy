meta:
  bit-endian: le
  endian: le
  id: springjoint
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_connectedbody
  type: pptr_rigidbody
- id: m_connectedarticulationbody
  type: pptr_articulationbody
- id: m_anchor
  type: vector3f
- id: m_autoconfigureconnectedanchor
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_connectedanchor
  type: vector3f
- id: m_spring
  type: f4
- id: m_damper
  type: f4
- id: m_mindistance
  type: f4
- id: m_maxdistance
  type: f4
- id: m_tolerance
  type: f4
- id: m_breakforce
  type: f4
- id: m_breaktorque
  type: f4
- id: m_enablecollision
  type: b1
- id: m_enablepreprocessing
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_massscale
  type: f4
- id: m_connectedmassscale
  type: f4
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_rigidbody:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_articulationbody:
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
