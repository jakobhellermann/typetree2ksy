meta:
  bit-endian: le
  endian: le
  id: unityconnectsettings
seq:
- id: m_enabled
  type: b1
- id: m_testmode
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_eventoldurl
  type: string
- id: m_eventurl
  type: string
- id: m_configurl
  type: string
- id: m_dashboardurl
  type: string
- id: m_testinitmode
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: crashreportingsettings
  type: crashreportingsettings
- id: unitypurchasingsettings
  type: unitypurchasingsettings
- id: unityanalyticssettings
  type: unityanalyticssettings
- id: unityadssettings
  type: unityadssettings
- id: performancereportingsettings
  type: performancereportingsettings
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
  crashreportingsettings:
    seq:
    - id: m_eventurl
      type: string
    - id: m_enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_logbuffersize
      type: u4
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  unitypurchasingsettings:
    seq:
    - id: m_enabled
      type: b1
    - id: m_testmode
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  unityanalyticssettings:
    seq:
    - id: m_enabled
      type: b1
    - id: m_testmode
      type: b1
    - id: m_initializeonstartup
      type: b1
    - id: m_packagerequiringcorestatspresent
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  unityadssettings:
    seq:
    - id: m_enabled
      type: b1
    - id: m_initializeonstartup
      type: b1
    - id: m_testmode
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_gameid
      type: string
  performancereportingsettings:
    seq:
    - id: m_enabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
