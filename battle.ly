\version "2.19.24"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "へしが無いやつ"
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

  <g, d' g>8. q16 r8 <f c' f>-_ <g d' g>-_ q-_ <bes f' bes>-_ <g d' g>-_ |
  r2 <g d' g>8-_ q-_ <f c' f>-_ <g d' g>-_ |
  r2 <g d' g>8-_ q-_ <bes f' bes>-_ <g d' g>-_ |
  g'16 g g g g a bes bes <d, g d'>8-_ <f bes f'>16 d' <c, f c'>8-_ <a a'>-_ |

  <g d' g>8. q16 r8 <f c' f> <g d' g> q <bes f' bes> <g d' g> |
  r2 <g d' g>8 q <f c' f> <g d' g> |
  r2 <g d' g>8 q <bes f' bes> <g d' g> |
  r2 gis'16 fis e d c-. bes-. aes-. f-. |
} >>

left = << \global \relative c, {
  \clef bass
  \set Score.skipTypesetting = ##t
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

  \set Score.skipTypesetting = ##f
  <g d' g>8. q16 r d'-. <f, f'>8 <g d' g>-_ q-_ <bes f' bes>16-.[ c r g] |
  <g d' g>8. q16 r16 g-. f' g g,8-_ g'-_ f16 d bes-. f-. |
  <g d' g>8. q16 r d'-. <f, f'>8 <g d' g>-_ q-_ <bes f' bes>16-.[ c r g] |
  <g d'>16[ g' r <d aes'>] aes8-. f ees( ees'-_) f,( f'-_) |

  <g, d' g>8. q16 r d' <f, f'>8 <g d' g> q <bes f' bes>16[ c r g] |
  <g d' g>8. q16 r16 g f' g g,8 g' \tuplet 3/2 { d16 f d } bes f |
  <g d' g>8. q16 r d' <f, f'>8 <g d' g> q <bes f' bes>16[ c r g] |
  c16[ d r g,] d'[ f r g,] gis' fis e d c-. bes-. aes-. f-. |


} >>

dynamics = {
}

pedal = {

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