meta:
  bit-endian: le
  endian: le
  id: audiomixersnapshot
seq:
- id: m_name
  type: string
- id: m_audiomixer
  type: pptr_audiomixer
- id: m_snapshotid
  type: guid
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
  pptr_audiomixer:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
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
