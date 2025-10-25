meta:
  bit-endian: le
  endian: le
  id: vfxmanager
seq:
- id: m_indirectshader
  type: pptr_computeshader
- id: m_copybuffershader
  type: pptr_computeshader
- id: m_prefixsumshader
  type: pptr_computeshader
- id: m_sortshader
  type: pptr_computeshader
- id: m_stripupdateshader
  type: pptr_computeshader
- id: m_emptyshader
  type: pptr_shader
- id: m_renderpipesettingspath
  type: string
- id: m_fixedtimestep
  type: f4
- id: m_maxdeltatime
  type: f4
- id: m_maxscrubtime
  type: f4
- id: m_maxcapacity
  type: u4
- id: m_compiledversion
  type: u4
- id: m_runtimeversion
  type: u4
- id: m_runtimeresources
  type: pptr_monobehaviour
- id: m_batchemptylifetime
  type: u4
types:
  pptr_computeshader:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_shader:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
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
