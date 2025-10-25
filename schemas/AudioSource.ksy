meta:
  bit-endian: le
  endian: le
  id: audiosource
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: outputaudiomixergroup
  type: pptr_audiomixergroup
- id: m_audioclip
  type: pptr_audioclip
- id: m_resource
  type: pptr_audioresource
- id: m_playonawake
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_volume
  type: f4
- id: m_pitch
  type: f4
- id: loop
  type: b1
- id: mute
  type: b1
- id: spatialize
  type: b1
- id: spatializeposteffects
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: priority
  type: s4
- id: dopplerlevel
  type: f4
- id: mindistance
  type: f4
- id: maxdistance
  type: f4
- id: pan2d
  type: f4
- id: rolloffmode
  type: s4
- id: bypasseffects
  type: b1
- id: bypasslistenereffects
  type: b1
- id: bypassreverbzones
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: rolloffcustomcurve
  type: animationcurve
- id: panlevelcustomcurve
  type: animationcurve
- id: spreadcustomcurve
  type: animationcurve
- id: reverbzonemixcustomcurve
  type: animationcurve
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_audiomixergroup:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_audioclip:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_audioresource:
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
