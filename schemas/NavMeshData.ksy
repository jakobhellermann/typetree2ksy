meta:
  bit-endian: le
  endian: le
  id: navmeshdata
seq:
- id: m_name
  type: string
- id: m_navmeshtiles
  type: array_d1
- id: m_navmeshbuildsettings
  type: navmeshbuildsettings
- id: m_heightmaps
  type: array_d2
- id: m_heightmeshes
  type: array_d6
- id: m_offmeshlinks
  type: array_d7
- id: m_sourcebounds
  type: aabb
- id: m_rotation
  type: quaternionf
- id: m_position
  type: vector3f
- id: m_agenttypeid
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
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  hash128:
    seq:
    - id: bytes_0
      type: u1
    - id: bytes_1
      type: u1
    - id: bytes_2
      type: u1
    - id: bytes_3
      type: u1
    - id: bytes_4
      type: u1
    - id: bytes_5
      type: u1
    - id: bytes_6
      type: u1
    - id: bytes_7
      type: u1
    - id: bytes_8
      type: u1
    - id: bytes_9
      type: u1
    - id: bytes_10
      type: u1
    - id: bytes_11
      type: u1
    - id: bytes_12
      type: u1
    - id: bytes_13
      type: u1
    - id: bytes_14
      type: u1
    - id: bytes_15
      type: u1
  navmeshtiledata:
    seq:
    - id: m_meshdata
      type: array
    - id: m_hash
      type: hash128
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: navmeshtiledata
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
  matrix4x4f:
    seq:
    - id: e00
      type: f4
    - id: e01
      type: f4
    - id: e02
      type: f4
    - id: e03
      type: f4
    - id: e10
      type: f4
    - id: e11
      type: f4
    - id: e12
      type: f4
    - id: e13
      type: f4
    - id: e20
      type: f4
    - id: e21
      type: f4
    - id: e22
      type: f4
    - id: e23
      type: f4
    - id: e30
      type: f4
    - id: e31
      type: f4
    - id: e32
      type: f4
    - id: e33
      type: f4
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  heightmapdata:
    seq:
    - id: surfacetoterrain
      type: matrix4x4f
    - id: terraindata
      type: pptr_object
    - id: isrotated
      type: b1
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: heightmapdata
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vector3f
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s4
  aabb:
    seq:
    - id: m_center
      type: vector3f
    - id: m_extent
      type: vector3f
  heightmeshbvnode:
    seq:
    - id: min
      type: vector3f
    - id: max
      type: vector3f
    - id: i
      type: s4
    - id: n
      type: s4
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: heightmeshbvnode
  heightmeshdata:
    seq:
    - id: m_vertices
      type: array_d3
    - id: m_indices
      type: array_d4
    - id: m_bounds
      type: aabb
    - id: m_nodes
      type: array_d5
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: heightmeshdata
  autooffmeshlinkdata:
    seq:
    - id: m_start
      type: vector3f
    - id: m_end
      type: vector3f
    - id: m_radius
      type: f4
    - id: m_linktype
      type: u2
    - id: m_area
      type: u1
    - id: m_linkdirection
      type: u1
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: autooffmeshlinkdata
  quaternionf:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
    - id: w
      type: f4
