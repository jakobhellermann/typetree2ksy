meta:
  bit-endian: le
  endian: le
  id: audioreverbfilter
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_drylevel
  type: f4
- id: m_room
  type: f4
- id: m_roomhf
  type: f4
- id: m_decaytime
  type: f4
- id: m_decayhfratio
  type: f4
- id: m_reflectionslevel
  type: f4
- id: m_reverblevel
  type: f4
- id: m_reverbdelay
  type: f4
- id: m_diffusion
  type: f4
- id: m_density
  type: f4
- id: m_hfreference
  type: f4
- id: m_roomlf
  type: f4
- id: m_lfreference
  type: f4
- id: m_reflectionsdelay
  type: f4
- id: m_reverbpreset
  type: s4
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
