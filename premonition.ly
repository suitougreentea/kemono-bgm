\version "2.19.59"

\include "stylesheet.ily"

cleft = \change Staff = "left"
ccenter = \change Staff = "center"
cright = \change Staff = "right"

\header {
  title = ""
  revision = "Revision 1"
  date = "2017/"
}

\paper {
}

global = {
  \key c \major
  \time 6/8
  %\omit Staff.TimeSignature
  \tempo 4. = 80
  \set Timing.measureLength = #(ly:make-moment 26 8) s8*6 \bar "!" s8*20 \break
  \set Timing.measureLength = #(ly:make-moment 30 8) s8*6 \bar "!" s8*24 \break
  \set Timing.measureLength = #(ly:make-moment 25 8) s8*6 \bar "!" s8*19 \break
  \set Timing.measureLength = #(ly:make-moment 26 8) s8*5 \bar "!" s8*6 \bar "!" s8*6 \bar "!" s8*6 \bar "!" s8*3 \break
}

right = << \global \relative {
  \clef treble
  \ottava 1
  e'''4 g8 fis e d  e8.[ c16 d8] e8.[ c16 d8] e8.[ c16 d8] e8.[ c16 d8] e8.[ c16 d8] e8.[ c16 d8] e4
  bes4 d8 c bes a  bes8.[ g16 a8] bes8.[ g16 a8] bes8.[ g16 a8] bes8.[ g16 a8] bes8.[ g16 a8] bes8.[ g16 a8] bes8.[ g16 a8] bes8.[ g16 a8] |
  e'4 g8 fis e d  e8.[ c16 d8] e8.[ c16 d8] e8.[ c16 d8] e8.[ c16 d8] e8.[ c16 d8] e8.[ c16 d8] e8 |
  bes4 d8[ c bes]  e4. \tuplet 4/3 { c8[ e d c] } fis4. \tuplet 4/3 { d8[ fis e d] } g4. \tuplet 4/3 { e8[ g fis e] } a4.
  bes4.
} >>

left = << \global \relative {
  \clef bass
  s8*6 s8*20
  s8*6 s8*15 s8 <c g' c e fis>1\arpeggio\laissezVibrer
  s8*6 s8*12 <a e' c' e g>1*7/8\arpeggio\laissezVibrer
  s8*5 s8*6 <a fis' c' fis a>1*6/8\arpeggio\laissezVibrer s8*6 s8*3
  <c' e ges bes>1\arpeggio\laissezVibrer
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