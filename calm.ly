\version "2.19.59"

\include "stylesheet.ily"

cleft = \change Staff = "left"
ccenter = \change Staff = "center"
cright = \change Staff = "right"

\header {
  title = "凪"
  nickname = "（言われるも！のやつ）"
  revision = "Revision 1"
  date = "2017/"
}

\paper {
}

global = {
  \tempo 4=70
  \key c \major
  s4*4
  \time 5/4 s4*5
  \time 4/4 s4*4
  \time 5/4 s4*5
  \time 4/4 s4*4
  \time 5/4 s4*5
  \time 4/4 s4*4
  \time 5/4 s4*5
  \time 4/4 s4*4
  \time 2/4 s4*2

  \time 5/4 s4*5
  \time 4/4 s4*4
  \time 5/4 s4*5
  \time 4/4 s4*4
  s4*4 \bar "|."
}

right = << \global \relative {
  \clef treble
  <g'' g'>1\laissezVibrer |
  \tuplet 3/2 { g8\arpeggio bes f } g4 \tuplet 3/2 { g8 bes f } g4 \tuplet 3/2 { g8 bes f } | g1\arpeggio |
  \tuplet 3/2 { g8\arpeggio bes f } g4 \tuplet 3/2 { g8 bes f } g4 \tuplet 3/2 { g8 bes f } | g1\arpeggio |
  \tuplet 3/2 { bes8\arpeggio c g } aes4 \tuplet 3/2 { bes8 c g } aes4 \tuplet 3/2 { bes8 c g } | f1\arpeggio |
  \tuplet 3/2 { g8\arpeggio a e } f4 \tuplet 3/2 { g8 a e } f4 \tuplet 3/2 { g8 a g } | << { a1\arpeggio ~ | a2 } \\ { s1 | \magnifyMusic 0.8 { cis,,16[ e g a cis e g\laissezVibrer] } } >>

  << { \tuplet 3/2 { g8\arpeggio bes f } g4 \tuplet 3/2 { g8 bes f } g4 \tuplet 3/2 { g8 bes f } } \\ { <g, bes ees>2\arpeggio ~ q2. } >> | <g c e g>1\arpeggio |
  << { \tuplet 3/2 { g'8\arpeggio bes f } g4 \tuplet 3/2 { g8 bes f } g4 \tuplet 3/2 { g8 bes f } } \\ { <g, bes ees>2\arpeggio ~ q2. } >> | <g c e g>1\arpeggio |
  <e gis b e>1\arpeggio\fermata
} >>

left = << \global \relative {
  \clef bass
  R1 |
  <bes ees g>2\arpeggio ~ q2. | <c, c' e g>1\arpeggio |
  <bes' ees g>2\arpeggio ~ q2. | <a, c' e g>1\arpeggio |
  <aes' c ees g>2\arpeggio ~ q2. | <g, bes' d f>2\arpeggio <c g' bes e>\arpeggio |
  <f a c>2\arpeggio ~ q2. | <e, g' b d>2\arpeggio <a e' g cis>\arpeggio ~ | q2 |

  ees'8[ g bes ees] g[ ees bes g] ees4 | c8 e g c e c g e |
  ees8[ g bes ees] g[ ees bes g] ees' bes | a, e' a c e c a e |
  <a, e'>1\arpeggio\fermata
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