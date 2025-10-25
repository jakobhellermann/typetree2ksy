meta:
  bit-endian: le
  endian: le
  id: raytracingshader
seq:
- id: m_name
  type: string
- id: variants
  type: array_d6
- id: m_maxrecursiondepth
  type: u4
- id: m_enableraypayloadsizechecks
  type: b1
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
  raytracingshaderid:
    seq:
    - id: type
      type: s4
    - id: name
      type: string
  raytracingshaderfunctiondesc:
    seq:
    - id: identifier
      type: raytracingshaderid
    - id: payloadsizeinbytes
      type: u4
    - id: attributesizeinbytes
      type: u4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: raytracingshaderfunctiondesc
  raytracingshaderresource:
    seq:
    - id: name
      type: string
    - id: bindpoint
      type: s4
    - id: samplerbindpoint
      type: s4
    - id: texdimension
      type: s4
    - id: raygenmask
      type: u8
    - id: arraysize
      type: s4
    - id: multisampled
      type: b1
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: raytracingshaderresource
  raytracingshaderbuiltinsampler:
    seq:
    - id: sampler
      type: u4
    - id: bindpoint
      type: s4
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: raytracingshaderbuiltinsampler
  raytracingshaderparam:
    seq:
    - id: name
      type: string
    - id: datatype
      type: s4
    - id: datasize
      type: u4
    - id: offset
      type: u4
    - id: propertysheettype
      type: s4
    - id: arraysize
      type: u4
    - id: rowcount
      type: u1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: colcount
      type: u1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: raytracingshaderparam
  raytracingshaderconstantbuffer:
    seq:
    - id: name
      type: string
    - id: bytesize
      type: s4
    - id: hash
      type: u4
    - id: params
      type: array_d3
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: raytracingshaderconstantbuffer
  raytracingshaderresources:
    seq:
    - id: textures
      type: array_d1
    - id: builtinsamplers
      type: array_d2
    - id: inputbuffers
      type: array_d1
    - id: outputbuffers
      type: array_d1
    - id: constantbuffersdesc
      type: array_d4
    - id: constantbuffers
      type: array_d1
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  raytracingshaderreflectiondata:
    seq:
    - id: functions
      type: array
    - id: localresources
      type: raytracingshaderresources
    - id: globalresources
      type: raytracingshaderresources
    - id: haserrors
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: code
      type: array_d5
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: precompiled
      type: array_d5
    - id: requirements
      type: s8
  raytracingshadervariant:
    seq:
    - id: targetrenderer
      type: s4
    - id: resourcereflectiondata
      type: raytracingshaderreflectiondata
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: editoronlyvariant
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: raytracingshadervariant
