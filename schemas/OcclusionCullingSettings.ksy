meta:
  bit-endian: le
  endian: le
  id: occlusioncullingsettings
seq:
- id: m_sceneguid
  type: guid
- id: m_occlusioncullingdata
  type: pptr_occlusioncullingdata
- id: m_staticrenderers
  type: array
- id: m_portals
  type: array_d1
types:
  guid:
    seq:
    - id: data_0
      type: u4
    - id: data_1
      type: u4
    - id: data_2
      type: u4
    - id: data_3
      type: u4
  pptr_occlusioncullingdata:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_renderer:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_renderer
  pptr_occlusionportal:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_occlusionportal
