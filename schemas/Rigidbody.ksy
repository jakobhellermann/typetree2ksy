meta:
  bit-endian: le
  endian: le
  id: rigidbody
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_mass
  type: f4
- id: m_lineardamping
  type: f4
- id: m_angulardamping
  type: f4
- id: m_centerofmass
  type: vector3f
- id: m_inertiatensor
  type: vector3f
- id: m_inertiarotation
  type: quaternionf
- id: m_includelayers
  type: bitfield
- id: m_excludelayers
  type: bitfield
- id: m_implicitcom
  type: b1
- id: m_implicittensor
  type: b1
- id: m_usegravity
  type: b1
- id: m_iskinematic
  type: b1
- id: m_interpolate
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_constraints
  type: s4
- id: m_collisiondetection
  type: s4
types:
  pptr_gameobject:
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
  quaternionf:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
    - id: w
      type: f4
  bitfield:
    seq:
    - id: m_bits
      type: u4
