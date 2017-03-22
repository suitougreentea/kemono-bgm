\version "2.19.24"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "戦うやつ"
}

\paper {
  %page-count = 2
}

global = {
  \numericTimeSignature
  \key g \minor
  \time 4/4
  \tempo 4 = 128

}

right = << \global \relative c {
  \clef bass
  r8. <d g>16 ~ q8 g r8. <d g>16 ~ q8 g |
  r8. <d g>16 ~ q8 g r8. <d aes'>16 ~ q8 aes'
  r8. <d, g>16 ~ q8 g r8. <d g>16 ~ q8 g |
  r8. <d g>16 ~ q8 g r8. <g d'>16 ~ q8 d' |
  r8. <d, g>16 ~ q8 g r8. <d g>16 ~ q8 g |
  r8. <d g>16 ~ q8 g r8. <d aes'>16 ~ q8 aes'
  r8. <d, g>16 ~ q8 g r8. <d g>16 ~ q8 g |
  r8. <d g>16 ~ q8 g r8. <aes d>16 ~ q8 d |

  \clef treble
  << {
    <a' bes d f>1 ~ | q | <a bes d f>1 ~ | q |
    q | <bes d f a> | <d f a bes> | <f a bes d>2 <a bes d f>
     } \\ {
    r8. <g,, d' g>16 ~ q8 <d' g> r8. <g, d' g>16 ~ q8 <d' g> |
    r8. <g, d' g>16 ~ q8 <d' g> r8. <aes d aes'>16 ~ q8 <d aes'> |
    r8. <g, d' g>16 ~ q8 <d' g> r8. <g, d' g>16 ~ q8 <d' g> |
    r8. <g, d' g>16 ~ q8 <d' g> r8. <d g d'>16 ~ q8 <g d'> |
    r8. <g, d' g>16 ~ q8 <d' g> r8. <g, d' g>16 ~ q8 <d' g> |
    r8. <g, d' g>16 ~ q8 <d' g> r8. <aes d aes'>16 ~ q8 <d aes'> |
    r8. <g, d' g>16 ~ q8 <d' g> r8. <g, d' g>16 ~ q8 <d' g> |
    r8. <g, d' g>16 ~ q8 <d' g> r8. <d aes' d>16 ~ q8 d' |
  } >>
  \ottava 1 \tuplet 6/4 { a''16 bes a f d bes } \ottava 0 \tuplet 6/4 { a bes a f d bes } \tuplet 6/4 { a bes a f d bes } a32 c d f a c d a'
} >>

left = << \global \relative c, {
  g16 g' g, g' ~ g g, g'8 g,16 g' g, g' ~ g g, g'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, bes' ~ bes g, bes'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, g' ~ g g, g'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, bes' ~ bes g, bes'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, g' ~ g g, g'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, bes' ~ bes g, bes'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, g' ~ g g, g'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, aes' ~ aes aes, aes'8 |

  g,16 g' g, g' ~ g g, g'8 g,16 g' g, g' ~ g g, g'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, bes' ~ bes g, bes'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, g' ~ g g, g'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, bes' ~ bes g, bes'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, g' ~ g g, g'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, bes' ~ bes g, bes'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, g' ~ g g, g'8 |
  g,16 g' g, g' ~ g g, g'8 g,16 g' g, aes' ~ aes aes, aes'8 \laissezVibrer |
  s1
} >>

dynamics = {
}

pedal = {

}

\score {
  <<
    \new PianoStaff \with {
      % instrumentName = "Piano"
      % connectArpeggios = ##t
    } <<
      \new Staff = "right" \with {
        midiInstrument = "acoustic grand"
      } \right
      \new Dynamics = "dynamics" \dynamics
      \new Staff = "left" \with {
        midiInstrument = "acoustic grand"
      } { \clef bass \left }
      \new Dynamics = "pedal" \pedal
    >>
  >>
  \layout {
    %system-count = 5
  }
  \midi {
    %\tempo 8=195
  }
}