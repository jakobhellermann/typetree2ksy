meta:
  bit-endian: le
  endian: le
  id: buildreport
seq:
- id: m_name
  type: string
- id: m_summary
  type: buildsummary
- id: m_files
  type: array
- id: m_buildsteps
  type: array_d2
- id: m_appendices
  type: array_d3
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
  datetime:
    seq:
    - id: ticks
      type: s8
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
  buildsummary:
    seq:
    - id: buildstarttime
      type: datetime
    - id: buildguid
      type: guid
    - id: platformname
      type: string
    - id: platformgroupname
      type: string
    - id: subtarget
      type: s4
    - id: options
      type: s4
    - id: assetbundleoptions
      type: s4
    - id: outputpath
      type: string
    - id: crc
      type: u4
    - id: totalsize
      type: u8
    - id: totaltimeticks
      type: u8
    - id: totalerrors
      type: s4
    - id: totalwarnings
      type: s4
    - id: buildtype
      type: s4
    - id: buildresult
      type: s4
    - id: multiprocessenabled
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  buildreportfile:
    seq:
    - id: path
      type: string
    - id: role
      type: string
    - id: id
      type: u4
    - id: totalsize
      type: u8
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: buildreportfile
  buildstepmessage:
    seq:
    - id: type
      type: s4
    - id: content
      type: string
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: buildstepmessage
  buildstepinfo:
    seq:
    - id: stepname
      type: string
    - id: durationticks
      type: u8
    - id: depth
      type: s4
    - id: messages
      type: array_d1
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: buildstepinfo
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
