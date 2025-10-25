meta:
  bit-endian: le
  endian: le
  id: videoclipimporter
seq:
- id: m_name
  type: string
- id: m_externalobjects
  type: map
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_usedfileids
  type: array_d1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_framerange
  type: s4
- id: m_startframe
  type: s4
- id: m_endframe
  type: s4
- id: m_colorspace
  type: s4
- id: m_deinterlace
  type: s4
- id: m_encodealpha
  type: b1
- id: m_flipvertical
  type: b1
- id: m_fliphorizontal
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_importaudio
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_targetsettings
  type: map_d1
- id: m_output
  type: videoclipimporteroutput
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_userdata
  type: string
- id: m_assetbundlename
  type: string
- id: m_assetbundlevariant
  type: string
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
  sourceassetidentifier:
    seq:
    - id: type
      type: string
    - id: assembly
      type: string
    - id: name
      type: string
  pptr_object:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pair:
    seq:
    - id: first
      type: sourceassetidentifier
    - id: second
      type: pptr_object
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair
  map:
    seq:
    - id: array
      type: array
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s8
  videoclipimportertargetsettings:
    seq:
    - id: enabletranscoding
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: codec
      type: s4
    - id: resizeformat
      type: s4
    - id: aspectratio
      type: s4
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: customwidth
      type: s4
    - id: customheight
      type: s4
    - id: bitratemode
      type: s4
    - id: spatialquality
      type: s4
  pair_d1:
    seq:
    - id: first
      type: string
    - id: second
      type: videoclipimportertargetsettings
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d1
  map_d1:
    seq:
    - id: array
      type: array_d2
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u2
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
  videoclipimporteroutput:
    seq:
    - id: sourcepixelaspectrationumerator
      type: u4
    - id: sourcepixelaspectratiodenominator
      type: u4
    - id: sourceframerate
      type: f8
    - id: sourcefilesize
      type: u8
    - id: sourceaudiochannelcount
      type: array_d3
    - id: sourcehasalpha
      type: b1
    - id: transcodeskipped
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: sourceaudiosamplerate
      type: array_d4
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: originalwidth
      type: s4
    - id: originalheight
      type: s4
    - id: originalframecount
      type: s4
    - id: encodedsettings
      type: videoclipimportertargetsettings
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
