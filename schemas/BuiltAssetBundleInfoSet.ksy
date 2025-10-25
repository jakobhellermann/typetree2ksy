meta:
  bit-endian: le
  endian: le
  id: builtassetbundleinfoset
seq:
- id: bundleinfos
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
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: u4
  builtassetbundleinfo:
    seq:
    - id: bundlename
      type: string
    - id: bundlearchivefile
      type: u4
    - id: packagedfileindices
      type: array
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: builtassetbundleinfo
