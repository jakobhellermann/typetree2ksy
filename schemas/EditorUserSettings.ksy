meta:
  bit-endian: le
  endian: le
  id: editorusersettings
seq:
- id: m_configsettings
  type: map
- id: m_vcautomaticadd
  type: b1
- id: m_vcdebugcom
  type: b1
- id: m_vcdebugcmd
  type: b1
- id: m_vcdebugout
  type: b1
- id: m_semanticmergemode
  type: s4
- id: m_desiredimportworkercount
  type: s4
- id: m_standbyimportworkercount
  type: s4
- id: m_idleimportworkershutdowndelay
  type: s4
- id: m_vcshowfailedcheckout
  type: b1
- id: m_vcoverwritefailedcheckoutassets
  type: b1
- id: m_vcprojectoverlayicons
  type: b1
- id: m_vchierarchyoverlayicons
  type: b1
- id: m_vcotheroverlayicons
  type: b1
- id: m_vcallowasyncupdate
  type: b1
- id: m_vcscanlocalpackagesonconnect
  type: b1
- id: m_artifactgarbagecollection
  type: b1
- id: m_compressassetsonimport
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
  configsetting:
    seq:
    - id: value
      type: string
    - id: flags
      type: u4
  pair:
    seq:
    - id: first
      type: string
    - id: second
      type: configsetting
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
