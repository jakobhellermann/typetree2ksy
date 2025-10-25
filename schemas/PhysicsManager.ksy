meta:
  bit-endian: le
  endian: le
  id: physicsmanager
seq:
- id: m_gravity
  type: vector3f
- id: m_defaultmaterial
  type: pptr_physicsmaterial
- id: m_bouncethreshold
  type: f4
- id: m_defaultmaxdepenetrationvelocity
  type: f4
- id: m_sleepthreshold
  type: f4
- id: m_defaultcontactoffset
  type: f4
- id: m_defaultsolveriterations
  type: s4
- id: m_defaultsolvervelocityiterations
  type: s4
- id: m_querieshitbackfaces
  type: b1
- id: m_querieshittriggers
  type: b1
- id: m_enableadaptiveforce
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_clothintercollisiondistance
  type: f4
- id: m_clothintercollisionstiffness
  type: f4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_layercollisionmatrix
  type: array
- id: m_simulationmode
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_autosynctransforms
  type: b1
- id: m_reusecollisioncallbacks
  type: b1
- id: m_invokecollisioncallbacks
  type: b1
- id: m_clothintercollisionsettingstoggle
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_clothgravity
  type: vector3f
- id: m_contactpairsmode
  type: s4
- id: m_broadphasetype
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_frictiontype
  type: s4
- id: m_enableenhanceddeterminism
  type: b1
- id: m_improvedpatchfriction
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_solvertype
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_defaultmaxangularspeed
  type: f4
- id: m_scratchbufferchunkcount
  type: u4
- id: m_currentbackendid
  type: u4
- id: m_fastmotionthreshold
  type: f4
types:
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  pptr_physicsmaterial:
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
      type: u4
