meta:
  bit-endian: le
  endian: le
  id: boxcollider2d
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_density
  type: f4
- id: m_material
  type: pptr_physicsmaterial2d
- id: m_includelayers
  type: bitfield
- id: m_excludelayers
  type: bitfield
- id: m_layeroverridepriority
  type: s4
- id: m_forcesendlayers
  type: bitfield
- id: m_forcereceivelayers
  type: bitfield
- id: m_contactcapturelayers
  type: bitfield
- id: m_callbacklayers
  type: bitfield
- id: m_istrigger
  type: b1
- id: m_usedbyeffector
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_compositeoperation
  type: s4
- id: m_compositeorder
  type: s4
- id: m_offset
  type: vector2f
- id: m_spritetilingproperty
  type: spritetilingproperty
- id: m_autotiling
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_size
  type: vector2f
- id: m_edgeradius
  type: f4
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
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  vector4f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
    - id: w
      type: f4
  spritetilingproperty:
    seq:
    - id: border
      type: vector4f
    - id: pivot
      type: vector2f
    - id: oldsize
      type: vector2f
    - id: newsize
      type: vector2f
    - id: adaptivetilingthreshold
      type: f4
    - id: drawmode
      type: s4
    - id: adaptivetiling
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
