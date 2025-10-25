meta:
  bit-endian: le
  endian: le
  id: blendtree
seq:
- id: m_name
  type: string
- id: m_childs
  type: array
- id: m_blendparameter
  type: string
- id: m_blendparametery
  type: string
- id: m_minthreshold
  type: f4
- id: m_maxthreshold
  type: f4
- id: m_useautomaticthresholds
  type: b1
- id: m_normalizedblendvalues
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_blendtype
  type: s4
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
  pptr_motion:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  childmotion:
    seq:
    - id: m_motion
      type: pptr_motion
    - id: m_threshold
      type: f4
    - id: m_position
      type: vector2f
    - id: m_timescale
      type: f4
    - id: m_cycleoffset
      type: f4
    - id: m_directblendparameter
      type: string
    - id: m_mirror
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
      type: childmotion
