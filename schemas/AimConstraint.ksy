meta:
  bit-endian: le
  endian: le
  id: aimconstraint
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_weight
  type: f4
- id: m_rotationatrest
  type: vector3f
- id: m_rotationoffset
  type: vector3f
- id: m_aimvector
  type: vector3f
- id: m_upvector
  type: vector3f
- id: m_worldupvector
  type: vector3f
- id: m_worldupobject
  type: pptr_transform
- id: m_uptype
  type: s4
- id: m_affectrotationx
  type: b1
- id: m_affectrotationy
  type: b1
- id: m_affectrotationz
  type: b1
- id: m_active
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_sources
  type: array
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
  pptr_transform:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  constraintsource:
    seq:
    - id: sourcetransform
      type: pptr_transform
    - id: weight
      type: f4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: constraintsource
