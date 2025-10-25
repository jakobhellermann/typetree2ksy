meta:
  bit-endian: le
  endian: le
  id: playabledirector
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_playableasset
  type: pptr_object
- id: m_initialstate
  type: s4
- id: m_wrapmode
  type: s4
- id: m_directorupdatemode
  type: s4
- id: m_initialtime
  type: f8
- id: m_scenebindings
  type: array
- id: m_exposedreferences
  type: exposedreferencetable
types:
  pptr_gameobject:
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
  directorgenericbinding:
    seq:
    - id: key
      type: pptr_object
    - id: value
      type: pptr_object
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: directorgenericbinding
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
      type: string
    - id: second
      type: pptr_object
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
  exposedreferencetable:
    seq:
    - id: m_references
      type: map
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
