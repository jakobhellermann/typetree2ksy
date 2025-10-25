meta:
  bit-endian: le
  endian: le
  id: audiolowpassfilter
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_lowpassresonanceq
  type: f4
- id: lowpasslevelcustomcurve
  type: animationcurve
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  keyframe:
    seq:
    - id: time
      type: f4
    - id: value
      type: f4
    - id: inslope
      type: f4
    - id: outslope
      type: f4
    - id: weightedmode
      type: s4
    - id: inweight
      type: f4
    - id: outweight
      type: f4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: keyframe
  animationcurve:
    seq:
    - id: m_curve
      type: array
    - id: m_preinfinity
      type: s4
    - id: m_postinfinity
      type: s4
    - id: m_rotationorder
      type: s4
