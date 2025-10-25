meta:
  bit-endian: le
  endian: le
  id: cloth
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_stretchingstiffness
  type: f4
- id: m_bendingstiffness
  type: f4
- id: m_usetethers
  type: b1
- id: m_usegravity
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_damping
  type: f4
- id: m_externalacceleration
  type: vector3f
- id: m_randomacceleration
  type: vector3f
- id: m_worldvelocityscale
  type: f4
- id: m_worldaccelerationscale
  type: f4
- id: m_friction
  type: f4
- id: m_collisionmassscale
  type: f4
- id: m_usecontinuouscollision
  type: b1
- id: m_usevirtualparticles
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_solverfrequency
  type: f4
- id: m_sleepthreshold
  type: f4
- id: m_coefficients
  type: array
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_capsulecolliders
  type: array_d1
- id: m_spherecolliders
  type: array_d2
- id: m_selfcollisiondistance
  type: f4
- id: m_selfcollisionstiffness
  type: f4
- id: m_selfandintercollisionindices
  type: array_d3
- id: m_virtualparticleweights
  type: array_d4
- id: m_virtualparticleindices
  type: array_d3
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
  clothconstraincoefficients:
    seq:
    - id: maxdistance
      type: f4
    - id: collisionspheredistance
      type: f4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: clothconstraincoefficients
  pptr_capsulecollider:
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
      type: pptr_capsulecollider
  pptr_spherecollider:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  clothspherecolliderpair:
    seq:
    - id: first
      type: pptr_spherecollider
    - id: second
      type: pptr_spherecollider
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: clothspherecolliderpair
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vector3f
