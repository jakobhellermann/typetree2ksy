meta:
  bit-endian: le
  endian: le
  id: game_object
seq:
- id: m_volume
  type: f4
- id: rolloff_scale
  type: f4
- id: doppler_factor
  type: f4
- id: default_speaker_mode
  type: s4
- id: m_samplerate
  type: s4
- id: m_dspbuffersize
  type: s4
- id: m_virtualvoicecount
  type: s4
- id: m_realvoicecount
  type: s4
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_spatializerplugin
  type: string
- id: m_ambisonicdecoderplugin
  type: string_disambig
- id: m_disableaudio
  type: b1
- id: m_virtualizeeffects
  type: b1
- id: align4
  if: (_io.pos % 4) != 0
  size: (4 - (_io.pos % 4) % 4)
- id: m_requesteddspbuffersize
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
