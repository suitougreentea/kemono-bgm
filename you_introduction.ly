\version "2.19.83"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "ミライさんがドチャかわいいやつ"
  nickname = ""
  revision = "Revision 1"
  date = "2019/5/17"
}

\paper { 
  %system-count = 10
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 106
}

right = << \global \relative {
  \clef treble
  \partial 2 { r8 r16 g'( a-.) r c-. r } |
  <g c e>16( e'-.) r16 <g, c>-. r <g e'>-. r q <a c f>-. r <a c d>-. r <g c e>4 |
  <g b d>16( d'-.) r16 <d, bes'>-. r <d b'>-. r <d c'> <e g d'>-. r <e g c>-. r <e g c>4 |
  <g, c e>16( e'-.) r16 <g, c>-. r <g e'>-. r q <a c f>-. r <a c d>-. r <g c e>4 |
  <g b d>16( d'-.) r16 <g, bes>-. r <g b>-. r <g c> <g d'>-. r <g c>-. r <g c>8--\noBeam d'16-. e-. |
  f16-. d-. e-. f-. d-. e-. f-. d-. g-. d-. e-. f-. d8\noBeam d'16-. e-. |
  << { f16-. d-. e-. f-. d-. e-. f-. d-. } \\ { f,2 } >> <g g'>16-. d'-. e-. f-. <g, g'>-. <f f'>-. <g g'>-. <bes bes'>-. |
  <c e c'>8. <\parenthesize c, e>16~ q8 <c e> <f a c>16-. r q-. r <e g c>4 |
  <e' e'>16-. <c c'>-. r <a a'>-. r <g g'>-. r <f f'>-. <e e'>-. r <\parenthesize c c'>-. r <\parenthesize c c'>4-- \bar "|."
} >>

left = << \global \relative {
  \clef bass
  r8 g,4 r8 |
  <c g'>8 r16 q-. r c-.  e,16( c') <f, c' f>16-. r q-. r <c' g'>8( c'--->) |
  <g, d'>8 r16 q-. r g-. b16( g') <c, g'>-. r q-. r q8( c'--->) |
  <c, e>8 r16 q-. r c-. e,16( c') <f, c' f>16-. r q-. r <c' e>8( g'--->) |
  <g, d'>8 r16 q-. r g-. b16( d) <c e>-. r q-. r q4 |
  <bes f'>8. q16~ q q8 q16 <g d'>16-. r q-. r q4 |
  <bes f' bes>8. q16~ q q8 <bes f'>16 <g d' g>16-. r q-. r q4 |
  <c g' c>8. q16~ q8 \handBracket ##f -1 <e, c' \parenthesize g'> <f c' f>16-. r q-. r <c' g'>8( c'--->) |
  <g, d' g>16-. q-. r q-. r <b d g>-. r q-. <d g c>-. r <c g' c>-. r <c c'>4-- |
} >>

dynamics = {
  s2\mf |
  s1*2 |
  s1*2\mp |
  s2.. s8\< |
  s2\! s2\< |
  s1\mf
}

pedal = {
  s2 |
  s16\sustainOn \once \override SustainPedal.extra-offset = #'(1 . 0) s\sustainOff s8 s s\sustainOn s4\sustainOff s4\sustainOn
  s16\sustainOn \once \override SustainPedal.extra-offset = #'(1 . 0) s\sustainOff s8 s s\sustainOn s4\sustainOff s4\sustainOn
  s16\sustainOn \once \override SustainPedal.extra-offset = #'(1 . 0) s\sustainOff s8 s s\sustainOn s4\sustainOff s4\sustainOn
  s16\sustainOn \once \override SustainPedal.extra-offset = #'(1 . 0) s\sustainOff s8 s s\sustainOn s4\sustainOff s4\sustainOn
  s2.\sustainOff s4\sustainOn
  s2.\sustainOff s4\sustainOn
  s2\sustainOn s4\sustainOff s\sustainOn
  s2.\sustainOff s4\sustainOn
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