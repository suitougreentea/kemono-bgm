\version "2.19.24"

\header {
  title = "ジャンプ力のやつ"
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 91
}

right = \relative c'' {
  \global
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
  %\set tieWaitForNote = ##t
  q8
  \repeat tremolo 6 { aes32 <d f bes>) } \slurNeutral
  %\set tieWaitForNote = ##f
  <aes c ees aes>16->[ r <a cis e a>->] r <bes d f bes>8-> r8 \bar "|."
}

left = \relative c' {
  \global
   r2 r4 <bes d>16[ r <d f> <c e>] | r <g c> r8 r4 r4 <bes d>16[ r <d f> <c e>] | r <g c> r8 r4 r2 |
   r2 r4 <bes d>16[ r <d f> <c e>] | r <g c> r8 r4 r2 |
   r2 r4 <bes des>16[ r <des f> <bes ees>] | r <aes des> <bes ees> r r4 r2 |
   r2 r4 <bes des>16[ r <des f> <bes ees>] | r <aes des> <g ees'> r r4 r2 |
   c16[ bes r a] g[ f r ees] des[ c r bes] a r \slurUp <bes f'>8( ~ |
   %\set tieWaitForNote = ##t
   q8
   \repeat tremolo 6 { bes32 f') } \slurNeutral
   <aes, ees'>16->[ r <a e'>->] r <bes f'>8->
   \acciaccatura { \slurUp \stemUp f''16 bes, f } \stemDown <bes,, bes'>8_^
}

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
    %{\new RhythmicStaff \with {
      \override Clef.stencil = ##f
      \override KeySignature.stencil = ##f
      \override TimeSignature.stencil = ##f
    } {
      \stopStaff
      s1*10
      \startStaff
      bes8\repeatTie ~ \repeat tremolo 12 bes32 ~ \repeat tremolo 4 bes32 aes16 r a r bes8
      \stopStaff
    }%}
    \new PianoStaff \with {
      % instrumentName = "Piano"
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
    system-count = 5
  }
  \midi {
    \tempo 4=91
  }
}