meta:
  bit-endian: le
  endian: le
  id: wheelcollider
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_center
  type: vector3f
- id: m_radius
  type: f4
- id: m_suspensionspring
  type: jointspring
- id: m_suspensiondistance
  type: f4
- id: m_forceapppointdistance
  type: f4
- id: m_mass
  type: f4
- id: m_wheeldampingrate
  type: f4
- id: m_forwardfriction
  type: wheelfrictioncurve
- id: m_sidewaysfriction
  type: wheelfrictioncurve
- id: m_includelayers
  type: bitfield
- id: m_excludelayers
  type: bitfield
- id: m_layeroverridepriority
  type: s4
- id: m_enabled
  type: b1
- id: m_providescontacts
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
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  jointspring:
    seq:
    - id: spring
      type: f4
    - id: damper
      type: f4
    - id: targetposition
      type: f4
  wheelfrictioncurve:
    seq:
    - id: m_extremumslip
      type: f4
    - id: m_extremumvalue
      type: f4
    - id: m_asymptoteslip
      type: f4
    - id: m_asymptotevalue
      type: f4
    - id: m_stiffness
      type: f4
  bitfield:
    seq:
    - id: m_bits
      type: u4
