# Stars

use_bpm 75

def play_percussion_timed drum, pattern, duration
  pattern = pattern.flatten.reduce(:+) if pattern.is_a?(Array)
  
  notes = pattern.downcase.split('')
  drum_vol = 0.35
  drum_vol = 0.55 if drum != :drum_cymbal_closed
  
  notes.each_with_index do | note, index |
    sample drum, amp: drum_vol if note == 'x'
    
    if duration.is_a?(Array)
      beat = duration.flatten
      
      time = beat[index % beat.length]
    end
    
    sleep time || duration
  end
end

def play_intro_hook
  with_fx :ixi_techno, mix: 0.7 do
    play_pattern_timed [:e4, :eb4, :cs4, :c4],
      [0.75, 0.58333, 0.33333, 0.33333]
  end
end

def play_intro_lead
  use_synth_defaults amp: 0.4
  
  with_fx :panslicer, mix: 0.65, pulse_width: 0.7, wave: 3 do
    2.times do
      play_intro_hook
      
      with_fx :ixi_techno, mix: 0.3 do
        play_pattern_timed [
          :eb4, :c4, :f3, :c4, :bb3, :gs3, :bb3, :fs3
        ], [
          1, 1, 0.5, 0.5, 0.33333, 0.33333, 1.33333, 1
        ]
      end
    end
    
    play_intro_hook
    play ring(:ab3, :eb4), decay: 4
  end
end

def play_intro_bass
  with_fx :bitcrusher, amp: 0.25, mix: 0.75 do
    with_fx :flanger do
      with_fx :rlpf do
        rhythm_a = [
          [0.5] * 3, 0.25, 0.5,
          0.25, [0.5] * 2, [0.25] * 2
        ].flatten
        
        2.times do
          play_pattern_timed [
            [:f2, :c3, :ab2, :f2, :c3] * 2
          ].flatten, rhythm_a
          
          play_pattern_timed [
            :eb2, :gb2, :gb2, :c2, :db2, :c2, :eb2, :gb2
          ], [
            [0.5] * 2, [0.25] * 2, 1.5, [0.33333] * 3
          ].flatten
        end
      end
    end
  end
end

def play_intro_head_bass
  sleep 2
  play_intro_bass
end

def play_intro_tail_bass
  play_intro_bass
  play ring(:f1, :f2), decay: 4, release: 4, amp: 0.3
end

def play_verse_lead
  use_synth_defaults amp: 1
  
  riff_head_a = [:r, :c4, :ab3, :c4]
  riff_head_b = [:r, :db4, :ab3, :db4]
  
  riff_tail = [
    :r, :db4, :eb4, :c4,
    :bb3, :ab3, :bb3, :c4, :bb3, :ab3, :ab3, :g3, :ab3
  ]
  rhythm = [
    [[0.5] * 4] * 3,
    [[0.5] * 2, [ 0.33333 ] * 3]
  ].flatten
  
  with_fx :panslicer, amp: 0.5, mix: 0.6, pulse_width: 0.7, wave: 3 do
    with_fx :flanger, mix: 0.85 do
      2.times do
        play_pattern_timed [riff_head_a, riff_tail].flatten, rhythm
      end
      2.times do
        play_pattern_timed [riff_head_b, riff_tail].flatten, rhythm
      end
    end
  end
end

def play_verse_bass
  use_synth_defaults amp: 1
  
  with_fx :bitcrusher, amp: 0.3, mix: 0.75 do
    with_fx :rlpf do
      
      in_thread do
        octaves = [
          [ ring(:bb0, :bb1), ring(:db1, :db2) ],
          [ ring(:c1, :c2), ring(:bb0, :bb1) ]
        ]
        
        play ring(:f1, :f2), decay: 4
        sleep 4
        
        play_pattern_timed octaves[0], 2, decay: 2
        
        play ring(:f1, :f2), decay: 4
        sleep 4
        
        play_pattern_timed octaves[1], 2, decay: 2
        
        play ring(:ab1, :db2), decay: 4
        sleep 4
        
        play_pattern_timed octaves[0], 2, decay: 2
        
        play ring(:f1, :f2), decay: 4
        sleep 4
        
        play_pattern_timed octaves[1], 2, decay: 2
      end
      
      4.times do
        sleep 2
        play_pattern_timed [
          :ab2, :g2, :eb2,
          :c2, :eb2, :c2,
          :bb2, :ab2, :g2
        ], [0.75, 0.75, 0.5]
      end
      
    end
  end
end

def play_pre_chorus_lead verse = 1
  riff_head_a = [
    [:db4, :ab3] * 2,
    [:eb4, :c4, :bb3, :c4]
  ]
  riff_tail_a = [:ab3, :f3, :g3, :f3, :g3, :ab3]
  
  riff_head_b1 = [
    :db4, :ab3, :db4, :f4
  ]
  riff_head_b2 = [
    :fb4, :c4, :bb3, :c4
  ]
  
  if verse == 2
    riff_head_b2 = [
      :eb4, :c4, :fb4, :c4
    ]
  end
  
  riff_head_b = [ riff_head_b1, riff_head_b2 ].flatten
  
  riff_tail_b = [
    :g4, :ab4, :g4, :eb4,
    :f4, :eb4, :c4
  ]
  
  rhythm_head = [[0.5] * 8]
  
  rhythm_tail_a = [
    [0.5] * 2, [0.25] * 3, 2.25
  ]
  
  rhythm_tail_b = [
    [0.5] * 2, [0.25] * 2, 0.75, 0.25, 1.5
  ]
  
  riff_c = [
    ring(:db3, :eb4), :ab3, ring(:db4, :eb4), :f4,
    ring(:bb3, :fb4), :c4, ring(:g4, :fb4), :c4,
    ring(:ab4, :f4), :c4, :ab3, :c4,
    ring(:c4, :eb4), :ab3, ring(:c4, :e4), :ab3,
    :f4, :c4, :ab3, :c4, :eb4, :ab3, :db4, :ab3
  ]
  
  with_fx :panslicer, amp: 0.5, mix: 0.6, pulse_width: 0.7, wave: 3 do
    with_fx :flanger, mix: 0.85 do
      riff = [riff_head_a, riff_tail_a].flatten
      rhythm = [rhythm_head, rhythm_tail_a].flatten
      play_pattern_timed riff, rhythm
      
      riff = [riff_head_b, riff_tail_b].flatten
      rhythm = [rhythm_head, rhythm_tail_b].flatten
      play_pattern_timed riff, rhythm
      
      play_pattern_timed riff_c, 0.5
      play ring(:eb4, :ab4), decay: 2
      sleep 2
      play :g4, decay: 2, amp: 0.3
    end
  end
end

def play_pre_chorus_bass
  use_synth_defaults cutoff: 115, amp: 0.25
  
  play_pattern_timed [
    :db2, :eb2, :f2,
    :db2, :c2, :ab1,
  ], [2, 2, 4]
  
  play_pattern_timed [
    :db2, :fb2, :c2,
    :ab2, :g2, :f2, :eb2,
    :db2, :bb1, :ab1,
    :eb2
  ], [
    2, 1, 1,
    [1] * 4,
    2, 1, 1,
    4
  ].flatten
  
  use_synth_defaults cutoff: 110
end

def play_chorus_lead
  with_fx :panslicer, amp: 0.5, mix: 0.65, pulse_width: 0.7, wave: 3 do
    
    play_intro_hook
    
    rhythm = [[0.5] * 6, 0.25, 0.75].flatten
    
    play_pattern_timed [[:eb4, :c4] * 3, :bb3, :c4].flatten, rhythm
    
    play_pattern_timed [[:e4, :c4] * 3, :bb3, :c4].flatten, rhythm
    
    play_pattern_timed [
      :f4, :eb4, :db4, :c4,
      :db4, :eb4, :db4, :c4, :db4, :ab3
    ],
      [[0.5] * 6, [0.25] * 2, 1, 1.5].flatten
  end
end

def play_chorus_bass
  use_synth_defaults amp: 0.35
  
  play_pattern_timed [
    :c2, :ab1, :eb2,
    :db2, :bb1, :f2,
    :eb2, :c2, :g2,
    :fb2, :db2, :fb2, :eb2
  ], [[2, 1, 1] * 3, [1] * 4].flatten
  
  use_synth_defaults amp: 1
end

in_thread do
  use_synth :tech_saws
  play_intro_lead
  play_verse_lead
  play_pre_chorus_lead
  play_chorus_lead
  play_intro_lead
  play_verse_lead
  play_pre_chorus_lead 2
  2.times do
    play_chorus_lead
  end
  play_intro_lead
end

in_thread do
  use_synth :prophet
  play_intro_head_bass
  play_verse_bass
  play_pre_chorus_bass
  play_chorus_bass
  play_intro_bass
  play_verse_bass
  play_pre_chorus_bass
  2.times do
    play_chorus_bass
  end
  play_intro_tail_bass
end


# hihat
def play_intro_hihat sample = :drum_cymbal_closed
  beats = [['--xx-xx-'], ['-xxx']]
  notes = [[0.125] * 8, [0.25] * 4]
  
  8.times do
    play_percussion_timed sample, beats, notes
  end
end

def play_intro_head_hihat sample = :drum_cymbal_closed
  sleep 1
  play_percussion_timed sample, ['-xxx'], 0.25
  
  play_intro_hihat
end

def play_verse_hihat
  2.times do
    play_intro_hihat
  end
end

def play_prechorus_hihat sample = :drum_cymbal_closed
  32.times do
    play_percussion_timed sample, '-xxx', 0.25
  end
end

def play_chorus_hihat sample = :drum_cymbal_closed
  beats = [['--xx-xx-'], ['--xx--x-']]
  notes = [[0.125] * 8]
  8.times do
    play_percussion_timed sample, beats, notes
  end
end


in_thread do
  play_intro_head_hihat
  play_verse_hihat
  play_prechorus_hihat
  play_chorus_hihat
  play_intro_hihat
  play_verse_hihat
  play_prechorus_hihat
  2.times do
    play_chorus_hihat
  end
  play_intro_hihat
end


# kick
def play_intro_kick sample = :bd_chip
  sleep 2
  2.times do
    3.times do
      play_percussion_timed sample, '--xx', 0.5
    end
    sleep 2
  end
end

def play_verse_kick sample = :bd_chip
  # front half
  sleep 16
  
  # back half
  4.times do
    play_percussion_timed sample, 'x-xx', 1
  end
end

def play_prechorus_kick sample = :bd_chip
  14.times do
    play_percussion_timed sample, 'x-', 1
  end
  
  sleep 2
end

def play_chorus_kick sample = :bd_chip
  8.times do
    play_percussion_timed sample, 'x-', 1
  end
end


in_thread do
  with_fx :flanger, mix: 0.7 do
    2.times do
      play_intro_kick
      play_verse_kick
      play_prechorus_kick
      play_chorus_kick
    end
    play_chorus_kick
    play_intro_kick
  end
end


# snare
def play_intro_snare sample = :glitch_perc4
  sleep 2
  2.times do
    2.times do
      sleep 1
      play_percussion_timed sample, 'xx--', 0.25
    end
    sleep 1
    play_percussion_timed sample, 'xxx', 0.33333
    sleep 2
  end
end

def play_verse_snare
  sleep 32
end

def play_prechorus_snare sample = :glitch_perc4
  8.times do
    sleep 1
    play_percussion_timed sample, 'xx-', 0.33333
  end
  
  5.times do
    sleep 1
    play_percussion_timed sample, 'x', 1
  end
  
  sleep 1
  play_percussion_timed sample, 'xxx', 0.33333
  
  sleep 2
end

def play_chorus_snare sample = :glitch_perc4
  8.times do
    play_percussion_timed sample, '----xx-x', 0.25
  end
end


in_thread do
  2.times do
    play_intro_snare
    play_verse_snare
    play_prechorus_snare
    play_chorus_snare
  end
  play_chorus_snare
  play_intro_snare
end

# Love Always
# Charlie
