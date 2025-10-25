meta:
  bit-endian: le
  endian: le
  id: sliderjoint2d
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_enablecollision
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_connectedrigidbody
  type: pptr_rigidbody2d
- id: m_breakforce
  type: f4
- id: m_breaktorque
  type: f4
- id: m_breakaction
  type: s4
- id: m_autoconfigureconnectedanchor
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_anchor
  type: vector2f
- id: m_connectedanchor
  type: vector2f
- id: m_autoconfigureangle
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_angle
  type: f4
- id: m_usemotor
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_motor
  type: jointmotor2d
- id: m_uselimits
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_translationlimits
  type: jointtranslationlimits2d
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_rigidbody2d:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  jointmotor2d:
    seq:
    - id: m_motorspeed
      type: f4
    - id: m_maximummotorforce
      type: f4
  jointtranslationlimits2d:
    seq:
    - id: m_lowertranslation
      type: f4
    - id: m_uppertranslation
      type: f4
