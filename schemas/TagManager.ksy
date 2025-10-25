meta:
  bit-endian: le
  endian: le
  id: tagmanager
seq:
- id: tags
  type: array
- id: layers
  type: array
- id: m_sortinglayers
  type: array_d1
- id: m_renderinglayers
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
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
  sortinglayerentry:
    seq:
    - id: name
      type: string
    - id: uniqueid
      type: u4
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: sortinglayerentry
