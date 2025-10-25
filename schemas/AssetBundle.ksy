meta:
  bit-endian: le
  endian: le
  id: assetbundle
seq:
- id: m_name
  type: string
- id: m_preloadtable
  type: array
- id: m_container
  type: map
- id: m_mainasset
  type: assetinfo
- id: m_runtimecompatibility
  type: u4
- id: m_assetbundlename
  type: string
- id: m_dependencies
  type: array_d2
- id: m_isstreamedsceneassetbundle
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_explicitdatalayout
  type: s4
- id: m_pathflags
  type: s4
- id: m_scenehashes
  type: map_d1
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
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_object
  assetinfo:
    seq:
    - id: preloadindex
      type: s4
    - id: preloadsize
      type: s4
    - id: asset
      type: pptr_object
  pair:
    seq:
    - id: first
      type: string
    - id: second
      type: assetinfo
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
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
  pair_d1:
    seq:
    - id: first
      type: string
    - id: second
      type: string
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d1
  map_d1:
    seq:
    - id: array
      type: array_d3
