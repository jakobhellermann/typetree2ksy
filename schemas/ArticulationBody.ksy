meta:
  bit-endian: le
  endian: le
  id: articulationbody
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_mass
  type: f4
- id: m_parentanchorposition
  type: vector3f
- id: m_parentanchorrotation
  type: quaternionf
- id: m_anchorposition
  type: vector3f
- id: m_anchorrotation
  type: quaternionf
- id: m_matchanchors
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_articulationjointtype
  type: s4
- id: m_linearx
  type: s4
- id: m_lineary
  type: s4
- id: m_linearz
  type: s4
- id: m_swingy
  type: s4
- id: m_swingz
  type: s4
- id: m_twist
  type: s4
- id: m_xdrive
  type: articulationdrive
- id: m_ydrive
  type: articulationdrive
- id: m_zdrive
  type: articulationdrive
- id: m_lineardamping
  type: f4
- id: m_angulardamping
  type: f4
- id: m_jointfriction
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
- id: m_immovable
  type: b1
- id: m_usegravity
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_collisiondetectionmode
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
  articulationdrive:
    seq:
    - id: lowerlimit
      type: f4
    - id: upperlimit
      type: f4
    - id: stiffness
      type: f4
    - id: damping
      type: f4
    - id: forcelimit
      type: f4
    - id: target
      type: f4
    - id: targetvelocity
      type: f4
    - id: drivetype
      type: s4
  bitfield:
    seq:
    - id: m_bits
      type: u4
