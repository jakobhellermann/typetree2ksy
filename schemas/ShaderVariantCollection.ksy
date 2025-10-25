meta:
  bit-endian: le
  endian: le
  id: shadervariantcollection
seq:
- id: m_name
  type: string
- id: m_shaders
  type: map
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
  pptr_shader:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  variantinfo:
    seq:
    - id: keywords
      type: string
    - id: passtype
      type: s4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: variantinfo
  shaderinfo:
    seq:
    - id: variants
      type: array
  pair:
    seq:
    - id: first
      type: pptr_shader
    - id: second
      type: shaderinfo
  array_d1:
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
      type: array_d1
