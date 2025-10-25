meta:
  bit-endian: le
  endian: le
  id: packedassets
seq:
- id: m_shortpath
  type: string
- id: m_overhead
  type: u8
- id: m_contents
  type: array
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
  buildreportpackedassetinfo:
    seq:
    - id: fileid
      type: s8
    - id: classid
      type: u4
    - id: packedsize
      type: u8
    - id: offset
      type: u8
    - id: sourceassetguid
      type: guid
    - id: buildtimeassetpath
      type: string
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: buildreportpackedassetinfo
