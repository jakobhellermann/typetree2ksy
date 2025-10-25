meta:
  bit-endian: le
  endian: le
  id: rigidbody2d
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_bodytype
  type: s4
- id: m_simulated
  type: b1
- id: m_usefullkinematiccontacts
  type: b1
- id: m_useautomass
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_mass
  type: f4
- id: m_lineardamping
  type: f4
- id: m_angulardamping
  type: f4
- id: m_gravityscale
  type: f4
- id: m_material
  type: pptr_physicsmaterial2d
- id: m_includelayers
  type: bitfield
- id: m_excludelayers
  type: bitfield
- id: m_interpolate
  type: s4
- id: m_sleepingmode
  type: s4
- id: m_collisiondetection
  type: s4
- id: m_constraints
  type: s4
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_physicsmaterial2d:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  bitfield:
    seq:
    - id: m_bits
      type: u4
