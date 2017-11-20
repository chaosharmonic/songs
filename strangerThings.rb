# Stranger Things theme

use_bpm 83

in_thread do
  50.times do
    with_fx :flanger do
      with_fx :reverb do
        use_synth :blade
        play_pattern_timed [:c2, :e2, :g2, :b2, :c3, :b2, :g2, :e2], 0.25, amp: 0.75
      end
    end
  end
end

in_thread do
  96.times do
    sample :bd_fat, amp: 3
    sleep 0.25
    sample :bd_fat, amp: 3
    sleep 0.75
  end
end

sleep 32

in_thread do
  2.times do
    with_fx :flanger do
      with_fx :reverb do
        use_synth :dsaw
        play_chord [:c2, :c3], release: 6, amp: 2
        sleep 6
        play_chord [:d2, :d3], release: 1.5, amp: 2
        sleep 1.5
        play_chord [:e2, :e3], release: 6, amp: 2
        sleep 6.5
        play_chord [:g2, :g3], release: 1.5, amp: 2
        sleep 1.5
        play_chord [:c2, :c3], release: 6, amp: 1.25
        sleep 6.5
        play_chord [:d2, :d3], release: 1.5, amp: 1.25
        sleep 1.5
        play_chord [:b1, :b2], release: 8, amp: 1.25
        sleep 8.5
      end
    end
  end
end

sleep 32

in_thread do
  2.times do
    with_fx :reverb do
      use_synth :tech_saws
      sleep 1
      play_chord [:g4, :g5], release: 5, amp: 1.5
      sleep 15
    end
  end
end

with_fx :flanger do
  with_fx :reverb do
    use_synth :blade
    play :e1, decay: 4
  end
end