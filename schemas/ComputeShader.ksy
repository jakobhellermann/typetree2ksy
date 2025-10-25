meta:
  bit-endian: le
  endian: le
  id: computeshader
seq:
- id: m_name
  type: string
- id: variants
  type: array_d11
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
      type: u4
  computeshaderresource:
    seq:
    - id: name
      type: string
    - id: generatedname
      type: string
    - id: bindpoint
      type: s4
    - id: samplerbindpoint
      type: s4
    - id: texdimension
      type: s4
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: computeshaderresource
  computeshaderbuiltinsampler:
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
      type: computeshaderbuiltinsampler
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
  computeshaderkernel:
    seq:
    - id: cbvariantindices
      type: array
    - id: cbs
      type: array_d1
    - id: textures
      type: array_d1
    - id: builtinsamplers
      type: array_d2
    - id: inbuffers
      type: array_d1
    - id: outbuffers
      type: array_d1
    - id: code
      type: array_d3
    - id: threadgroupsize
      type: array_d4
    - id: requirements
      type: s8
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: computeshaderkernel
  pair:
    seq:
    - id: first
      type: string
    - id: second
      type: u4
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
  computeshaderkernelparent:
    seq:
    - id: name
      type: string
    - id: uniquevariants
      type: array_d5
    - id: variantindices
      type: array_d6
    - id: globalkeywords
      type: array_d7
    - id: localkeywords
      type: array_d7
    - id: dynamickeywords
      type: array_d7
  array_d8:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: computeshaderkernelparent
  computeshaderparam:
    seq:
    - id: name
      type: string
    - id: type
      type: s4
    - id: offset
      type: u4
    - id: arraysize
      type: u4
    - id: rowcount
      type: u4
    - id: colcount
      type: u4
  array_d9:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: computeshaderparam
  computeshadercb:
    seq:
    - id: name
      type: string
    - id: bytesize
      type: s4
    - id: params
      type: array_d9
  array_d10:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: computeshadercb
  computeshaderplatformvariant:
    seq:
    - id: targetrenderer
      type: s4
    - id: targetlevel
      type: s4
    - id: kernels
      type: array_d8
    - id: constantbuffers
      type: array_d10
    - id: resourcesresolved
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d11:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: computeshaderplatformvariant
