meta:
  bit-endian: le
  endian: le
  id: capsulecollider
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_material
  type: pptr_physicsmaterial
- id: m_includelayers
  type: bitfield
- id: m_excludelayers
  type: bitfield
- id: m_layeroverridepriority
  type: s4
- id: m_istrigger
  type: b1
- id: m_providescontacts
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_enabled
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_radius
  type: f4
- id: m_height
  type: f4
- id: m_direction
  type: s4
- id: m_center
  type: vector3f
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_physicsmaterial:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  bitfield:
    seq:
    - id: m_bits
      type: u4
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
