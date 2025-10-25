meta:
  bit-endian: le
  endian: le
  id: prefabinstance
seq:
- id: m_rootgameobject
  type: pptr_gameobject
- id: m_modification
  type: prefabmodification
- id: m_sourceprefab
  type: pptr_prefab
types:
  pptr_gameobject:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_transform:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  pptr_object:
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
  propertymodification:
    seq:
    - id: target
      type: pptr_object
    - id: propertypath
      type: string
    - id: value
      type: string
    - id: objectreference
      type: pptr_object
  array:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: propertymodification
  pptr_component:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
  array_d1:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_component
  array_d2:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: pptr_gameobject
  addedgameobject:
    seq:
    - id: targetcorrespondingsourceobject
      type: pptr_transform
    - id: insertindex
      type: s4
    - id: addedobject
      type: pptr_transform
  array_d3:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: addedgameobject
  addedcomponent:
    seq:
    - id: targetcorrespondingsourceobject
      type: pptr_gameobject
    - id: insertindex
      type: s4
    - id: addedobject
      type: pptr_component
  array_d4:
    seq:
    - id: size
      type: s4
    - id: data
      repeat: expr
      repeat-expr: size
      type: addedcomponent
  prefabmodification:
    seq:
    - id: m_transformparent
      type: pptr_transform
    - id: m_modifications
      type: array
    - id: m_removedcomponents
      type: array_d1
    - id: m_removedgameobjects
      type: array_d2
    - id: m_addedgameobjects
      type: array_d3
    - id: m_addedcomponents
      type: array_d4
  pptr_prefab:
    seq:
    - id: m_fileid
      type: s4
    - id: m_pathid
      type: s8
