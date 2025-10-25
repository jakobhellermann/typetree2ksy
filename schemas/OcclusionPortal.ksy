meta:
  bit-endian: le
  endian: le
  id: occlusionportal
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_open
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_center
  type: vector3f
- id: m_size
  type: vector3f
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
