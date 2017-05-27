\version "2.19.59"

\include "stylesheet.ily"

cleft = \change Staff = "left"
ccenter = \change Staff = "center"
cright = \change Staff = "right"

\header {
  title = "けもの達のいきづかい"
  nickname = "（フェネックがすごいやつ）"
  revision = "Revision 1 (Unfinished)"
  date = "2017/"
}

\paper {
}

global = {
  \time 5/8
  \tempo 8 = 210
  \set Timing.baseMoment = #(ly:make-moment 1/16)
  \set Timing.beatStructure = #'(6 4)
  \key a \minor

}

right = << \global \relative {
  \clef treble
  <e' g c>8-_ r16 q8-_ r16 q8-_ q-_ | q8-_ r16 q8-_ r16 <e a c>8-_ <e g c>-_ |
  << { a8-_ r16 c8-_ r16 d8-_ e-_ | d8. c8-_ r16 a4 } \\ { e8 r16 <e g>8 r16 q8 q | q8 r16 q8 r16 q8 q } >>
} >>

left = << \global \relative {
  \clef bass
  a,8-_ r16 a8-_ r16 a8-_ a-_ | a8-_ r16 a8-_ r16 a8-_ a-_ |
  a8-_ r16 a8-_ r16 a8-_ a-_ | a8-_ r16 a8-_ r16 a8-_ a-_ |
} >>

dynamics = {

}

pedal = {

}

\score {
  <<
    \new PianoStaff \with {
      connectArpeggios = ##t
    } <<
      \new Staff = "right" \right
      \new PianoDynamics = "dynamics" \dynamics
      \new Staff = "left" \left
      \new PianoPedal = "pedal" \pedal
    >>
  >>
  \layout {}
  \midi {}
}