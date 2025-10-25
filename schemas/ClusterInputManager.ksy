meta:
  bit-endian: le
  endian: le
  id: clusterinputmanager
seq:
- id: m_inputs
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
  clusterinput:
    seq:
    - id: m_name
      type: string
    - id: m_devicename
      type: string
    - id: m_serverurl
      type: string
    - id: m_index
      type: s4
    - id: m_type
      type: s4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: clusterinput
