#Prelude

use_bpm 75

arp_c = [:c3, :d3, :e3, :g3,
         :c4, :d4, :e4, :g4,
         :c5, :d5, :e5, :g5,
         :c6, :d6, :e6, :g6,
         :c7, :g6, :e6, :d6,
         :c6, :g5, :e5, :d5,
         :c5, :g4, :e4, :d4,
         :c4, :g3, :e3, :d3]

arp_a = [:a2, :b2, :c3, :e3,
         :a3, :b3, :c4, :e4,
         :a4, :b4, :c5, :e5,
         :a5, :b5, :c6, :e6,
         :a6, :e6, :c6, :b5,
         :a5, :e5, :c5, :b4,
         :a4, :e4, :c4, :b3,
         :a3, :e3, :c3, :b2]

arp_f = [:f2, :g2, :a2, :c3,
         :f3, :g3, :a3, :c4,
         :f4, :g4, :a4, :c5,
         :f5, :g5, :a5, :c6,
         :f6, :c6, :a5, :g5,
         :f5, :c5, :a4, :g4,
         :f4, :c4, :a3, :g3,
         :f3, :c3, :a2, :g2]

arp_g = [:g2, :a2, :b2, :d3,
         :g3, :a3, :b3, :d4,
         :g4, :a4, :b4, :d5,
         :g5, :a5, :b5, :d6,
         :g6, :d6, :b5, :a5,
         :g5, :d5, :b4, :a4,
         :g4, :d4, :b3, :a3,
         :g3, :d3, :b2, :a2]

arp_ab = [:ab2, :bb2, :c3, :eb3,
          :ab3, :bb3, :c4, :eb4,
          :ab4, :bb4, :c5, :eb5,
          :ab5, :bb5, :c6, :eb6,
          :ab6, :eb6, :c6, :bb5,
          :ab5, :eb5, :c5, :bb4,
          :ab4, :eb4, :c4, :bb3,
          :ab3, :eb3, :c3, :bb2]

arp_bb = [:bb2, :c3, :d3, :f3,
          :bb3, :c4, :d4, :f4,
          :bb4, :c5, :d5, :f5,
          :bb5, :c6, :d6, :f6,
          :bb6, :f6, :d6, :c6,
          :bb5, :f5, :d5, :c5,
          :bb4, :f4, :d4, :c4,
          :bb3, :f3, :d3, :c3]

live_loop :arp do
  use_synth :pulse
  use_synth_defaults release: 1, amp: 0.5
  play_pattern_timed (arp_c), 0.25
  play_pattern_timed (arp_a), 0.25
  play_pattern_timed (arp_c), 0.25
  play_pattern_timed (arp_a), 0.25
  play_pattern_timed (arp_f), 0.25
  play_pattern_timed (arp_g), 0.25
  play_pattern_timed (arp_ab), 0.25
  play_pattern_timed (arp_bb), 0.25
end

sleep 64

live_loop :lead do
  use_synth :pulse
  play (ring :c5, :e5), release: 4
  sleep 4
  play (ring :b4, :d5), release: 3
  sleep 2
  play (ring :d5, :f5), release: 3
  sleep 2
  play (ring :c5, :e5), release: 8
  sleep 8
  play (ring :c5, :e5), release: 4
  sleep 4
  play (ring :b4, :d5), release: 3
  sleep 2
  play (ring :d5, :f5), release: 3
  sleep 2
  play (ring :d5, :f5), release: 1
  sleep 0.5
  play (ring :e5, :g5), release: 1
  sleep 0.5
  play (ring :c5, :e5), release: 7
  sleep 7
  play (ring :a4, :c5), release: 4
  sleep 4
  play (ring :g4, :b4), release: 3
  sleep 2
  play (ring :a4, :c5), release: 3
  sleep 2
  play (ring :b4, :d5), release: 3
  sleep 3
  play (ring :c5, :e5), release: 2
  sleep 1
  play (ring :d5, :f5), release: 3
  sleep 2
  play (ring :b4, :g5), release: 3
  sleep 2
  play (ring :d5, :f5), release: 2
  sleep 1
  play (ring :c5, :eb5), release: 1
  sleep 0.5
  play (ring :bb4, :d5), release: 1
  sleep 0.5
  play (ring :ab4, :c5), release: 6
  sleep 6
  play (ring :eb5, :g5), release: 2
  sleep 1
  play (ring :d5, :f5), release: 1
  sleep 0.5
  play (ring :c5, :eb5), release: 1
  sleep 0.5
  play (ring :bb4, :d5), release: 6
  sleep 6
  sleep 64
end
