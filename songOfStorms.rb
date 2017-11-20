# Song of Storms

use_bpm 70

melody_a = [:d3, :f3, :d4,
            :f3, :a3, :d4,
            :e4, :f4, :e4, :f4,
            :e4, :c4, :a3]
rhythm_a = [0.25, 0.25, 1,
            0.25, 0.25, 1,
            0.75, 0.25, 0.25, 0.25,
            0.25, 0.25, 1]

melody_b1 = [:a3, :d3, :f3, :g3, :a3, :r,
             :a3, :d3, :f3, :g3, :e3, :r]
rhythm_b1 = [0.5, 0.5, 0.25, 0.25, 1, 0.5]

melody_b2 = [:a3, :d3, :f3, :g3, :a3,
             :a3, :d3]
rhythm_b2 = [0.5, 0.5, 0.25, 0.25, 1,
             0.5, 1]

bass = [:d2, :d3, :d3, :e2, :e3,
        :f2, :f3, :f3, :e2, :e3]
rhythm_bass = [0.5, 0.5, 0.5, 0.5, 1]

live_loop :bass do
  use_synth :dsaw
  play_pattern_timed bass, rhythm_bass, amp: 0.4
end


live_loop :melody do
  sleep 12
  use_synth :blade
  use_synth_defaults release: 1.1
  with_fx :flanger do
    with_fx :slicer, mix: 0.75 do
      play_pattern_timed melody_a, rhythm_a
      play_pattern_timed melody_b1, rhythm_b1
      play_pattern_timed melody_a, rhythm_a
      play_pattern_timed melody_b2, rhythm_b2
      sleep 2
    end
  end
end