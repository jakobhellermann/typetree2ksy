meta:
  bit-endian: le
  endian: le
  id: videoplayer
seq:
- id: m_gameobject
  type: pptr_gameobject
- id: m_enabled
  type: u1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_videoclip
  type: pptr_videoclip
- id: m_targetcameraalpha
  type: f4
- id: m_targetcamera3dlayout
  type: s4
- id: m_targetcamera
  type: pptr_camera
- id: m_targettexture
  type: pptr_rendertexture
- id: m_timereference
  type: s4
- id: m_targetmaterialrenderer
  type: pptr_renderer
- id: m_targetmaterialproperty
  type: string
- id: m_rendermode
  type: s4
- id: m_aspectratio
  type: s4
- id: m_datasource
  type: s4
- id: m_timeupdatemode
  type: s4
- id: m_playbackspeed
  type: f4
- id: m_audiooutputmode
  type: s4
- id: m_targetaudiosources
  type: array
- id: m_directaudiovolumes
  type: array_d1
- id: m_url
  type: string
- id: m_enabledaudiotracks
  type: array_d2
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_directaudiomutes
  type: array_d2
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_controlledaudiotrackcount
  type: u2
- id: m_playonawake
  type: b1
- id: m_skipondrop
  type: b1
- id: m_looping
  type: b1
- id: m_waitforfirstframe
  type: b1
- id: m_framereadyeventenabled
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_videoshaders
  type: array_d3
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_videoclip:
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
  pptr_rendertexture:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_renderer:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
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
  pptr_audiosource:
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
      type: pptr_audiosource
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: f4
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: b1
  pptr_shader:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_shader
