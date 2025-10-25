meta:
  bit-endian: le
  endian: le
  id: terraincollider
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
- id: m_terraindata
  type: pptr_terraindata
- id: m_enabletreecolliders
  type: b1
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
  pptr_terraindata:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
