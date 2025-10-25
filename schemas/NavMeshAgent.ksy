meta:
  bit-endian: le
  endian: le
  id: navmeshagent
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_agenttypeid
  type: s4
- id: m_radius
  type: f4
- id: m_speed
  type: f4
- id: m_acceleration
  type: f4
- id: avoidancepriority
  type: s4
- id: m_angularspeed
  type: f4
- id: m_stoppingdistance
  type: f4
- id: m_autotraverseoffmeshlink
  type: b1
- id: m_autobraking
  type: b1
- id: m_autorepath
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_height
  type: f4
- id: m_baseoffset
  type: f4
- id: m_walkablemask
  type: u4
- id: m_obstacleavoidancetype
  type: s4
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
