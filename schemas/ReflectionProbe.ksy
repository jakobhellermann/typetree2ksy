meta:
  bit-endian: le
  endian: le
  id: reflectionprobe
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_type
  type: s4
- id: m_mode
  type: s4
- id: m_refreshmode
  type: s4
- id: m_timeslicingmode
  type: s4
- id: m_resolution
  type: s4
- id: m_updatefrequency
  type: s4
- id: m_boxsize
  type: vector3f
- id: m_boxoffset
  type: vector3f
- id: m_nearclip
  type: f4
- id: m_farclip
  type: f4
- id: m_shadowdistance
  type: f4
- id: m_clearflags
  type: u4
- id: m_backgroundcolor
  type: colorrgba
- id: m_cullingmask
  type: bitfield
- id: m_intensitymultiplier
  type: f4
- id: m_blenddistance
  type: f4
- id: m_hdr
  type: b1
- id: m_boxprojection
  type: b1
- id: m_renderdynamicobjects
  type: b1
- id: m_useocclusionculling
  type: b1
- id: m_importance
  type: s2
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_custombakedtexture
  type: pptr_texture
- id: m_bakedtexture
  type: pptr_texture
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
  colorrgba:
    seq:
    - id: r
      type: f4
    - id: g
      type: f4
    - id: b
      type: f4
    - id: a
      type: f4
  bitfield:
    seq:
    - id: m_bits
      type: u4
  pptr_texture:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
