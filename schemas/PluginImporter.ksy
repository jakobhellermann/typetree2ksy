meta:
  bit-endian: le
  endian: le
  id: pluginimporter
seq:
- id: m_name
  type: string
- id: m_externalobjects
  type: map
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_usedfileids
  type: array_d1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_iconmap
  type: map_d1
- id: m_executionorder
  type: map_d2
- id: m_defineconstraints
  type: array_d4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_ispreloaded
  type: b1
- id: m_isoverridable
  type: b1
- id: m_isexplicitlyreferenced
  type: b1
- id: m_validatereferences
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_platformdata
  type: map_d4
- id: m_output
  type: pluginimportoutput
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_userdata
  type: string
- id: m_assetbundlename
  type: string
- id: m_assetbundlevariant
  type: string
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
  pair:
    seq:
    - id: first
      type: sourceassetidentifier
    - id: second
      type: pptr_object
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
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s8
  pptr_texture2d:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pair_d1:
    seq:
    - id: first
      type: string
    - id: second
      type: pptr_texture2d
  array_d2:
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
      type: array_d2
  pair_d2:
    seq:
    - id: first
      type: string
    - id: second
      type: s4
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d2
  map_d2:
    seq:
    - id: array
      type: array_d3
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
  pair_d3:
    seq:
    - id: first
      type: string
    - id: second
      type: string
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d3
  map_d3:
    seq:
    - id: array
      type: array_d5
  platformsettingsdata:
    seq:
    - id: enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: settings
      type: map_d3
  pair_d4:
    seq:
    - id: first
      type: string
    - id: second
      type: platformsettingsdata
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d4
  map_d4:
    seq:
    - id: array
      type: array_d6
  pluginimportoutput:
    seq:
    - id: dlltype
      type: s4
    - id: scriptingruntimeversion
      type: s4
