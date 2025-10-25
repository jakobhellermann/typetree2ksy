meta:
  bit-endian: le
  endian: le
  id: editoruserbuildsettings
seq:
- id: m_buildlocation
  type: array
- id: m_activebuildtarget
  type: s4
- id: m_activeplatformguid
  type: guid
- id: m_selectedbuildtarget
  type: s4
- id: m_activebuildtargetgroup
  type: s4
- id: m_selectedbuildtargetgroup
  type: s4
- id: m_activebuildplatformgroupname
  type: string
- id: m_selectedbuildplatformgroupname
  type: string
- id: m_selectedstandalonetarget
  type: s4
- id: m_selectedstandalonebuildsubtarget
  type: s4
- id: m_activestandalonebuildsubtarget
  type: s4
- id: m_architectureflags
  type: s4
- id: m_selectedps4subtarget
  type: s4
- id: m_ps4hardwaretarget
  type: s4
- id: m_selectedxboxsubtarget
  type: s4
- id: m_selectediosbuildtype
  type: s4
- id: m_androidbuildsystem
  type: s4
- id: m_androidbuildtype
  type: s4
- id: m_androidreleaseminification
  type: s4
- id: m_androiddebugminification
  type: s4
- id: m_androiddevicesocketaddress
  type: string
- id: m_androidcurrentdeploymenttargetid
  type: string
- id: m_selectedcompressiontype
  type: map
- id: m_development
  type: b1
- id: m_connectprofiler
  type: b1
- id: m_buildwithdeepprofilingsupport
  type: b1
- id: m_allowdebugging
  type: b1
- id: m_waitforplayerconnection
  type: b1
- id: m_installinbuildfolder
  type: b1
- id: m_symlinksources
  type: b1
- id: m_symlinktrampoline
  type: b1
- id: m_needsubmissionmaterials
  type: b1
- id: m_movepackagetodiscouteredge
  type: b1
- id: m_compressfilesinpackage
  type: b1
- id: m_forceinstallation
  type: b1
- id: m_explicitnullchecks
  type: b1
- id: m_explicitdividebyzerochecks
  type: b1
- id: m_explicitarrayboundschecks
  type: b1
- id: m_buildscriptsonly
  type: b1
- id: m_exportasgoogleandroidproject
  type: b1
- id: m_createromfileforswitch
  type: b1
- id: m_enableromcompressionforswitch
  type: b1
- id: m_saveadfforswitch
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_romcompressiontypeforswitch
  type: s4
- id: m_romcompressionlevelforswitch
  type: s4
- id: m_romcompressionconfigforswitch
  type: string
- id: m_nvngraphicsdebuggerforswitch
  type: b1
- id: m_generatenintendoswitchshaderinfo
  type: b1
- id: m_nvnshaderdebugging
  type: b1
- id: m_nvnaftermath
  type: b1
- id: m_nvndrawvalidationlight
  type: b1
- id: m_nvndrawvalidationheavy
  type: b1
- id: m_enablememorytrackerforswitch
  type: b1
- id: m_waitforswitchmemorytrackeronstartup
  type: b1
- id: m_enabledebugpadforswitch
  type: b1
- id: m_enablehostioforswitch
  type: b1
- id: m_htcsscriptdebuggingforswitch
  type: b1
- id: m_uselegacynvnpoolallocatorforswitch
  type: b1
- id: m_buildappbundle
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_overridemaxtexturesize
  type: s4
- id: m_overridetexturecompression
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_androidcreatesymbols
  type: s4
- id: m_selectedandroidsubtarget
  type: s4
- id: m_selectedwebglsubtarget
  type: s4
- id: m_webglclientplatform
  type: s4
- id: m_webglclientbrowsertype
  type: s4
- id: m_webglclientbrowserpath
  type: string
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_selectedwsauwpbuildtype
  type: s4
- id: m_selectedwsauwpsdk
  type: string
- id: m_selectedwsaminuwpsdk
  type: string
- id: m_selectedwsaarchitecture
  type: string
- id: m_selectedwsauwpvsversion
  type: string
- id: m_selectedwsabuildandrundeploytarget
  type: s4
- id: m_selectedwindowsbuildandrundeploytarget
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_windowsdeviceportaladdress
  type: string
- id: m_windowsdeviceportalusername
  type: string
- id: m_xboxonestreaminginstalllaunchchunkrange
  type: s4
- id: m_selectedxboxonedeploymethod
  type: s4
- id: m_selectedxboxonedeploydrive
  type: s4
- id: m_macosxcodebuildconfig
  type: s4
- id: m_platformsettings
  type: map_d2
- id: m_selectedembeddedlinuxarchitecture
  type: s4
- id: m_selectedqnxosversion
  type: s4
- id: m_selectedqnxarchitecture
  type: s4
- id: m_remotedeviceinfo
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_remotedeviceaddress
  type: string
- id: m_remotedeviceusername
  type: string
- id: m_remotedeviceexports
  type: string
- id: m_pathonremotedevice
  type: string
- id: m_activebuildprofile
  type: pptr_monobehaviour
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
  pair:
    seq:
    - id: first
      type: string
    - id: second
      type: s4
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
  pair_d1:
    seq:
    - id: first
      type: string
    - id: second
      type: string
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
  platformsettingsdata:
    seq:
    - id: settings
      type: map_d1
  pair_d2:
    seq:
    - id: first
      type: string
    - id: second
      type: platformsettingsdata
  array_d3:
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
      type: array_d3
  pptr_monobehaviour:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
