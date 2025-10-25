meta:
  bit-endian: le
  endian: le
  id: audiomixereffectcontroller
seq:
- id: m_name
  type: string
- id: m_effectid
  type: guid
- id: m_effectname
  type: string
- id: m_mixlevel
  type: guid
- id: m_parameters
  type: array
- id: m_sendtarget
  type: pptr_audiomixereffectcontroller
- id: m_enablewetmix
  type: b1
- id: m_bypass
  type: b1
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
  guid:
    seq:
    - id: data_0
      type: u4
    - id: data_1
      type: u4
    - id: data_2
      type: u4
    - id: data_3
      type: u4
  parameter:
    seq:
    - id: m_parametername
      type: string
    - id: m_guid
      type: guid
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: parameter
  pptr_audiomixereffectcontroller:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
