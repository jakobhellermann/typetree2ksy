meta:
  bit-endian: le
  endian: le
  id: shadernameregistry
seq:
- id: m_shaders
  type: nametoobjectmap
- id: m_preloadshaders
  type: b1
types:
  pptr_shader:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
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
  pair:
    seq:
    - id: first
      type: pptr_shader
    - id: second
      type: string
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair
  map:
    seq:
    - id: array
      type: array
  nametoobjectmap:
    seq:
    - id: m_objecttoname
      type: map
