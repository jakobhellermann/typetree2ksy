meta:
  bit-endian: le
  endian: le
  id: projector
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_nearclipplane
  type: f4
- id: m_farclipplane
  type: f4
- id: m_fieldofview
  type: f4
- id: m_aspectratio
  type: f4
- id: m_orthographic
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_orthographicsize
  type: f4
- id: m_material
  type: pptr_material
- id: m_ignorelayers
  type: bitfield
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_material:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  bitfield:
    seq:
    - id: m_bits
      type: u4
