meta:
  bit-endian: le
  endian: le
  id: audiomixercontroller
seq:
- id: m_name
  type: string
- id: m_outputgroup
  type: pptr_audiomixergroup
- id: m_mastergroup
  type: pptr_audiomixergroup
- id: m_snapshots
  type: array
- id: m_startsnapshot
  type: pptr_audiomixersnapshot
- id: m_suspendthreshold
  type: f4
- id: m_enablesuspend
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_updatemode
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_mixerconstant
  type: audiomixerconstant
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
  pptr_audiomixergroup:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_audiomixersnapshot:
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
      type: pptr_audiomixersnapshot
  groupconstant:
    seq:
    - id: parentconstantindex
      type: s4
    - id: volumeindex
      type: u4
    - id: pitchindex
      type: u4
    - id: mute
      type: b1
    - id: solo
      type: b1
    - id: bypasseffects
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: groupconstant
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
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: guid
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
  effectconstant:
    seq:
    - id: type
      type: s4
    - id: groupconstantindex
      type: u4
    - id: sendtargeteffectindex
      type: u4
    - id: wetmixlevelindex
      type: u4
    - id: preveffectindex
      type: u4
    - id: bypass
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: parameterindices
      type: array_d3
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: effectconstant
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: f4
  snapshotconstant:
    seq:
    - id: namehash
      type: u4
    - id: values
      type: array_d5
    - id: transitiontypes
      type: array_d3
    - id: transitionindices
      type: array_d3
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: snapshotconstant
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  audiomixerconstant:
    seq:
    - id: groups
      type: array_d1
    - id: groupguids
      type: array_d2
    - id: effects
      type: array_d4
    - id: effectguids
      type: array_d2
    - id: numsidechainbuffers
      type: u4
    - id: snapshots
      type: array_d6
    - id: snapshotguids
      type: array_d2
    - id: groupnamebuffer
      type: array_d7
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: snapshotnamebuffer
      type: array_d7
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: plugineffectnamebuffer
      type: array_d7
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: exposedparameternames
      type: array_d3
    - id: exposedparameterindices
      type: array_d3
