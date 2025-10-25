meta:
  bit-endian: le
  endian: le
  id: scenevisibilitystate
seq:
- id: m_scenevisibilitydata
  type: scenedatacontainer
- id: m_scenevisibilitydataisolated
  type: scenedatacontainer
- id: m_scenepickingdata
  type: scenedatacontainer
- id: m_isolationmode
  type: b1
types:
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
  sceneidentifier:
    seq:
    - id: guid
      type: guid
    - id: handle
      type: s4
  hierarchicalscenedata:
    seq:
    - id: m_sceneguid
      type: guid
  pair:
    seq:
    - id: first
      type: sceneidentifier
    - id: second
      type: hierarchicalscenedata
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
  scenedatacontainer:
    seq:
    - id: m_scenedata
      type: map
