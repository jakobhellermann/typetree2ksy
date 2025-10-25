meta:
  bit-endian: le
  endian: le
  id: scriptedimporter
seq:
- id: m_name
  type: string
- id: m_internalidtonametable
  type: array
- id: m_externalobjects
  type: map
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_usedfileids
  type: array_d2
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_userdata
  type: string
- id: m_assetbundlename
  type: string
- id: m_assetbundlevariant
  type: string
- id: m_script
  type: pptr_monoscript
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
  pair:
    seq:
    - id: first
      type: s4
    - id: second
      type: s8
  pair_d1:
    seq:
    - id: first
      type: pair
    - id: second
      type: string
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d1
  sourceassetidentifier:
    seq:
    - id: type
      type: string
    - id: assembly
      type: string
    - id: name
      type: string
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pair_d2:
    seq:
    - id: first
      type: sourceassetidentifier
    - id: second
      type: pptr_object
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d2
  map:
    seq:
    - id: array
      type: array_d1
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s8
  pptr_monoscript:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
