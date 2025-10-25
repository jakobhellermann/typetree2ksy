meta:
  bit-endian: le
  endian: le
  id: lightmapparameters
seq:
- id: m_name
  type: string
- id: resolution
  type: f4
- id: clusterresolution
  type: f4
- id: irradiancebudget
  type: s4
- id: irradiancequality
  type: s4
- id: backfacetolerance
  type: f4
- id: istransparent
  type: s4
- id: modellingtolerance
  type: f4
- id: systemtag
  type: s4
- id: edgestitching
  type: s4
- id: blurradius
  type: s4
- id: directlightquality
  type: s4
- id: antialiasingsamples
  type: s4
- id: pushoff
  type: f4
- id: bakedlightmaptag
  type: s4
- id: limitlightmapcount
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: maxlightmapcount
  type: s4
- id: aoquality
  type: s4
- id: aoantialiasingsamples
  type: s4
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
