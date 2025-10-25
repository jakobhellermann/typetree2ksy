meta:
  bit-endian: le
  endian: le
  id: preset
seq:
- id: m_name
  type: string
- id: m_targettype
  type: presettype
- id: m_properties
  type: array
- id: m_excludedproperties
  type: array_d1
- id: m_coupledtype
  type: presettype
- id: m_coupledproperties
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
  pptr_monoscript:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  presettype:
    seq:
    - id: m_nativetypeid
      type: s4
    - id: m_managedtypepptr
      type: pptr_monoscript
    - id: m_managedtypefallback
      type: string
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  propertymodification:
    seq:
    - id: target
      type: pptr_object
    - id: propertypath
      type: string
    - id: value
      type: string
    - id: objectreference
      type: pptr_object
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: propertymodification
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
