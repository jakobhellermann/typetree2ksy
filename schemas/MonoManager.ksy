meta:
  bit-endian: le
  endian: le
  id: monomanager
seq:
- id: m_scripthashes
  type: map
- id: m_runtimeclasshashes
  type: map_d1
- id: m_scripts
  type: array_d2
types:
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
      type: hash128
    - id: second
      type: hash128
  array:
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
      type: array
  pair_d1:
    seq:
    - id: first
      type: u4
    - id: second
      type: hash128
  array_d1:
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
      type: array_d1
  pptr_monoscript:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_monoscript
