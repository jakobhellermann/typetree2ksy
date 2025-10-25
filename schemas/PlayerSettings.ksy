meta:
  bit-endian: le
  endian: le
  id: playersettings
seq:
- id: productguid
  type: guid
- id: androidprofiler
  type: b1
- id: androidfiltertoucheswhenobscured
  type: b1
- id: androidenablesustainedperformancemode
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: defaultscreenorientation
  type: s4
- id: targetdevice
  type: s4
- id: useondemandresources
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: accelerometerfrequency
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: companyname
  type: string
- id: productname
  type: string
- id: defaultcursor
  type: pptr_texture2d
- id: cursorhotspot
  type: vector2f
- id: m_splashscreenbackgroundcolor
  type: colorrgba
- id: m_showunitysplashscreen
  type: b1
- id: m_showunitysplashlogo
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_splashscreenoverlayopacity
  type: f4
- id: m_splashscreenanimation
  type: s4
- id: m_splashscreenlogostyle
  type: s4
- id: m_splashscreendrawmode
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_splashscreenbackgroundanimationzoom
  type: f4
- id: m_splashscreenlogoanimationzoom
  type: f4
- id: m_splashscreenbackgroundlandscapeaspect
  type: f4
- id: m_splashscreenbackgroundportraitaspect
  type: f4
- id: m_splashscreenbackgroundlandscapeuvs
  type: rectf
- id: m_splashscreenbackgroundportraituvs
  type: rectf
- id: m_splashscreenlogos
  type: array
- id: m_splashscreenbackgroundlandscape
  type: pptr_texture2d
- id: m_splashscreenbackgroundportrait
  type: pptr_texture2d
- id: m_unitysplashlogo
  type: pptr_sprite
- id: m_virtualrealitysplashscreen
  type: pptr_texture2d
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_holographictrackinglossscreen
  type: pptr_texture2d
- id: defaultscreenwidth
  type: s4
- id: defaultscreenheight
  type: s4
- id: defaultscreenwidthweb
  type: s4
- id: defaultscreenheightweb
  type: s4
- id: m_stereorenderingpath
  type: s4
- id: m_activecolorspace
  type: s4
- id: unsupportedmsaafallback
  type: s4
- id: m_spritebatchmaxvertexcount
  type: s4
- id: m_spritebatchvertexthreshold
  type: s4
- id: m_mtrendering
  type: b1
- id: mobilemtrenderingbaked
  type: b1
- id: aid
  type: hash128
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: playerminopenglesversion
  type: s4
- id: mipstripping
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: numberofmipsstripped
  type: s4
- id: numberofmipsstrippedpermipmaplimitgroup
  type: map
- id: m_stacktracetypes
  type: array_d2
- id: iosshowactivityindicatoronloading
  type: s4
- id: androidshowactivityindicatoronloading
  type: s4
- id: iosusecustomappbackgroundbehavior
  type: b1
- id: allowedautorotatetoportrait
  type: b1
- id: allowedautorotatetoportraitupsidedown
  type: b1
- id: allowedautorotatetolandscaperight
  type: b1
- id: allowedautorotatetolandscapeleft
  type: b1
- id: useosautorotation
  type: b1
- id: use32bitdisplaybuffer
  type: b1
- id: preserveframebufferalpha
  type: b1
- id: disabledepthandstencilbuffers
  type: b1
- id: androidstartinfullscreen
  type: b1
- id: androidrenderoutsidesafearea
  type: b1
- id: androiduseswappy
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: androidblittype
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: androidresizeableactivity
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: androiddefaultwindowwidth
  type: s4
- id: androiddefaultwindowheight
  type: s4
- id: androidminimumwindowwidth
  type: s4
- id: androidminimumwindowheight
  type: s4
- id: androidfullscreenmode
  type: s4
- id: androidautorotationbehavior
  type: s4
- id: androidpredictivebacksupport
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: androidapplicationentry
  type: s4
- id: defaultisnativeresolution
  type: b1
- id: macretinasupport
  type: b1
- id: runinbackground
  type: b1
- id: muteotheraudiosources
  type: b1
- id: prepare_ios_for_recording
  type: b1
- id: force_ios_speakers_when_recording
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: defersystemgesturesmode
  type: s4
- id: hidehomebutton
  type: b1
- id: submitanalytics
  type: b1
- id: useplayerlog
  type: b1
- id: dedicatedserveroptimizations
  type: b1
- id: bakecollisionmeshes
  type: b1
- id: forcesingleinstance
  type: b1
- id: useflipmodelswapchain
  type: b1
- id: resizablewindow
  type: b1
- id: usemacappstorevalidation
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: macappstorecategory
  type: string
- id: gpuskinning
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: meshdeformation
  type: s4
- id: xboxpixtexturecapture
  type: b1
- id: xboxenableavatar
  type: b1
- id: xboxenablekinect
  type: b1
- id: xboxenablekinectautotracking
  type: b1
- id: xboxenablefitness
  type: b1
- id: visibleinbackground
  type: b1
- id: allowfullscreenswitch
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: fullscreenmode
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: xboxspeechdb
  type: u4
- id: xboxenableheadorientation
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: xboxenableguest
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: xboxenablepixsampling
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: metalframebufferonly
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: xboxoneresolution
  type: s4
- id: xboxonesresolution
  type: s4
- id: xboxonexresolution
  type: s4
- id: xboxonemonologginglevel
  type: s4
- id: xboxonelogginglevel
  type: s4
- id: xboxonedisableesram
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: xboxoneenabletypeoptimization
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: xboxonepresentimmediatethreshold
  type: u4
- id: switchqueuecommandmemory
  type: s4
- id: switchqueuecontrolmemory
  type: s4
- id: switchqueuecomputememory
  type: s4
- id: switchnvnshaderpoolsgranularity
  type: s4
- id: switchnvndefaultpoolsgranularity
  type: s4
- id: switchnvnotherpoolsgranularity
  type: s4
- id: switchgpuscratchpoolgranularity
  type: s4
- id: switchallowgpuscratchshrinking
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: switchnvnmaxpublictextureidcount
  type: s4
- id: switchnvnmaxpublicsampleridcount
  type: s4
- id: switchmaxworkermultiple
  type: s4
- id: switchnvngraphicsfirmwarememory
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: vulkannumswapchainbuffers
  type: u4
- id: vulkanenablesetsrgbwrite
  type: b1
- id: vulkanenablepretransform
  type: b1
- id: vulkanenablelateacquirenextimage
  type: b1
- id: vulkanenablecommandbufferrecycling
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: loadstoredebugmodeenabled
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: invalidatedpatterntexture
  type: pptr_texture2d
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: visionosbundleversion
  type: string
- id: tvosbundleversion
  type: string
- id: bundleversion
  type: string
- id: preloadedassets
  type: array_d3
- id: metroinputsource
  type: s4
- id: wsatransparentswapchain
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_holographicpauseontrackingloss
  type: b1
- id: xboxonedisablekinectgpureservation
  type: b1
- id: xboxoneenable7thcore
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: vrsettings
  type: vrsettings
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: iswsaholographicremotingenabled
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: enableframetimingstats
  type: b1
- id: enableopenglprofilergpurecorders
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: allowhdrdisplaysupport
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: usehdrdisplay
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: hdrbitdepth
  type: s4
- id: m_colorgamuts
  type: array_d2
- id: targetpixeldensity
  type: s4
- id: resolutionscalingmode
  type: s4
- id: resetresolutiononwindowresize
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: androidsupportedaspectratio
  type: s4
- id: androidmaxaspectratio
  type: f4
- id: androidminaspectratio
  type: f4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: activeinputhandler
  type: s4
- id: windowsgamepadbackendhint
  type: s4
- id: cloudprojectid
  type: string
- id: framebufferdepthmemorylessmode
  type: s4
- id: qualitysettingsnames
  type: array_d4
- id: projectname
  type: string
- id: organizationid
  type: string
- id: cloudenabled
  type: b1
- id: legacyclampblendshapeweights
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: hmiloadingimage
  type: pptr_texture2d
- id: platformrequiresreadableassets
  type: b1
- id: virtualtexturingsupportenabled
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: insecurehttpoption
  type: s4
- id: androidvulkandenyfilterlist
  type: array_d5
- id: androidvulkanallowfilterlist
  type: array_d5
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: androidvulkandevicefilterlistasset
  type: pptr_vulkandevicefilterlists
types:
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
  pptr_texture2d:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  vector2f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
  colorrgba:
    seq:
    - id: r
      type: f4
    - id: g
      type: f4
    - id: b
      type: f4
    - id: a
      type: f4
  rectf:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: width
      type: f4
    - id: height
      type: f4
  pptr_sprite:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  splashscreenlogo:
    seq:
    - id: logo
      type: pptr_sprite
    - id: duration
      type: f4
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
      type: splashscreenlogo
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
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: s4
  pptr_object:
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
      type: pptr_object
  vrsettings:
    seq:
    - id: enable360stereocapture
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: string
  androiddevicefilterdata:
    seq:
    - id: vendorname
      type: string
    - id: devicename
      type: string
    - id: brandname
      type: string
    - id: productname
      type: string
    - id: androidosversionstring
      type: string
    - id: vulkanapiversionstring
      type: string
    - id: driverversionstring
      type: string
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
      type: androiddevicefilterdata
  pptr_vulkandevicefilterlists:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
