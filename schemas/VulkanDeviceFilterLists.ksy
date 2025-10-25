meta:
  bit-endian: le
  endian: le
  id: vulkandevicefilterlists
seq:
- id: m_name
  type: string
- id: m_vulkanallowfilterlist
  type: array
- id: m_vulkandenyfilterlist
  type: array
- id: m_gfxjobfilterlist
  type: array_d1
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
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: androiddevicefilterdata
  vulkangraphicsjobsdevicefilterdata:
    seq:
    - id: preferredmode
      type: u4
    - id: filter
      type: androiddevicefilterdata
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: vulkangraphicsjobsdevicefilterdata
