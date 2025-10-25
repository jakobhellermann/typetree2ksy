meta:
  bit-endian: le
  endian: le
  id: timemanager
seq:
- id: fixed_timestep
  type: rationaltime
- id: maximum_allowed_timestep
  type: f4
- id: m_timescale
  type: f4
- id: maximum_particle_timestep
  type: f4
types:
  tickspersecond:
    seq:
    - id: m_denominator
      type: u4
    - id: m_numerator
      type: u4
  rationaltime:
    seq:
    - id: m_count
      type: s8
    - id: m_rate
      type: tickspersecond
