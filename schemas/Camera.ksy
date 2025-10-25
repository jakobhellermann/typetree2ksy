meta:
  bit-endian: le
  endian: le
  id: game_object
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_clearflags
  type: u4
- id: m_backgroundcolor
  type: colorrgba
- id: m_projectionmatrixmode
  type: s4
- id: m_gatefitmode
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_iso
  type: s4
- id: m_shutterspeed
  type: f4
- id: m_aperture
  type: f4
- id: m_focusdistance
  type: f4
- id: m_focallength
  type: f4
- id: m_bladecount
  type: s4
- id: m_curvature
  type: vector2f
- id: m_barrelclipping
  type: f4
- id: m_anamorphism
  type: f4
- id: m_sensorsize
  type: vector2f_disambig
- id: m_lensshift
  type: vector2f_disambig_disambig
- id: m_normalizedviewportrect
  type: rectf
- id: near_clip_plane
  type: f4
- id: far_clip_plane
  type: f4
- id: field_of_view
  type: f4
- id: orthographic
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: orthographic_size
  type: f4
- id: m_depth
  type: f4
- id: m_cullingmask
  type: bitfield
- id: m_renderingpath
  type: s4
- id: m_targettexture
  type: pptr_rendertexture
- id: m_targetdisplay
  type: s4
- id: m_targeteye
  type: s4
- id: m_hdr
  type: b1
- id: m_allowmsaa
  type: b1
- id: m_allowdynamicresolution
  type: b1
- id: m_forceintort
  type: b1
- id: m_occlusionculling
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_stereoconvergence
  type: f4
- id: m_stereoseparation
  type: f4
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
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
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  vector2f_disambig:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  vector2f_disambig_disambig:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  rectf:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: width
      type: f4
    - id: height
      type: f4
  bitfield:
    seq:
    - id: m_bits
      type: u4
  pptr_rendertexture:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
