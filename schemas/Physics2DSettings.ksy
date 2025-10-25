meta:
  bit-endian: le
  endian: le
  id: physics2dsettings
seq:
- id: m_gravity
  type: vector2f
- id: m_defaultmaterial
  type: pptr_physicsmaterial2d
- id: m_velocityiterations
  type: s4
- id: m_positioniterations
  type: s4
- id: m_bouncethreshold
  type: f4
- id: m_maxlinearcorrection
  type: f4
- id: m_maxangularcorrection
  type: f4
- id: m_maxtranslationspeed
  type: f4
- id: m_maxrotationspeed
  type: f4
- id: m_baumgartescale
  type: f4
- id: m_baumgartetimeofimpactscale
  type: f4
- id: m_timetosleep
  type: f4
- id: m_linearsleeptolerance
  type: f4
- id: m_angularsleeptolerance
  type: f4
- id: m_defaultcontactoffset
  type: f4
- id: m_contactthreshold
  type: f4
- id: m_joboptions
  type: physicsjoboptions2d
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_simulationmode
  type: s4
- id: m_simulationlayers
  type: bitfield
- id: m_maxsubstepcount
  type: s4
- id: m_minsubstepfps
  type: f4
- id: m_usesubstepping
  type: b1
- id: m_usesubstepcontacts
  type: b1
- id: m_querieshittriggers
  type: b1
- id: m_queriesstartincolliders
  type: b1
- id: m_callbacksondisable
  type: b1
- id: m_reusecollisioncallbacks
  type: b1
- id: m_autosynctransforms
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_layercollisionmatrix
  type: array
types:
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  pptr_physicsmaterial2d:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  physicsjoboptions2d:
    seq:
    - id: usemultithreading
      type: b1
    - id: useconsistencysorting
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_interpolationposesperjob
      type: s4
    - id: m_newcontactsperjob
      type: s4
    - id: m_collidecontactsperjob
      type: s4
    - id: m_clearflagsperjob
      type: s4
    - id: m_clearbodyforcesperjob
      type: s4
    - id: m_syncdiscretefixturesperjob
      type: s4
    - id: m_synccontinuousfixturesperjob
      type: s4
    - id: m_findnearestcontactsperjob
      type: s4
    - id: m_updatetriggercontactsperjob
      type: s4
    - id: m_islandsolvercostthreshold
      type: s4
    - id: m_islandsolverbodycostscale
      type: s4
    - id: m_islandsolvercontactcostscale
      type: s4
    - id: m_islandsolverjointcostscale
      type: s4
    - id: m_islandsolverbodiesperjob
      type: s4
    - id: m_islandsolvercontactsperjob
      type: s4
  bitfield:
    seq:
    - id: m_bits
      type: u4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
