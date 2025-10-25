meta:
  bit-endian: le
  endian: le
  id: graphicsstatecollection
seq:
- id: m_name
  type: string
- id: m_version
  type: s4
- id: m_devicerenderer
  type: s4
- id: m_runtimeplatform
  type: s4
- id: m_qualitylevelname
  type: string
- id: m_variantinfomap
  type: map
- id: m_vertexlayoutinfomap
  type: map_d1
- id: m_renderpassinfomap
  type: map_d2
- id: m_renderstatemap
  type: map_d3
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
  pptr_shader:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  graphicsstateinfo:
    seq:
    - id: vertexlayout
      type: u8
    - id: renderpass
      type: u8
    - id: renderstate
      type: u8
    - id: subpassindex
      type: s4
    - id: topology
      type: s4
    - id: forcecullmode
      type: s4
    - id: shadingratecombinerprimitive
      type: s4
    - id: shadingratecombinerfragment
      type: s4
    - id: baseshadingrate
      type: s4
    - id: depthbias
      type: f4
    - id: slopedepthbias
      type: f4
    - id: userbackface
      type: b1
    - id: appbackface
      type: b1
    - id: wireframe
      type: b1
    - id: invertprojectionmatrix
      type: b1
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
      type: graphicsstateinfo
  variantinfo:
    seq:
    - id: shader
      type: pptr_shader
    - id: shadername
      type: string
    - id: shaderassetguid
      type: string
    - id: keywordnames
      type: string
    - id: subshaderindex
      type: s4
    - id: passindex
      type: s4
    - id: graphicsstateinfoset
      type: array
  pair:
    seq:
    - id: first
      type: hash128
    - id: second
      type: variantinfo
  array_d1:
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
      type: array_d1
  channelinfo:
    seq:
    - id: stream
      type: u1
    - id: offset
      type: u1
    - id: format
      type: u1
    - id: dimension
      type: u1
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: channelinfo
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  vertexlayoutinfo:
    seq:
    - id: vertexchannelsinfo
      type: array_d2
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: vertexstrides
      type: array_d3
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: vertexstreamcount
      type: s4
  pair_d1:
    seq:
    - id: first
      type: u8
    - id: second
      type: vertexlayoutinfo
  array_d4:
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
      type: array_d4
  attachmentinfo:
    seq:
    - id: format
      type: s4
    - id: needsresolve
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: attachmentinfo
  array_d6:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s4
  attachmentindexarray:
    seq:
    - id: attachments
      type: array_d6
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: activeattachments
      type: s4
  subpassdescriptor:
    seq:
    - id: inputs
      type: attachmentindexarray
    - id: coloroutputs
      type: attachmentindexarray
    - id: flags
      type: s4
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: subpassdescriptor
  renderpassinfo:
    seq:
    - id: attachments
      type: array_d5
    - id: attachmentcount
      type: s4
    - id: subpasses
      type: array_d7
    - id: subpasscount
      type: s4
    - id: depthattachmentindex
      type: s4
    - id: shadingrateindex
      type: s4
    - id: foveationimageindex
      type: s4
    - id: multiviewcount
      type: s4
    - id: samplecount
      type: s4
  pair_d2:
    seq:
    - id: first
      type: u8
    - id: second
      type: renderpassinfo
  array_d8:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d2
  map_d2:
    seq:
    - id: array
      type: array_d8
  gfxrendertargetblendstate:
    seq:
    - id: writemask
      type: u1
    - id: srcblend
      type: u1
    - id: dstblend
      type: u1
    - id: srcblendalpha
      type: u1
    - id: dstblendalpha
      type: u1
    - id: blendop
      type: u1
    - id: blendopalpha
      type: u1
  array_d9:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: gfxrendertargetblendstate
  gfxblendstate:
    seq:
    - id: rt
      type: array_d9
    - id: separatemrtblend
      type: u1
    - id: alphatomask
      type: u1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  gfxrasterstate:
    seq:
    - id: cullmode
      type: s4
    - id: depthbias
      type: s4
    - id: slopescaleddepthbias
      type: f4
    - id: depthclip
      type: u1
    - id: conservative
      type: u1
  gfxdepthstate:
    seq:
    - id: depthwrite
      type: u1
    - id: depthfunc
      type: s1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  gfxstencilstate:
    seq:
    - id: stencilenable
      type: u1
    - id: readmask
      type: u1
    - id: writemask
      type: u1
    - id: padding
      type: u1
    - id: stencilfuncfront
      type: u1
    - id: stencilpassopfront
      type: u1
    - id: stencilfailopfront
      type: u1
    - id: stencilzfailopfront
      type: u1
    - id: stencilfuncback
      type: u1
    - id: stencilpassopback
      type: u1
    - id: stencilfailopback
      type: u1
    - id: stencilzfailopback
      type: u1
  renderstateblock:
    seq:
    - id: blendstate
      type: gfxblendstate
    - id: rasterstate
      type: gfxrasterstate
    - id: depthstate
      type: gfxdepthstate
    - id: stencilstate
      type: gfxstencilstate
    - id: stencilref
      type: s4
    - id: mask
      type: s4
  renderstateinfo:
    seq:
    - id: renderstate
      type: renderstateblock
  pair_d3:
    seq:
    - id: first
      type: u8
    - id: second
      type: renderstateinfo
  array_d10:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pair_d3
  map_d3:
    seq:
    - id: array
      type: array_d10
