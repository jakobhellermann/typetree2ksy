meta:
  bit-endian: le
  endian: le
  id: brokenprefabasset
seq:
- id: m_name
  type: string
- id: m_message
  type: string
- id: m_iswarning
  type: b1
- id: m_isvariant
  type: b1
- id: m_isprefabfilevalid
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_brokenparentprefab
  type: pptr_brokenprefabasset
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
  pptr_brokenprefabasset:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
