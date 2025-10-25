meta:
  bit-endian: le
  endian: le
  id: importlog
seq:
- id: m_name
  type: string
- id: m_logs
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
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  importlog_importlogentry:
    seq:
    - id: message
      type: string
    - id: mode
      type: s4
    - id: line
      type: s4
    - id: file
      type: string
    - id: object
      type: pptr_object
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: importlog_importlogentry
