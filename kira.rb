#Light's Theme

use_bpm 70

kira_rg_d1 =
  [:d2, :e4, :d4, :a3,
   :f4, :d4, :a3, :a4,
   :d2, :e4, :d4, :a3,
   :f4, :d4, :a3, :g4]
  
kira_rg_d2 =
  [:d2, :e4, :d4, :a3,
   :a4, :e4, :d4, :a3,
   :c2, :e4, :d4, :a3,
   :a4, :e4, :d4, :a3,
   :bb2, :e4, :d4, :a3,
   :a4, :e4, :d4, :a3,
   :bb2, :e4, :d4, :a3,
   :a4, :e4, :d4, :a3]
  
kira_rg_a2 =
  [:a2, :e4, :cs4, :a3,
   :e4, :cs4, :a3, :a4,
   :a2, :e4, :cs4, :a3,
   :e4, :cs4, :a3, :g4]
  
kira_rg_bb =
  [:bb2, :f4, :d4, :bb3,
   :f4, :d4, :bb3, :a4]
  
kira_rg_a3 =
  [:a2, :e4, :c4, :a3,
   :e4, :c4, :a3, :a4]
  
kira_rg_a1a =
  [:a2, :e4, :c4, :a3,
   :e4, :c4, :a3, :a4]
  
kira_rg_a1b =
  [:a2, :e4, :c4, :a3,
   :e4, :c4, :a3, :g4]
  
kira_rg_a1c =
  [:a2, :e4, :c4, :a3,
   :f4, :e4, :d4, :c3]
  
define :lead_a do
  play_pattern_timed [:d5, :d5, :d5], [1.75, 2, 0.25]
  sleep 3.25
  play [:d5], release: 1
  sleep 0.75
  play_pattern_timed [:cs5, :cs5, :cs5], [1.75, 2, 0.25]
end

define :lead_b do
  play_pattern_timed [:d5, :e5, :f5, :e5, :c5], [0.5, 0.25, 4, 0.75, 1.25]
  sleep 1.25
  play_pattern_timed [:d5, :e5, :f5, :g5, :e5], [0.5, 0.25, 3.5, 0.5, 1.25]
  sleep 2.75
end

define :lead_c do
  play_pattern_timed [:d5, :c5, :a4, :g4,
                      :a4, :c5, :a4], 1
  play_pattern_timed [:r, :g4, :g4, :a4, :c5], [0.25, 0.5, 0.25, 1, 3]
  sleep 3
  play_pattern_timed [:d5, :d5, :d5, :r], 0.25
end

in_thread do
  use_synth :blade
  with_fx :reverb, mix: 0.75 do
    2.times do
      2.times do
        2.times do
          play_pattern_timed kira_rg_d1, 0.25
        end
        play_pattern_timed kira_rg_a1a, 0.25
        play_pattern_timed kira_rg_a1b, 0.25
        play_pattern_timed kira_rg_a1a, 0.25
        play_pattern_timed kira_rg_a1c, 0.25
      end
      2.times do
        2.times do
          play_pattern_timed kira_rg_d1, 0.25
        end
        2.times do
          play_pattern_timed kira_rg_a2, 0.25
        end
      end
      2.times do
        play_pattern_timed kira_rg_bb, 0.25
      end
      2.times do
        play_pattern_timed kira_rg_a3, 0.25
      end
      2.times do
        play_pattern_timed kira_rg_bb, 0.25
      end
      play_pattern_timed kira_rg_a3, 0.25
      play_chord [:a3, :c4, :e4], release: 2
      sleep 2
      play_pattern_timed kira_rg_d2, 0.25
      with_fx :distortion do
        play_chord [:a3, :c4, :e4], release: 4
        sleep 4
      end
      play_chord [:a3, :c4, :e4], release: 4
      sleep 4
    end
  end
end

in_thread do
  use_synth :tri
  use_synth_defaults attack: 0.05
  2.times do
    sleep 32
    with_fx :reverb, mix: 0.6 do
      with_fx :slicer do
        lead_a
        sleep 4
        lead_a
        sleep 3.25
        lead_b
      end
      lead_c
    end
  end
end

in_thread do
  2.times do
    use_synth :hoover
    use_synth_defaults amp: 0.3
    with_fx :lpf do
      sleep 63.25
      play_pattern_timed [:g1, :g1, :a1, :bb1, :a1], [0.25, 0.25, 0.25, 4, 3.25]
      play_pattern_timed [:g1, :g1, :a1, :bb1, :a1], [0.25, 0.25, 0.25, 4, 1.25]
      sleep 10
      play_pattern_timed [:g1, :g1, :a1], [0.5, 0.25, 4]
      sleep 4
    end
  end
end

use_synth :blade
with_fx :reverb, mix: 0.75 do
  sleep 96 * 2
  2.times do
    play_pattern_timed kira_rg_d1, 0.25
  end
  2.times do
    play_pattern_timed kira_rg_a1a, 0.25
    play_pattern_timed kira_rg_a1b, 0.25
  end
  2.times do
    play_pattern_timed kira_rg_d1, 0.25
  end
  play_pattern_timed kira_rg_a1a, 0.25
  play_pattern_timed kira_rg_a1b, 0.25
  play_pattern_timed kira_rg_a1a, 0.25
  play_pattern_timed kira_rg_a1c, 0.25
  play_pattern_timed [:d2, :d3, :a3, :e4], 0.0625, sustain: 1.2, release: 2
end
