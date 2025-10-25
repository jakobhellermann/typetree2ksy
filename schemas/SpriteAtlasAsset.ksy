meta:
  bit-endian: le
  endian: le
  id: spriteatlasasset
seq:
- id: m_name
  type: string
- id: m_masteratlas
  type: pptr_spriteatlas
- id: m_importerdata
  type: spriteatlasassetdata
- id: m_isvariant
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_scriptablepacker
  type: pptr_object
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
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
  pptr_spriteatlas:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_object:
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
      type: pptr_object
  spriteatlasassetdata:
    seq:
    - id: packables
      type: array
