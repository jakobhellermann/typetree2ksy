meta:
  bit-endian: le
  endian: le
  id: navmeshsettings
seq:
- id: m_navmeshdata
  type: pptr_navmeshdata
types:
  pptr_navmeshdata:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
