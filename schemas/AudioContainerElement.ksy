meta:
  bit-endian: le
  endian: le
  id: audiocontainerelement
seq:
- id: m_name
  type: string
- id: m_audioclip
  type: pptr_audioclip
- id: m_volume
  type: f4
- id: m_enabled
  type: b1
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
  pptr_audioclip:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
