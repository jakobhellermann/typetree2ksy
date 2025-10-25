meta:
  bit-endian: le
  endian: le
  id: lightprobeproxyvolume
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_boundingboxmode
  type: s4
- id: m_resolutionx
  type: u4
- id: m_resolutiony
  type: u4
- id: m_resolutionz
  type: u4
- id: m_resolutionprobesperunit
  type: f4
- id: m_boundingboxsize
  type: vector3f
- id: m_boundingboxorigin
  type: vector3f
- id: m_resolutionmode
  type: s4
- id: m_probepositionmode
  type: s4
- id: m_refreshmode
  type: s4
- id: m_qualitymode
  type: s4
- id: m_dataformat
  type: s4
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
