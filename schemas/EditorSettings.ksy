meta:
  bit-endian: le
  endian: le
  id: editorsettings
seq:
- id: m_serializationmode
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_lineendingsfornewscripts
  type: s4
- id: m_defaultbehaviormode
  type: s4
- id: m_prefabregularenvironment
  type: pptr_sceneasset
- id: m_prefabuienvironment
  type: pptr_sceneasset
- id: m_spritepackermode
  type: s4
- id: m_spritepackercachesize
  type: s4
- id: m_spritepackerpaddingpower
  type: s4
- id: m_bc7texturecompressor
  type: s4
- id: m_etctexturecompressorbehavior
  type: s4
- id: m_etctexturefastcompressor
  type: s4
- id: m_etctexturenormalcompressor
  type: s4
- id: m_etctexturebestcompressor
  type: s4
- id: m_projectgenerationincludedextensions
  type: string
- id: m_projectgenerationrootnamespace
  type: string
- id: m_enabletexturestreamingineditmode
  type: b1
- id: m_enabletexturestreaminginplaymode
  type: b1
- id: m_enableeditorasynccputextureloading
  type: b1
- id: m_asyncshadercompilation
  type: b1
- id: m_prefabmodeallowautosave
  type: b1
- id: m_enterplaymodeoptionsenabled
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_enterplaymodeoptions
  type: s4
- id: m_gameobjectnamingdigits
  type: s4
- id: m_gameobjectnamingscheme
  type: s4
- id: m_assetnamingusesspace
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_inspectoruseimguidefaultinspector
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_uselegacyprobesamplecount
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_serializeinlinemappingsononeline
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_disablecookiesinlightmapper
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_shadowmaskstitching
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_assetpipelinemode
  type: s4
- id: m_refreshimportmode
  type: s4
- id: m_cacheservermode
  type: s4
- id: m_cacheserverendpoint
  type: string
- id: m_cacheservernamespaceprefix
  type: string
- id: m_cacheserverenabledownload
  type: b1
- id: m_cacheserverenableupload
  type: b1
- id: m_cacheserverenableauth
  type: b1
- id: m_cacheserverenabletls
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_cacheservervalidationmode
  type: s4
- id: m_cacheserverdownloadbatchsize
  type: s4
- id: m_enableenlightenbakedgi
  type: b1
- id: m_referencedclipsexactnaming
  type: b1
types:
  pptr_sceneasset:
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
