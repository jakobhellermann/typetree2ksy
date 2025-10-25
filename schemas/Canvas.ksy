meta:
  bit-endian: le
  endian: le
  id: canvas
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_rendermode
  type: s4
- id: m_camera
  type: pptr_camera
- id: m_planedistance
  type: f4
- id: m_pixelperfect
  type: b1
- id: m_receivesevents
  type: b1
- id: m_overridesorting
  type: b1
- id: m_overridepixelperfect
  type: b1
- id: m_sortingbucketnormalizedsize
  type: f4
- id: m_vertexcoloralwaysgammaspace
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_additionalshaderchannelsflag
  type: s4
- id: m_updaterecttransformforstandalone
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_sortinglayerid
  type: s4
- id: m_sortingorder
  type: s2
- id: m_targetdisplay
  type: s1
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_camera:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
