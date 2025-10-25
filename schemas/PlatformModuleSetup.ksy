meta:
  bit-endian: le
  endian: le
  id: platformmodulesetup
seq:
- id: modules
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
      type: string
  module:
    seq:
    - id: name
      type: string
    - id: dependencies
      type: array
    - id: strippable
      type: b1
    - id: controlledbybuiltinpackage
      type: b1
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: module
