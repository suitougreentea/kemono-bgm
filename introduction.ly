\version "2.19.24"

\include "stylesheet.ily"

\header {
  title = "ジャンプ力のやつ"
  revision = "Revision 1"
  date = "2017/5/4"
}

\paper {
  system-count = 5
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 91
}

right = << \global \relative c'' {
  \clef treble
  <c e>16[ q r q] <e g>[ q r q] <bes d>8-.[ q-.] <d f>-. r16 <c e> |
  r q[ r q] <e g>[ q r q] <bes d>8-.[ q-.] <d f>-. r16 <c e> |
  r q[ r q] <e g>[ q r q] <bes d>8-.[ q-.] <d f>-. r |
  <c e>16[ q r q] <e g>[ q r q] <bes d>8-.[ q-.] <d f>-. r16 <c e> |
  r q[ r q] <e g>[ q r q] <bes d>8-.[ q-.] <d f>-. r |
  <bes des>16[ q r q] <des f>[ q r q] <g, ees'>8-.[ q-.] <bes des>-. r16 q |
  r q[ r q] <des f>[ q r q] <g, ees'>8-.[ q-.] <bes des>-. r |
  <bes des>16[ q r q] <des f>[ q r q] <g, ees'>8-.[ q-.] <bes des>-. r16 q |
  r q[ r q] <des f>[ q r q] <g, ees'>8-.[ q-.] <bes des>-. r |
  \acciaccatura { \stemUp \slurUp bes'16 b }
  \stemNeutral \slurNeutral <c, c'>16[ <bes bes'> r <a a'>] <g g'>[ <f f'> r <ees ees'>] <des des'>[ <c c'> r <bes bes'>] <a a'> r \slurUp <aes d f bes>8( ~
  q8
  \repeat tremolo 6 { aes32 <d f bes>) } \slurNeutral
  <aes c ees aes>16->[ r <a cis e a>->] r <bes d f bes>8-> r8 \bar "|."
} >>

left = << \global \relative c' {
  \clef bass
  r2 r4 <bes d>16[ r <d f> <c e>] | r <g c> r8 r4 r4 <bes d>16[ r <d f> <c e>] | r <g c> r8 r4 r2 |
  r2 r4 <bes d>16[ r <d f> <c e>] | r <g c> r8 r4 r2 |
  r2 r4 <bes des>16[ r <des f> <bes ees>] | r <aes des> <bes ees> r r4 r2 |
  r2 r4 <bes des>16[ r <des f> <bes ees>] | r <aes des> <g ees'> r r4 r2 |
  c16[ bes r a] g[ f r ees] des[ c r bes] a r \slurUp <bes f'>8( ~ |
  q8
  \repeat tremolo 6 { bes32 f') } \slurNeutral
  <aes, ees'>16->[ r <a e'>->] r <bes f'>8->
  \acciaccatura { \slurUp \stemUp f''16 bes, f } \stemDown <bes,, bes'>8_^
} >>

dynamics = {
  s1*10\mf
  s8 s8.\< s\! s2
}

pedal = {
  s1*9
  s2 s4 s8 s8\sustainOn
  s2 s4\sustainOff s8.\sustainOn s16\sustainOff
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