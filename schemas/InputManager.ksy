meta:
  bit-endian: le
  endian: le
  id: game_object
seq:
- id: m_axes
  type: array
- id: m_usephysicalkeys
  type: b1
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
  string_disambig:
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
  string_disambig_disambig:
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
  string_disambig_disambig_disambig:
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
  string_disambig_disambig_disambig_disambig:
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
  string_disambig_disambig_disambig_disambig_disambig:
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
  string_disambig_disambig_disambig_disambig_disambig_disambig:
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
  inputaxis:
    seq:
    - id: m_name
      type: string
    - id: descriptivename
      type: string_disambig
    - id: descriptivenegativename
      type: string_disambig_disambig
    - id: negativebutton
      type: string_disambig_disambig_disambig
    - id: positivebutton
      type: string_disambig_disambig_disambig_disambig
    - id: altnegativebutton
      type: string_disambig_disambig_disambig_disambig_disambig
    - id: altpositivebutton
      type: string_disambig_disambig_disambig_disambig_disambig_disambig
    - id: gravity
      type: f4
    - id: dead
      type: f4
    - id: sensitivity
      type: f4
    - id: snap
      type: b1
    - id: invert
      type: b1
    - id: align4
      if: (_io.pos % 4) != 0
      size: (4 - (_io.pos % 4) % 4)
    - id: type
      type: s4
    - id: axis
      type: s4
    - id: joynum
      type: s4
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: inputaxis
