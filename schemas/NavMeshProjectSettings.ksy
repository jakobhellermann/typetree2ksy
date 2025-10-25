meta:
  bit-endian: le
  endian: le
  id: navmeshprojectsettings
seq:
- id: areas
  type: array
- id: m_lastagenttypeid
  type: s4
- id: m_settings
  type: array_d1
- id: m_settingnames
  type: array_d2
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
  navmeshareadata:
    seq:
    - id: name
      type: string
    - id: cost
      type: f4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: navmeshareadata
  navmeshbuilddebugsettings:
    seq:
    - id: m_flags
      type: u1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  navmeshbuildsettings:
    seq:
    - id: agenttypeid
      type: s4
    - id: agentradius
      type: f4
    - id: agentheight
      type: f4
    - id: agentslope
      type: f4
    - id: agentclimb
      type: f4
    - id: ledgedropheight
      type: f4
    - id: maxjumpacrossdistance
      type: f4
    - id: minregionarea
      type: f4
    - id: manualcellsize
      type: s4
    - id: cellsize
      type: f4
    - id: manualtilesize
      type: s4
    - id: tilesize
      type: s4
    - id: buildheightmesh
      type: s4
    - id: maxjobworkers
      type: u4
    - id: preservetilesoutsidebounds
      type: s4
    - id: debug
      type: navmeshbuilddebugsettings
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: navmeshbuildsettings
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
