\version "2.19.59"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "セルリアン"
  nickname = "（へしが無いやつ）"
  revision = "Revision 2 (Unfinished)"
  date = "2017/5/14"
}

\paper {
  page-count = 3
}

global = {
  \numericTimeSignature
  \key g \minor
  \time 4/4
  \tempo 4 = 128
  s1*43 \bar "|."
}

right = << \global \relative c {
  \clef bass
  r8. <d g>16^\p^\< ~ q8 g r8. <d g>16 ~ q8 g |
  r8. <d g>16 ~ q8 g r8. <d aes'>16 ~ q8 aes' |
  r8. <d, g>16 ~ q8 g r8. <d g>16 ~ q8 g |
  r8. <d g>16 ~ q8 g r8. <g d'>16 ~ q8 d'\! |
  r8. <d, g>16^\> ~ q8 g r8. <d g>16 ~ q8 g |
  r8. <d g>16 ~ q8 g r8. <d aes'>16 ~ q8 aes'\! |
  r8. <d, g>16^\< ~ q8 g r8. <d g>16 ~ q8 g |
  r8. <d g>16 ~ q8 g r8. <aes d>16 ~ q8 d\! |

  \clef treble
  << {
    <a' bes d f>1 ~ | q | <a bes d f>1 ~ | q |
    q | <bes d f a> | <d f a bes> | <f a bes d>2
    \override LaissezVibrerTie.X-extent = #'(0 . 0)
    \override LaissezVibrerTie.details.note-head-gap = #(/ 11.5 -2)
    \override LaissezVibrerTie.extra-offset = #(cons (/ 11.5 2) 0)
    <a bes d f>\laissezVibrer |
     } \\ {
    r8. <g,, d' g>16 ~ q8 <d' g> r8. <g, d' g>16 ~ q8 <d' g> |
    r8. <g, d' g>16 ~ q8 <d' g> r8. <aes d aes'>16 ~ q8 <d aes'>\! |
    r8. <g, d' g>16_\> ~ q8 <d' g> r8. <g, d' g>16 ~ q8 <d' g> |
    r8. <g, d' g>16 ~ q8 <d' g> r8. <d g d'>16 ~ q8 <g d'>\! |
    r8. <g, d' g>16_\< ~ q8 <d' g> r8. <g, d' g>16 ~ q8 <d' g> |
    r8. <g, d' g>16 ~ q8 <d' g> r8. <aes d aes'>16 ~ q8 <d aes'>\! |
    r8. <g, d' g>16 ~ q8 <d' g> r8. <g, d' g>16 ~ q8 <d' g> |
    r8. <g, d' g>16 ~ q8 <d' g> r8. <d aes' d>16 ~ q8 d'\laissezVibrer |
  } >>
  \ottava 1 \once \override TupletBracket.positions = #'(7.5 . 7) \tuplet 6/4 { a''16^[ bes a \set stemRightBeamCount = 2 f] \set stemLeftBeamCount = 2 \once \override Beam.positions = #'(-2.7 . -3) d_[ bes] }
  \ottava 0 \once \override TupletBracket.positions = #'(7.5 . 7) \tuplet 6/4 { a^[ bes a \set stemRightBeamCount = 2 f] \set stemLeftBeamCount = 2 \once \override Beam.positions = #'(-2.7 . -3) d_[ bes] }
  \once \override Beam.positions = #'(1.8 . 3.2) a,32^[ c d \set stemRightBeamCount = 1 f] \set stemLeftBeamCount = 1 a_[ c d a'] <d d'>4-> |

  <g,, d' g>8[ r16 q] r8 <f c' f>-_ <g d' g>-_ q-_ <bes f' bes>-_ <g d' g>-_ |
  r2 <g d' g>8-_ q-_ <f c' f>-_ <g d' g>-_ |
  r2 <g d' g>8-_ q-_ <bes f' bes>-_ <g d' g>-_ |
  g'16 g g g g a bes bes <d, g d'>8-_ <f bes f'>16 d' <c, f c'>8-_ <a a'>-_ |

  <g d' g>8[ r16 q] r8 <f c' f> <g d' g> q <bes f' bes> <g d' g> |
  r2 <g d' g>8 q <f c' f> <g d' g> |
  r2 <g d' g>8 q <bes f' bes> <g d' g> |
  c,16-.-> d-.-> r8 d16-.-> f-.-> r8 gis'16-> fis-> e-> d-> c-.-> bes-.-> aes-.-> f-.-> |

  <g d' g>8[ r16 q] r8 <f c' f> <g d' g> q <bes f' bes> <g d' g> |
  r2 <g d' g>8 q <f c' f> <g d' g> |
  r2 <g d' g>8 q <bes f' bes> <g d' g> |
  g'16 g g g g a bes bes <d, g d'>8 <f bes f'>16 d' <c, f c'>8 <a a'> |

  <g d' g>8[ r16 q] r8 <f c' f> <g d' g> q <bes f' bes> <g d' g> |
  r2 bes,8-_ c16 bes g8-_ c16 bes |
  <g' d' g>8[ r16 q] r8 <f c' f> <g d' g>8 q <bes f' bes> <g d' g> |
  c,16 d r8 d16 f r8 gis'16 fis e d c bes aes f |

  r8. <d g d'>16 ~ q q q q r2 |
  r4 <bes' f' bes>8 q q q r4 |
  r8. <d, g d'>16 ~ q q q q r2 |
  r4 <bes' f' bes>4 r2 |

  r8. <d g d'>16 ~ q q q q r2 |
  r4 <bes' f' bes>8 q q q r4 |
  r8. <d, g d'>16 ~ q q q q r2 |
  \clef bass <d,, g>8-> q q-> q q-> q <d aes'>4->

  r2 \clef treble \tuplet 3/2 { g''16( aes \set stemRightBeamCount = 1 g } \set stemLeftBeamCount = 1 f ees d c bes aes) |
  aes8-^[ r16 aes-^] r8 aes-^ r2 |
} >>

left = << \global \relative c, {
  \clef bass
  g16_\mf g' g, g' ~ g g, g'8 g,16 g' g, g' ~ g g, g'8 |
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
  g,16-> g' g, g' ~ g g, g'8 g,16-> g' g, g' ~ g g, g'8 |
  g,16-> g' g, g' ~ g g, g'8 g,16-> g' g, bes' ~ bes g, bes'8 |
  g,16-> g' g, g' g,8-> g' g,16-> g' g, g' g,8-> g' |
  g,16-> g' g,-> g' g,-> g' g,-> g' g,16-> g' g,-> <aes aes'>-> ~ q aes-> aes'8->\laissezVibrer |
  R1

  <g d' g>8[ r16 q] r d'-. <f, f'>8-_ <g d' g>-_ q-_ <bes f' bes>16-.[ c r g] |
  <g d' g>8[ r16 q] r16 g-. f' g g,8-_ g'-_ f16 d bes-. f-. |
  <g d' g>8[ r16 q] r d'-. <f, f'>8-_ <g d' g>-_ q-_ <bes f' bes>16-.[ c r g] |
  <g d'>16[ g' r aes] aes,8-. <f f'> ees( ees'-_) f,( f'-_) |

  <g, d' g>8[ r16 q] r d' <f, f'>8 <g d' g> q <bes f' bes>16[ c r g] |
  <g d' g>8[ r16 q] r16 g f' g g,8 g' \tuplet 3/2 { d16 f \set stemRightBeamCount = 1 d } \set stemLeftBeamCount = 1 bes f |
  <g d' g>8[ r16 q] r d' <f, f'>8 <g d' g> q <bes f' bes>16[ c r g] |
  c16-.->[ d-.-> r g,] d'-.->[ f-.-> r g,] gis'-> fis-> e-> d-> c-.-> bes-.-> aes-.-> f-.-> |

  <g d' g>8[ r16 q] r d' <f, f'>8 <g d' g> q <bes f' bes>16[ c r g] |
  <g d' g>8[ r16 q] r16 g f' g g,8 g' \tuplet 3/2 { d16 f \set stemRightBeamCount = 1 d } \set stemLeftBeamCount = 1 bes f |
  <g d' g>8[ r16 q] r d' <f, f'>8 <g d' g> q <bes f' bes>16[ c r g] |
  <g d'>16[ g' r aes] aes,8 <f f'> ees ees' f, f' |

  <g, d' g>8[ r16 q] r d' <f, f'>8 <g d' g> q <bes f' bes>16[ c r g] |
  <g d' g>8[ r16 q] r16 g f' g <bes,, bes'>8-_ c'16 bes <g, g'>8-_ c'16 bes |
  <g d' g>8[ r16 q] r d' <f, f'>8 <g d' g> q <bes f' bes>16[ c r g] |
  c16[ d r g,] d'[ f r g,] gis' fis e d c bes aes f |

  <g d' g>8 q8-. r4 q8-. q-. <aes d aes'>4
  <g d' g>4 r r <aes d aes'>
  <g d' g>8 q8-. r4 q8-. q-. <aes d aes'>4
  <g d' g>4 r8 g16 g' g, g' g, g' <aes, d aes'>4

  << { \handBracket ##f -0.5 <g \parenthesize d' g>8-> <g d' g>8 } \\ g,4-> >> << <g' d'>4-> \\ { g8 g } >> <g d' g>8-> q << <aes d aes'>4-> \\ aes,4-> >>
  << <g' d' g>4-> \\ g,4-> >> << { <g' d'>4-> q-> } \\ { g8->[ g] g->[ g] } >> << <aes d aes'>4-> \\ aes,4-> >>
  << { <g' d' g>8->[ q8] } \\ g,4-> >> <g' d'>8-> q <g  d' g>8-> q << <aes d aes'>4-> \\ aes,4-> >>
  g16-> g' g,-> g' g,16-> g' g,-> g' g,16-> g' g,-> g' <aes, aes'>4->

  r2 \tuplet 3/2 { g''16( aes \set stemRightBeamCount = 1 g } \set stemLeftBeamCount = 1 f ees d c bes aes) |
  <aes ees' aes>8-^[ r16 q-^] r8 q8-^ r2 |
} >>

dynamics = {
  s1*8
  \set crescendoText = \markup \italic "cresc. poco a poco"
  \set crescendoSpanner = #'text
  \override DynamicTextSpanner.style = #'dashed-line
  s1*8\<

  s2\!
  \unset crescendoText \unset crescendoSpanner \revert DynamicTextSpanner.style
  s4\< s\!

  s1*4\f
  s1*12^\markup \italic "simile"
  s1*4\mf
  s1*4\cresc
  s2\! s2\ff
}

pedal = {
  \set Dynamics.pedalSustainStyle = #'mixed
  s1\sustainOn s2 s8. s16\sustainOff\sustainOn s4 |
  s1\sustainOff\sustainOn s1 |
  s1\sustainOff\sustainOn s2 s8. s16\sustainOff\sustainOn s4 |
  s1\sustainOff\sustainOn s2 s8. s16\sustainOff\sustainOn s4 |
  s1\sustainOff\sustainOn s2 s8. s16\sustainOff\sustainOn s4 |
  s1\sustainOff\sustainOn s1 |
  s1\sustainOff\sustainOn s2 s8. s16\sustainOff\sustainOn s4 |
  s1\sustainOff\sustainOn s2 s8. s16\sustainOff\sustainOn s4 |
  s2 s4..\sustainOff\sustainOn s16\sustainOff |

  s1*16^\markup \italic "senza Ped."

  \set Dynamics.pedalSustainStyle = #'text
  s4 s\sustainOn s\sustainOff s\sustainOn |
  s4\sustainOff s2\sustainOn s4\sustainOn |
  s4\sustainOff s\sustainOn s\sustainOff s\sustainOn |
  s4\sustainOff s2\sustainOn s4\sustainOn |
  s2\sustainOn s4 s\sustainOn |
  s2.\sustainOn s4\sustainOn |
  s2\sustainOn s4 s\sustainOn |
  s2.\sustainOn s4\sustainOn |
  s1\sustainOff
}

\score {
  <<
    \new PianoStaff <<
      \new Staff = "right" \right
      \new PianoDynamics = "dynamics" \dynamics
      \new Staff = "left" \left
      \new PianoPedal = "pedal" \pedal
    >>
  >>
  \layout {}
  \midi {}
}