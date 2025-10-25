meta:
  bit-endian: le
  endian: le
  id: configurablejoint
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_connectedbody
  type: pptr_rigidbody
- id: m_connectedarticulationbody
  type: pptr_articulationbody
- id: m_anchor
  type: vector3f
- id: m_axis
  type: vector3f
- id: m_autoconfigureconnectedanchor
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_connectedanchor
  type: vector3f
- id: m_secondaryaxis
  type: vector3f
- id: m_xmotion
  type: s4
- id: m_ymotion
  type: s4
- id: m_zmotion
  type: s4
- id: m_angularxmotion
  type: s4
- id: m_angularymotion
  type: s4
- id: m_angularzmotion
  type: s4
- id: m_linearlimitspring
  type: softjointlimitspring
- id: m_linearlimit
  type: softjointlimit
- id: m_angularxlimitspring
  type: softjointlimitspring
- id: m_lowangularxlimit
  type: softjointlimit
- id: m_highangularxlimit
  type: softjointlimit
- id: m_angularyzlimitspring
  type: softjointlimitspring
- id: m_angularylimit
  type: softjointlimit
- id: m_angularzlimit
  type: softjointlimit
- id: m_targetposition
  type: vector3f
- id: m_targetvelocity
  type: vector3f
- id: m_xdrive
  type: jointdrive
- id: m_ydrive
  type: jointdrive
- id: m_zdrive
  type: jointdrive
- id: m_targetrotation
  type: quaternionf
- id: m_targetangularvelocity
  type: vector3f
- id: m_rotationdrivemode
  type: s4
- id: m_angularxdrive
  type: jointdrive
- id: m_angularyzdrive
  type: jointdrive
- id: m_slerpdrive
  type: jointdrive
- id: m_projectionmode
  type: s4
- id: m_projectiondistance
  type: f4
- id: m_projectionangle
  type: f4
- id: m_configuredinworldspace
  type: b1
- id: m_swapbodies
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_breakforce
  type: f4
- id: m_breaktorque
  type: f4
- id: m_enablecollision
  type: b1
- id: m_enablepreprocessing
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_massscale
  type: f4
- id: m_connectedmassscale
  type: f4
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_rigidbody:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_articulationbody:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  softjointlimitspring:
    seq:
    - id: spring
      type: f4
    - id: damper
      type: f4
  softjointlimit:
    seq:
    - id: limit
      type: f4
    - id: bounciness
      type: f4
    - id: contactdistance
      type: f4
  jointdrive:
    seq:
    - id: positionspring
      type: f4
    - id: positiondamper
      type: f4
    - id: maximumforce
      type: f4
    - id: useacceleration
      type: s4
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
