meta:
  bit-endian: le
  endian: le
  id: shader
seq:
- id: m_name
  type: string
- id: m_parsedform
  type: serializedshader
- id: platforms
  type: array_d17
- id: offsets
  type: array_d18
- id: compressedlengths
  type: array_d18
- id: decompressedlengths
  type: array_d18
- id: compressedblob
  type: array_d21
- id: stagecounts
  type: array_d17
- id: m_dependencies
  type: array_d24
- id: m_nonmodifiabletextures
  type: map_d2
- id: m_shaderisbaked
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_assetguid
  type: guid
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
      type: string
  serializedtextureproperty:
    seq:
    - id: m_defaultname
      type: string
    - id: m_texdim
      type: s4
  serializedproperty:
    seq:
    - id: m_name
      type: string
    - id: m_description
      type: string
    - id: m_attributes
      type: array
    - id: m_type
      type: s4
    - id: m_flags
      type: u4
    - id: m_defvalue_0
      type: f4
    - id: m_defvalue_1
      type: f4
    - id: m_defvalue_2
      type: f4
    - id: m_defvalue_3
      type: f4
    - id: m_deftexture
      type: serializedtextureproperty
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: serializedproperty
  serializedproperties:
    seq:
    - id: m_props
      type: array_d1
  pair:
    seq:
    - id: first
      type: string
    - id: second
      type: s4
  array_d2:
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
      type: array_d2
  serializedshaderfloatvalue:
    seq:
    - id: val
      type: f4
    - id: name
      type: string
  serializedshaderrtblendstate:
    seq:
    - id: srcblend
      type: serializedshaderfloatvalue
    - id: destblend
      type: serializedshaderfloatvalue
    - id: srcblendalpha
      type: serializedshaderfloatvalue
    - id: destblendalpha
      type: serializedshaderfloatvalue
    - id: blendop
      type: serializedshaderfloatvalue
    - id: blendopalpha
      type: serializedshaderfloatvalue
    - id: colmask
      type: serializedshaderfloatvalue
  serializedstencilop:
    seq:
    - id: pass
      type: serializedshaderfloatvalue
    - id: fail
      type: serializedshaderfloatvalue
    - id: zfail
      type: serializedshaderfloatvalue
    - id: comp
      type: serializedshaderfloatvalue
  serializedshadervectorvalue:
    seq:
    - id: x
      type: serializedshaderfloatvalue
    - id: y
      type: serializedshaderfloatvalue
    - id: z
      type: serializedshaderfloatvalue
    - id: w
      type: serializedshaderfloatvalue
    - id: name
      type: string
  pair_d1:
    seq:
    - id: first
      type: string
    - id: second
      type: string
  array_d3:
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
      type: array_d3
  serializedtagmap:
    seq:
    - id: tags
      type: map_d1
  serializedshaderstate:
    seq:
    - id: m_name
      type: string
    - id: rtblend0
      type: serializedshaderrtblendstate
    - id: rtblend1
      type: serializedshaderrtblendstate
    - id: rtblend2
      type: serializedshaderrtblendstate
    - id: rtblend3
      type: serializedshaderrtblendstate
    - id: rtblend4
      type: serializedshaderrtblendstate
    - id: rtblend5
      type: serializedshaderrtblendstate
    - id: rtblend6
      type: serializedshaderrtblendstate
    - id: rtblend7
      type: serializedshaderrtblendstate
    - id: rtseparateblend
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: zclip
      type: serializedshaderfloatvalue
    - id: ztest
      type: serializedshaderfloatvalue
    - id: zwrite
      type: serializedshaderfloatvalue
    - id: culling
      type: serializedshaderfloatvalue
    - id: conservative
      type: serializedshaderfloatvalue
    - id: offsetfactor
      type: serializedshaderfloatvalue
    - id: offsetunits
      type: serializedshaderfloatvalue
    - id: alphatomask
      type: serializedshaderfloatvalue
    - id: stencilop
      type: serializedstencilop
    - id: stencilopfront
      type: serializedstencilop
    - id: stencilopback
      type: serializedstencilop
    - id: stencilreadmask
      type: serializedshaderfloatvalue
    - id: stencilwritemask
      type: serializedshaderfloatvalue
    - id: stencilref
      type: serializedshaderfloatvalue
    - id: fogstart
      type: serializedshaderfloatvalue
    - id: fogend
      type: serializedshaderfloatvalue
    - id: fogdensity
      type: serializedshaderfloatvalue
    - id: fogcolor
      type: serializedshadervectorvalue
    - id: fogmode
      type: s4
    - id: gpuprogramid
      type: s4
    - id: m_tags
      type: serializedtagmap
    - id: m_lod
      type: s4
    - id: lighting
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  shaderbindchannel:
    seq:
    - id: source
      type: s1
    - id: target
      type: s1
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: shaderbindchannel
  parserbindchannels:
    seq:
    - id: m_channels
      type: array_d4
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_sourcemap
      type: s4
  array_d5:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u2
  vectorparameter:
    seq:
    - id: m_nameindex
      type: s4
    - id: m_index
      type: s4
    - id: m_arraysize
      type: s4
    - id: m_type
      type: s1
    - id: m_dim
      type: s1
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
      type: vectorparameter
  matrixparameter:
    seq:
    - id: m_nameindex
      type: s4
    - id: m_index
      type: s4
    - id: m_arraysize
      type: s4
    - id: m_type
      type: s1
    - id: m_rowcount
      type: s1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d7:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: matrixparameter
  textureparameter:
    seq:
    - id: m_nameindex
      type: s4
    - id: m_index
      type: s4
    - id: m_samplerindex
      type: s4
    - id: m_multisampled
      type: b1
    - id: m_dim
      type: s1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d8:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: textureparameter
  bufferbinding:
    seq:
    - id: m_nameindex
      type: s4
    - id: m_index
      type: s4
    - id: m_arraysize
      type: s4
  array_d9:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: bufferbinding
  structparameter:
    seq:
    - id: m_nameindex
      type: s4
    - id: m_index
      type: s4
    - id: m_arraysize
      type: s4
    - id: m_structsize
      type: s4
    - id: m_vectormembers
      type: array_d6
    - id: m_matrixmembers
      type: array_d7
  array_d10:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: structparameter
  constantbuffer:
    seq:
    - id: m_nameindex
      type: s4
    - id: m_matrixparams
      type: array_d7
    - id: m_vectorparams
      type: array_d6
    - id: m_structparams
      type: array_d10
    - id: m_size
      type: s4
    - id: m_ispartialcb
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
      type: constantbuffer
  uavparameter:
    seq:
    - id: m_nameindex
      type: s4
    - id: m_index
      type: s4
    - id: m_originalindex
      type: s4
  array_d12:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: uavparameter
  samplerparameter:
    seq:
    - id: sampler
      type: u4
    - id: bindpoint
      type: s4
  array_d13:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: samplerparameter
  serializedprogramparameters:
    seq:
    - id: m_vectorparams
      type: array_d6
    - id: m_matrixparams
      type: array_d7
    - id: m_textureparams
      type: array_d8
    - id: m_bufferparams
      type: array_d9
    - id: m_constantbuffers
      type: array_d11
    - id: m_constantbufferbindings
      type: array_d9
    - id: m_uavparams
      type: array_d12
    - id: m_samplers
      type: array_d13
  serializedsubprogram:
    seq:
    - id: m_blobindex
      type: u4
    - id: m_channels
      type: parserbindchannels
    - id: m_keywordindices
      type: array_d5
    - id: m_shaderhardwaretier
      type: s1
    - id: m_gpuprogramtype
      type: s1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_parameters
      type: serializedprogramparameters
    - id: m_shaderrequirements
      type: s8
  array_d14:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: serializedsubprogram
  serializedplayersubprogram:
    seq:
    - id: m_blobindex
      type: u4
    - id: m_keywordindices
      type: array_d5
    - id: m_shaderrequirements
      type: s8
    - id: m_gpuprogramtype
      type: s1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d15:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: serializedplayersubprogram
  array_d16:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: array_d15
  array_d17:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
  array_d18:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: array_d17
  serializedprogram:
    seq:
    - id: m_subprograms
      type: array_d14
    - id: m_playersubprograms
      type: array_d16
    - id: m_parameterblobindices
      type: array_d18
    - id: m_commonparameters
      type: serializedprogramparameters
    - id: m_serializedkeywordstatemask
      type: array_d5
  serializedpass:
    seq:
    - id: m_nameindices
      type: map
    - id: m_type
      type: s4
    - id: m_state
      type: serializedshaderstate
    - id: m_programmask
      type: u4
    - id: progvertex
      type: serializedprogram
    - id: progfragment
      type: serializedprogram
    - id: proggeometry
      type: serializedprogram
    - id: proghull
      type: serializedprogram
    - id: progdomain
      type: serializedprogram
    - id: prograytracing
      type: serializedprogram
    - id: m_hasinstancingvariant
      type: b1
    - id: m_hasproceduralinstancingvariant
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: m_usename
      type: string
    - id: m_name
      type: string
    - id: m_texturename
      type: string
    - id: m_tags
      type: serializedtagmap
  array_d19:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: serializedpass
  serializedsubshader:
    seq:
    - id: m_passes
      type: array_d19
    - id: m_tags
      type: serializedtagmap
    - id: m_lod
      type: s4
  array_d20:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: serializedsubshader
  array_d21:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u1
  serializedshaderdependency:
    seq:
    - id: from
      type: string
    - id: to
      type: string
  array_d22:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: serializedshaderdependency
  serializedcustomeditorforrenderpipeline:
    seq:
    - id: customeditorname
      type: string
    - id: renderpipelinetype
      type: string
  array_d23:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: serializedcustomeditorforrenderpipeline
  serializedshader:
    seq:
    - id: m_propinfo
      type: serializedproperties
    - id: m_subshaders
      type: array_d20
    - id: m_keywordnames
      type: array
    - id: m_keywordflags
      type: array_d21
    - id: m_name
      type: string
    - id: m_customeditorname
      type: string
    - id: m_fallbackname
      type: string
    - id: m_dependencies
      type: array_d22
    - id: m_customeditorforrenderpipelines
      type: array_d23
    - id: m_disablenosubshadersmessage
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  pptr_shader:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d24:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_shader
  pptr_texture:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pair_d2:
    seq:
    - id: first
      type: string
    - id: second
      type: pptr_texture
  array_d25:
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
      type: array_d25
  guid:
    seq:
    - id: data_0
      type: u4
    - id: data_1
      type: u4
    - id: data_2
      type: u4
    - id: data_3
      type: u4
