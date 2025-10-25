meta:
  bit-endian: le
  endian: le
  id: presetmanager
seq:
- id: m_defaultpresets
  type: map
types:
  pptr_monoscript:
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
  presettype:
    seq:
    - id: m_nativetypeid
      type: s4
    - id: m_managedtypepptr
      type: pptr_monoscript
    - id: m_managedtypefallback
      type: string
  pptr_preset:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  defaultpreset:
    seq:
    - id: m_preset
      type: pptr_preset
    - id: m_filter
      type: string
    - id: m_disabled
      type: b1
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
      type: defaultpreset
  pair:
    seq:
    - id: first
      type: presettype
    - id: second
      type: array
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
