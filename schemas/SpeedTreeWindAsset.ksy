meta:
  bit-endian: le
  endian: le
  id: speedtreewindasset
seq:
- id: m_name
  type: string
- id: m_eversion
  type: s4
- id: m_config8
  type: speedtreewindconfig8
- id: m_config9
  type: speedtreewindconfig9
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
  sbranchwindlevel:
    seq:
    - id: m_afdistance_0
      type: f4
    - id: m_afdistance_1
      type: f4
    - id: m_afdistance_2
      type: f4
    - id: m_afdistance_3
      type: f4
    - id: m_afdistance_4
      type: f4
    - id: m_afdistance_5
      type: f4
    - id: m_afdistance_6
      type: f4
    - id: m_afdistance_7
      type: f4
    - id: m_afdistance_8
      type: f4
    - id: m_afdistance_9
      type: f4
    - id: m_afdirectionadherence_0
      type: f4
    - id: m_afdirectionadherence_1
      type: f4
    - id: m_afdirectionadherence_2
      type: f4
    - id: m_afdirectionadherence_3
      type: f4
    - id: m_afdirectionadherence_4
      type: f4
    - id: m_afdirectionadherence_5
      type: f4
    - id: m_afdirectionadherence_6
      type: f4
    - id: m_afdirectionadherence_7
      type: f4
    - id: m_afdirectionadherence_8
      type: f4
    - id: m_afdirectionadherence_9
      type: f4
    - id: m_afwhip_0
      type: f4
    - id: m_afwhip_1
      type: f4
    - id: m_afwhip_2
      type: f4
    - id: m_afwhip_3
      type: f4
    - id: m_afwhip_4
      type: f4
    - id: m_afwhip_5
      type: f4
    - id: m_afwhip_6
      type: f4
    - id: m_afwhip_7
      type: f4
    - id: m_afwhip_8
      type: f4
    - id: m_afwhip_9
      type: f4
    - id: m_fturbulence
      type: f4
    - id: m_ftwitch
      type: f4
    - id: m_ftwitchfreqscale
      type: f4
  swindgroup:
    seq:
    - id: m_afrippledistance_0
      type: f4
    - id: m_afrippledistance_1
      type: f4
    - id: m_afrippledistance_2
      type: f4
    - id: m_afrippledistance_3
      type: f4
    - id: m_afrippledistance_4
      type: f4
    - id: m_afrippledistance_5
      type: f4
    - id: m_afrippledistance_6
      type: f4
    - id: m_afrippledistance_7
      type: f4
    - id: m_afrippledistance_8
      type: f4
    - id: m_afrippledistance_9
      type: f4
    - id: m_aftumbleflip_0
      type: f4
    - id: m_aftumbleflip_1
      type: f4
    - id: m_aftumbleflip_2
      type: f4
    - id: m_aftumbleflip_3
      type: f4
    - id: m_aftumbleflip_4
      type: f4
    - id: m_aftumbleflip_5
      type: f4
    - id: m_aftumbleflip_6
      type: f4
    - id: m_aftumbleflip_7
      type: f4
    - id: m_aftumbleflip_8
      type: f4
    - id: m_aftumbleflip_9
      type: f4
    - id: m_aftumbletwist_0
      type: f4
    - id: m_aftumbletwist_1
      type: f4
    - id: m_aftumbletwist_2
      type: f4
    - id: m_aftumbletwist_3
      type: f4
    - id: m_aftumbletwist_4
      type: f4
    - id: m_aftumbletwist_5
      type: f4
    - id: m_aftumbletwist_6
      type: f4
    - id: m_aftumbletwist_7
      type: f4
    - id: m_aftumbletwist_8
      type: f4
    - id: m_aftumbletwist_9
      type: f4
    - id: m_aftumbledirectionadherence_0
      type: f4
    - id: m_aftumbledirectionadherence_1
      type: f4
    - id: m_aftumbledirectionadherence_2
      type: f4
    - id: m_aftumbledirectionadherence_3
      type: f4
    - id: m_aftumbledirectionadherence_4
      type: f4
    - id: m_aftumbledirectionadherence_5
      type: f4
    - id: m_aftumbledirectionadherence_6
      type: f4
    - id: m_aftumbledirectionadherence_7
      type: f4
    - id: m_aftumbledirectionadherence_8
      type: f4
    - id: m_aftumbledirectionadherence_9
      type: f4
    - id: m_aftwitchthrow_0
      type: f4
    - id: m_aftwitchthrow_1
      type: f4
    - id: m_aftwitchthrow_2
      type: f4
    - id: m_aftwitchthrow_3
      type: f4
    - id: m_aftwitchthrow_4
      type: f4
    - id: m_aftwitchthrow_5
      type: f4
    - id: m_aftwitchthrow_6
      type: f4
    - id: m_aftwitchthrow_7
      type: f4
    - id: m_aftwitchthrow_8
      type: f4
    - id: m_aftwitchthrow_9
      type: f4
    - id: m_ftwitchsharpness
      type: f4
    - id: m_frollmaxscale
      type: f4
    - id: m_frollminscale
      type: f4
    - id: m_frollspeed
      type: f4
    - id: m_frollseparation
      type: f4
    - id: m_fleewardscalar
      type: f4
  speedtreewindconfig8:
    seq:
    - id: m_fstrengthresponse
      type: f4
    - id: m_fdirectionresponse
      type: f4
    - id: m_fgustfrequency
      type: f4
    - id: m_fguststrengthmin
      type: f4
    - id: m_fguststrengthmax
      type: f4
    - id: m_fgustdurationmin
      type: f4
    - id: m_fgustdurationmax
      type: f4
    - id: m_fgustrisescalar
      type: f4
    - id: m_fgustfallscalar
      type: f4
    - id: m_fanchoroffset
      type: f4
    - id: m_fanchordistancescale
      type: f4
    - id: oscillation0_0
      type: f4
    - id: oscillation0_1
      type: f4
    - id: oscillation0_2
      type: f4
    - id: oscillation0_3
      type: f4
    - id: oscillation0_4
      type: f4
    - id: oscillation0_5
      type: f4
    - id: oscillation0_6
      type: f4
    - id: oscillation0_7
      type: f4
    - id: oscillation0_8
      type: f4
    - id: oscillation0_9
      type: f4
    - id: oscillation1_0
      type: f4
    - id: oscillation1_1
      type: f4
    - id: oscillation1_2
      type: f4
    - id: oscillation1_3
      type: f4
    - id: oscillation1_4
      type: f4
    - id: oscillation1_5
      type: f4
    - id: oscillation1_6
      type: f4
    - id: oscillation1_7
      type: f4
    - id: oscillation1_8
      type: f4
    - id: oscillation1_9
      type: f4
    - id: oscillation2_0
      type: f4
    - id: oscillation2_1
      type: f4
    - id: oscillation2_2
      type: f4
    - id: oscillation2_3
      type: f4
    - id: oscillation2_4
      type: f4
    - id: oscillation2_5
      type: f4
    - id: oscillation2_6
      type: f4
    - id: oscillation2_7
      type: f4
    - id: oscillation2_8
      type: f4
    - id: oscillation2_9
      type: f4
    - id: oscillation3_0
      type: f4
    - id: oscillation3_1
      type: f4
    - id: oscillation3_2
      type: f4
    - id: oscillation3_3
      type: f4
    - id: oscillation3_4
      type: f4
    - id: oscillation3_5
      type: f4
    - id: oscillation3_6
      type: f4
    - id: oscillation3_7
      type: f4
    - id: oscillation3_8
      type: f4
    - id: oscillation3_9
      type: f4
    - id: oscillation4_0
      type: f4
    - id: oscillation4_1
      type: f4
    - id: oscillation4_2
      type: f4
    - id: oscillation4_3
      type: f4
    - id: oscillation4_4
      type: f4
    - id: oscillation4_5
      type: f4
    - id: oscillation4_6
      type: f4
    - id: oscillation4_7
      type: f4
    - id: oscillation4_8
      type: f4
    - id: oscillation4_9
      type: f4
    - id: oscillation5_0
      type: f4
    - id: oscillation5_1
      type: f4
    - id: oscillation5_2
      type: f4
    - id: oscillation5_3
      type: f4
    - id: oscillation5_4
      type: f4
    - id: oscillation5_5
      type: f4
    - id: oscillation5_6
      type: f4
    - id: oscillation5_7
      type: f4
    - id: oscillation5_8
      type: f4
    - id: oscillation5_9
      type: f4
    - id: oscillation6_0
      type: f4
    - id: oscillation6_1
      type: f4
    - id: oscillation6_2
      type: f4
    - id: oscillation6_3
      type: f4
    - id: oscillation6_4
      type: f4
    - id: oscillation6_5
      type: f4
    - id: oscillation6_6
      type: f4
    - id: oscillation6_7
      type: f4
    - id: oscillation6_8
      type: f4
    - id: oscillation6_9
      type: f4
    - id: oscillation7_0
      type: f4
    - id: oscillation7_1
      type: f4
    - id: oscillation7_2
      type: f4
    - id: oscillation7_3
      type: f4
    - id: oscillation7_4
      type: f4
    - id: oscillation7_5
      type: f4
    - id: oscillation7_6
      type: f4
    - id: oscillation7_7
      type: f4
    - id: oscillation7_8
      type: f4
    - id: oscillation7_9
      type: f4
    - id: oscillation8_0
      type: f4
    - id: oscillation8_1
      type: f4
    - id: oscillation8_2
      type: f4
    - id: oscillation8_3
      type: f4
    - id: oscillation8_4
      type: f4
    - id: oscillation8_5
      type: f4
    - id: oscillation8_6
      type: f4
    - id: oscillation8_7
      type: f4
    - id: oscillation8_8
      type: f4
    - id: oscillation8_9
      type: f4
    - id: oscillation9_0
      type: f4
    - id: oscillation9_1
      type: f4
    - id: oscillation9_2
      type: f4
    - id: oscillation9_3
      type: f4
    - id: oscillation9_4
      type: f4
    - id: oscillation9_5
      type: f4
    - id: oscillation9_6
      type: f4
    - id: oscillation9_7
      type: f4
    - id: oscillation9_8
      type: f4
    - id: oscillation9_9
      type: f4
    - id: m_fglobalheight
      type: f4
    - id: m_fglobalheightexponent
      type: f4
    - id: m_afglobaldistance_0
      type: f4
    - id: m_afglobaldistance_1
      type: f4
    - id: m_afglobaldistance_2
      type: f4
    - id: m_afglobaldistance_3
      type: f4
    - id: m_afglobaldistance_4
      type: f4
    - id: m_afglobaldistance_5
      type: f4
    - id: m_afglobaldistance_6
      type: f4
    - id: m_afglobaldistance_7
      type: f4
    - id: m_afglobaldistance_8
      type: f4
    - id: m_afglobaldistance_9
      type: f4
    - id: m_afglobaldirectionadherence_0
      type: f4
    - id: m_afglobaldirectionadherence_1
      type: f4
    - id: m_afglobaldirectionadherence_2
      type: f4
    - id: m_afglobaldirectionadherence_3
      type: f4
    - id: m_afglobaldirectionadherence_4
      type: f4
    - id: m_afglobaldirectionadherence_5
      type: f4
    - id: m_afglobaldirectionadherence_6
      type: f4
    - id: m_afglobaldirectionadherence_7
      type: f4
    - id: m_afglobaldirectionadherence_8
      type: f4
    - id: m_afglobaldirectionadherence_9
      type: f4
    - id: branchlevel1
      type: sbranchwindlevel
    - id: branchlevel2
      type: sbranchwindlevel
    - id: leafgroup1
      type: swindgroup
    - id: leafgroup2
      type: swindgroup
    - id: m_affrondrippledistance_0
      type: f4
    - id: m_affrondrippledistance_1
      type: f4
    - id: m_affrondrippledistance_2
      type: f4
    - id: m_affrondrippledistance_3
      type: f4
    - id: m_affrondrippledistance_4
      type: f4
    - id: m_affrondrippledistance_5
      type: f4
    - id: m_affrondrippledistance_6
      type: f4
    - id: m_affrondrippledistance_7
      type: f4
    - id: m_affrondrippledistance_8
      type: f4
    - id: m_affrondrippledistance_9
      type: f4
    - id: m_ffrondrippletile
      type: f4
    - id: m_ffrondripplelightingscalar
      type: f4
    - id: m_frollingnoisesize
      type: f4
    - id: m_frollingnoisetwist
      type: f4
    - id: m_frollingnoiseturbulence
      type: f4
    - id: m_frollingnoiseperiod
      type: f4
    - id: m_frollingnoisespeed
      type: f4
    - id: m_frollingbranchfieldmin
      type: f4
    - id: m_frollingbranchlightingadjust
      type: f4
    - id: m_frollingbranchverticaloffset
      type: f4
    - id: m_frollingleafripplemin
      type: f4
    - id: m_frollingleaftumblemin
      type: f4
    - id: branchwindanchor0
      type: f4
    - id: branchwindanchor1
      type: f4
    - id: branchwindanchor2
      type: f4
    - id: m_fmaxbranchlevel1length
      type: f4
    - id: global_wind
      type: b1
    - id: global_preserve_shape
      type: b1
    - id: branch_simple_1
      type: b1
    - id: branch_directional_1
      type: b1
    - id: branch_directional_frond_1
      type: b1
    - id: branch_turbulence_1
      type: b1
    - id: branch_whip_1
      type: b1
    - id: branch_osc_complex_1
      type: b1
    - id: branch_simple_2
      type: b1
    - id: branch_directional_2
      type: b1
    - id: branch_directional_frond_2
      type: b1
    - id: branch_turbulence_2
      type: b1
    - id: branch_whip_2
      type: b1
    - id: branch_osc_complex_2
      type: b1
    - id: leaf_ripple_vertex_normal_1
      type: b1
    - id: leaf_ripple_computed_1
      type: b1
    - id: leaf_tumble_1
      type: b1
    - id: leaf_twitch_1
      type: b1
    - id: leaf_occlusion_1
      type: b1
    - id: leaf_ripple_vertex_normal_2
      type: b1
    - id: leaf_ripple_computed_2
      type: b1
    - id: leaf_tumble_2
      type: b1
    - id: leaf_twitch_2
      type: b1
    - id: leaf_occlusion_2
      type: b1
    - id: frond_ripple_one_sided
      type: b1
    - id: frond_ripple_two_sided
      type: b1
    - id: frond_ripple_adjust_lighting
      type: b1
    - id: rolling
      type: b1
  branchwindlevel:
    seq:
    - id: m_afbend_0
      type: f4
    - id: m_afbend_1
      type: f4
    - id: m_afbend_2
      type: f4
    - id: m_afbend_3
      type: f4
    - id: m_afbend_4
      type: f4
    - id: m_afbend_5
      type: f4
    - id: m_afbend_6
      type: f4
    - id: m_afbend_7
      type: f4
    - id: m_afbend_8
      type: f4
    - id: m_afbend_9
      type: f4
    - id: m_afbend_10
      type: f4
    - id: m_afbend_11
      type: f4
    - id: m_afbend_12
      type: f4
    - id: m_afbend_13
      type: f4
    - id: m_afbend_14
      type: f4
    - id: m_afbend_15
      type: f4
    - id: m_afbend_16
      type: f4
    - id: m_afbend_17
      type: f4
    - id: m_afbend_18
      type: f4
    - id: m_afbend_19
      type: f4
    - id: m_afoscillation_0
      type: f4
    - id: m_afoscillation_1
      type: f4
    - id: m_afoscillation_2
      type: f4
    - id: m_afoscillation_3
      type: f4
    - id: m_afoscillation_4
      type: f4
    - id: m_afoscillation_5
      type: f4
    - id: m_afoscillation_6
      type: f4
    - id: m_afoscillation_7
      type: f4
    - id: m_afoscillation_8
      type: f4
    - id: m_afoscillation_9
      type: f4
    - id: m_afoscillation_10
      type: f4
    - id: m_afoscillation_11
      type: f4
    - id: m_afoscillation_12
      type: f4
    - id: m_afoscillation_13
      type: f4
    - id: m_afoscillation_14
      type: f4
    - id: m_afoscillation_15
      type: f4
    - id: m_afoscillation_16
      type: f4
    - id: m_afoscillation_17
      type: f4
    - id: m_afoscillation_18
      type: f4
    - id: m_afoscillation_19
      type: f4
    - id: m_afspeed_0
      type: f4
    - id: m_afspeed_1
      type: f4
    - id: m_afspeed_2
      type: f4
    - id: m_afspeed_3
      type: f4
    - id: m_afspeed_4
      type: f4
    - id: m_afspeed_5
      type: f4
    - id: m_afspeed_6
      type: f4
    - id: m_afspeed_7
      type: f4
    - id: m_afspeed_8
      type: f4
    - id: m_afspeed_9
      type: f4
    - id: m_afspeed_10
      type: f4
    - id: m_afspeed_11
      type: f4
    - id: m_afspeed_12
      type: f4
    - id: m_afspeed_13
      type: f4
    - id: m_afspeed_14
      type: f4
    - id: m_afspeed_15
      type: f4
    - id: m_afspeed_16
      type: f4
    - id: m_afspeed_17
      type: f4
    - id: m_afspeed_18
      type: f4
    - id: m_afspeed_19
      type: f4
    - id: m_afturbulence_0
      type: f4
    - id: m_afturbulence_1
      type: f4
    - id: m_afturbulence_2
      type: f4
    - id: m_afturbulence_3
      type: f4
    - id: m_afturbulence_4
      type: f4
    - id: m_afturbulence_5
      type: f4
    - id: m_afturbulence_6
      type: f4
    - id: m_afturbulence_7
      type: f4
    - id: m_afturbulence_8
      type: f4
    - id: m_afturbulence_9
      type: f4
    - id: m_afturbulence_10
      type: f4
    - id: m_afturbulence_11
      type: f4
    - id: m_afturbulence_12
      type: f4
    - id: m_afturbulence_13
      type: f4
    - id: m_afturbulence_14
      type: f4
    - id: m_afturbulence_15
      type: f4
    - id: m_afturbulence_16
      type: f4
    - id: m_afturbulence_17
      type: f4
    - id: m_afturbulence_18
      type: f4
    - id: m_afturbulence_19
      type: f4
    - id: m_afflexibility_0
      type: f4
    - id: m_afflexibility_1
      type: f4
    - id: m_afflexibility_2
      type: f4
    - id: m_afflexibility_3
      type: f4
    - id: m_afflexibility_4
      type: f4
    - id: m_afflexibility_5
      type: f4
    - id: m_afflexibility_6
      type: f4
    - id: m_afflexibility_7
      type: f4
    - id: m_afflexibility_8
      type: f4
    - id: m_afflexibility_9
      type: f4
    - id: m_afflexibility_10
      type: f4
    - id: m_afflexibility_11
      type: f4
    - id: m_afflexibility_12
      type: f4
    - id: m_afflexibility_13
      type: f4
    - id: m_afflexibility_14
      type: f4
    - id: m_afflexibility_15
      type: f4
    - id: m_afflexibility_16
      type: f4
    - id: m_afflexibility_17
      type: f4
    - id: m_afflexibility_18
      type: f4
    - id: m_afflexibility_19
      type: f4
    - id: m_findependence
      type: f4
  ripplegroup:
    seq:
    - id: m_afplanar_0
      type: f4
    - id: m_afplanar_1
      type: f4
    - id: m_afplanar_2
      type: f4
    - id: m_afplanar_3
      type: f4
    - id: m_afplanar_4
      type: f4
    - id: m_afplanar_5
      type: f4
    - id: m_afplanar_6
      type: f4
    - id: m_afplanar_7
      type: f4
    - id: m_afplanar_8
      type: f4
    - id: m_afplanar_9
      type: f4
    - id: m_afplanar_10
      type: f4
    - id: m_afplanar_11
      type: f4
    - id: m_afplanar_12
      type: f4
    - id: m_afplanar_13
      type: f4
    - id: m_afplanar_14
      type: f4
    - id: m_afplanar_15
      type: f4
    - id: m_afplanar_16
      type: f4
    - id: m_afplanar_17
      type: f4
    - id: m_afplanar_18
      type: f4
    - id: m_afplanar_19
      type: f4
    - id: m_afdirectional_0
      type: f4
    - id: m_afdirectional_1
      type: f4
    - id: m_afdirectional_2
      type: f4
    - id: m_afdirectional_3
      type: f4
    - id: m_afdirectional_4
      type: f4
    - id: m_afdirectional_5
      type: f4
    - id: m_afdirectional_6
      type: f4
    - id: m_afdirectional_7
      type: f4
    - id: m_afdirectional_8
      type: f4
    - id: m_afdirectional_9
      type: f4
    - id: m_afdirectional_10
      type: f4
    - id: m_afdirectional_11
      type: f4
    - id: m_afdirectional_12
      type: f4
    - id: m_afdirectional_13
      type: f4
    - id: m_afdirectional_14
      type: f4
    - id: m_afdirectional_15
      type: f4
    - id: m_afdirectional_16
      type: f4
    - id: m_afdirectional_17
      type: f4
    - id: m_afdirectional_18
      type: f4
    - id: m_afdirectional_19
      type: f4
    - id: m_afspeed_0
      type: f4
    - id: m_afspeed_1
      type: f4
    - id: m_afspeed_2
      type: f4
    - id: m_afspeed_3
      type: f4
    - id: m_afspeed_4
      type: f4
    - id: m_afspeed_5
      type: f4
    - id: m_afspeed_6
      type: f4
    - id: m_afspeed_7
      type: f4
    - id: m_afspeed_8
      type: f4
    - id: m_afspeed_9
      type: f4
    - id: m_afspeed_10
      type: f4
    - id: m_afspeed_11
      type: f4
    - id: m_afspeed_12
      type: f4
    - id: m_afspeed_13
      type: f4
    - id: m_afspeed_14
      type: f4
    - id: m_afspeed_15
      type: f4
    - id: m_afspeed_16
      type: f4
    - id: m_afspeed_17
      type: f4
    - id: m_afspeed_18
      type: f4
    - id: m_afspeed_19
      type: f4
    - id: m_afflexibility_0
      type: f4
    - id: m_afflexibility_1
      type: f4
    - id: m_afflexibility_2
      type: f4
    - id: m_afflexibility_3
      type: f4
    - id: m_afflexibility_4
      type: f4
    - id: m_afflexibility_5
      type: f4
    - id: m_afflexibility_6
      type: f4
    - id: m_afflexibility_7
      type: f4
    - id: m_afflexibility_8
      type: f4
    - id: m_afflexibility_9
      type: f4
    - id: m_afflexibility_10
      type: f4
    - id: m_afflexibility_11
      type: f4
    - id: m_afflexibility_12
      type: f4
    - id: m_afflexibility_13
      type: f4
    - id: m_afflexibility_14
      type: f4
    - id: m_afflexibility_15
      type: f4
    - id: m_afflexibility_16
      type: f4
    - id: m_afflexibility_17
      type: f4
    - id: m_afflexibility_18
      type: f4
    - id: m_afflexibility_19
      type: f4
    - id: m_findependence
      type: f4
    - id: m_fshimmer
      type: f4
  vector3f:
    seq:
    - id: x
      type: f4
    - id: y
      type: f4
    - id: z
      type: f4
  speedtreewindconfig9:
    seq:
    - id: m_fstrengthresponse
      type: f4
    - id: m_fdirectionresponse
      type: f4
    - id: m_fgustfrequency
      type: f4
    - id: m_fguststrengthmin
      type: f4
    - id: m_fguststrengthmax
      type: f4
    - id: m_fgustdurationmin
      type: f4
    - id: m_fgustdurationmax
      type: f4
    - id: m_fgustrisescalar
      type: f4
    - id: m_fgustfallscalar
      type: f4
    - id: m_fbranch1stretchlimit
      type: f4
    - id: m_fbranch2stretchlimit
      type: f4
    - id: m_fsharedheightstart
      type: f4
    - id: m_sshared
      type: branchwindlevel
    - id: m_sbranch1
      type: branchwindlevel
    - id: m_sbranch2
      type: branchwindlevel
    - id: m_sripple
      type: ripplegroup
    - id: m_vtreeextents
      type: vector3f
    - id: m_fwindindependence
      type: f4
    - id: m_bdoshared
      type: s4
    - id: m_bdobranch1
      type: s4
    - id: m_bdobranch2
      type: s4
    - id: m_bdoripple
      type: s4
    - id: m_bdoshimmer
      type: s4
    - id: m_blodfade
      type: s4
    - id: m_fimportscaling
      type: f4
