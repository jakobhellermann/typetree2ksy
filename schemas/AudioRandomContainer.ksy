meta:
  bit-endian: le
  endian: le
  id: audiorandomcontainer
seq:
- id: m_name
  type: string
- id: m_volume
  type: f4
- id: m_pitch
  type: f4
- id: m_automatictriggertime
  type: f4
- id: m_loopcount
  type: s4
- id: m_volumerandomizationrange
  type: vector2f
- id: m_pitchrandomizationrange
  type: vector2f
- id: m_automatictriggertimerandomizationrange
  type: vector2f
- id: m_loopcountrandomizationrange
  type: vector2f
- id: m_elements
  type: array
- id: m_avoidrepeatinglast
  type: s4
- id: m_playbackmode
  type: s4
- id: m_triggermode
  type: s4
- id: m_automatictriggermode
  type: s4
- id: m_loopmode
  type: s4
- id: m_volumerandomizationenabled
  type: b1
- id: m_pitchrandomizationenabled
  type: b1
- id: m_automatictriggertimerandomizationenabled
  type: b1
- id: m_loopcountrandomizationenabled
  type: b1
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
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  pptr_audiocontainerelement:
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
      type: pptr_audiocontainerelement
