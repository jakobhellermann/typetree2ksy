meta:
  bit-endian: le
  endian: le
  id: audioclip
seq:
- id: m_name
  type: string
- id: m_loadtype
  type: s4
- id: m_channels
  type: s4
- id: m_frequency
  type: s4
- id: m_bitspersample
  type: s4
- id: m_length
  type: f4
- id: m_istrackerformat
  type: b1
- id: m_ambisonic
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_subsoundindex
  type: s4
- id: m_preloadaudiodata
  type: b1
- id: m_loadinbackground
  type: b1
- id: m_legacy3d
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_resource
  type: streamedresource
- id: m_compressionformat
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
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
  streamedresource:
    seq:
    - id: m_source
      type: string
    - id: m_offset
      type: u8
    - id: m_size
      type: u8
