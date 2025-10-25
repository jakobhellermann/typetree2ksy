meta:
  bit-endian: le
  endian: le
  id: visualeffectresource
seq:
- id: m_name
  type: string
- id: m_graph
  type: pptr_monobehaviour
- id: m_infos
  type: visualeffectsettings
types:
  string:
    seq:
    - id: size
      type: s4
    - encoding: UTF-8
      id: data
      size: size
      type: str
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pptr_monobehaviour:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  vfxrenderersettings:
    seq:
    - id: motionvectorgenerationmode
      type: s4
    - id: shadowcastingmode
      type: s4
    - id: raytracingmode
      type: s4
    - id: receiveshadows
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: reflectionprobeusage
      type: s4
    - id: lightprobeusage
      type: s4
  visualeffectsettings:
    seq:
    - id: m_renderersettings
      type: vfxrenderersettings
    - id: m_cullingflags
      type: s4
    - id: m_updatemode
      type: s4
    - id: m_prewarmdeltatime
      type: f4
    - id: m_prewarmstepcount
      type: u4
    - id: m_initialeventname
      type: string
    - id: m_instancingmode
      type: s4
    - id: m_instancingcapacity
      type: u4
