\version "2.19.24"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "10分間耐久のやつ"
}

\paper {
  %page-count = 2
}

global = {
  \numericTimeSignature
  \key c \major
  \time 4/4
  \tempo \markup {
    \concat {
      \smaller \general-align #Y #DOWN \note #"4" #1
      \normal-text " = 86/94"
    }
  }

  s1*4
  \bar "||"
  \time 2/4
  s2
  \bar "||"
  \time 4/4

  s1*8

  s1*8

  s1*4

  s1*5
  \bar "|."

}

right = << \global \relative c''' {
 r8 a16^\markup \italic "non legato" a bes bes g8 fis16 fis a a g8 r |
 r8 e16 e f f d8 bes d g r |
 r8 <a, a'>16 q <bes bes'> q <g g'>8 <fis fis'>16 q <a a'> q <g g'>8 r |
 r8 <e e'>16 q <f f'> q <d d'>8 <bes bes'> r \acciaccatura { \slurUp d'16 dis } <f, e'>4 ~ \slurNeutral | q2 |

 r8 a'16 a bes bes g8 fis16 fis a a g8 r |
 r8 e16 e f f d8 bes d g r |
 r8 a16 a bes bes g8 fis16 fis a a g8 r |
 r8 e16 e f f d8 bes d c r |

 r8 a16 a bes bes g8 fis16 fis a a g8 r |
 r8 e16 e f f d8 bes d g r |
 r8 a16 a bes bes g8 fis16 fis a a g8 r |
 r8 e16 e f f d8 bes( d-.--) c r |

 r8 g'4 bes8 c-. r \acciaccatura dis16 e8. d16 | r c bes8-. r4 r2 |
 r8 g4 bes8 c-. r \acciaccatura dis16 e8. d16 | r e d8-. r4 r2 |
 r8 g,4 bes8 c-. r \acciaccatura dis16 e8. d16 | r c bes8-. r4 r << { c16 r d c } \\ { g8-.-- g-.-- } >> |
 << { r4 c16 r d c r4 c8 d } \\ { f,4-.-- f-.-- f-.-- f-.-- } >> | << { ees'2 e8 } \\ { <fis, a>8 q q q <f b> } >> r <g' g'>4-> |

 R1*4

 r8 <a, a'>16 q <bes bes'> q <g g'>8 <fis fis'>16 q <a a'> q <g g'>8 r |
 r8 <e e'>16 q <f f'> q <d d'>8 <bes bes'> <d d'> <g g'> r |
 r8 <a a'>16 q <bes bes'> q <g g'>8 <fis fis'>16 q <a a'> q <g g'>8 r |
 r8 <e e'>16 q <f f'> q <d d'>8 <bes bes'> <d d'> <g g'> r |
 r8 <e e'>16 q <f f'> q <d d'>8 <bes d bes'>->( <d f d'>-.->) <c e c'>-> r |
} >>

left = << \global \relative c {
  << <g' c>8-> \\ <c,, c'>8-> >> r r4 r4 r8 << <g'' c>8-> \\ <c,, c'>8-> >> |
  << <g'' c>8-> \\ <c,, c'>8-> >> r r4 r2 |
  << <g'' c>8-> \\ <c,, c'>8-> >> r r4 r4 r8 << <g'' c>8-> \\ <c,, c'>8-> >> |
  << <g'' c>8-> \\ <c,, c'>8-> >> r r4 r4 <bes' f' aes>4  ~ | q2 |

  c8( <g' c>-.--) g,-.-- <g' c>-.-- c,8( <g' c>16) c, g8( <bes f' g>) |
  c8( <g' c>-.--) g,-.-- <g' c>-.-- c,8( <g' c>) <bes, f'>16( g' <d bes'>8) |
  c8_\markup \italic "simile" <g' c> g, <g' c> c, <g' c>16 c, g8 <bes f' g> |
  c8 <g' c> g, <g' c> << { r <g c>-.-- f16( g bes8) } \\ { c,8( d dis e) } >> |

  << { r8 c'-.-- r c-.-- r c-.-- r c } \\ { c,8( g'-.--) g,8( g'-.--) c,8( g'16) c, g8( <bes f' g>) } >>
  << { r8 c'-.-- r c-.-- r c-.-- <bes ees>4-- } \\ { c,8( g'-.--) g,8( g'-.--) c,8( g'16) c, <bes f'>16( g' <d bes'>8) } >>
  << { r8 c' r c r c r c } \\ { c,8 g' g,8 g' c,8 g'16 c, g8 <bes f' g> } >>
  << { r8 c' r c f,16( g bes8-.--) } \\ { c,8 g' f, f' g,([ <bes f'>-.--)] } >> <c g'>8 r

  << {
   <e g c>8-. q-. q8. <d f bes>16-. r q-. r q-. q8-. q |
   <c f a>8-. q-. q8. <d f bes>16-. r q-. r q-. q8-. q |
   <e g c>8 q q8. <d f bes>16 r q r q q8 q |
   <c f a>8 q q8. <d f bes>16 r q r q q8 q |
    } \\ {
   c2 bes | a bes |
   c2 bes | a bes |
  } >>
  <c e g c>8 q q8. <d f bes>16 r q r q q8 q |
  <ees fis a c>8 q q8. <e g c>16 r q r q q8-.-- q-.-- |
  <f c' ees>4-.-- r8 c << <c' ees>4-.-- \\ <f,, f'>-.-- >> r8 c' |
  << { r8 <fis a c> q q } \\ { <fis, fis'>2 } >> <g g'>8 r r4 |

  << { r8 <g' c>-.-- r q-.-- r q-.-- r q-.-- } \\ { c,8 r g r c[ r16 c] g8( <bes f'>) } >> |
  << { r8 <g' c> r q r q <bes ees>4-- } \\ { c,8 r g r c[ r16 c] <bes f'>16( g' <d bes'>8) } >>
  << { r8 <g c> r q r q r q } \\ { c,8 r g r c[ r16 c] g8( <bes f'>) } >> |
  << { r8 <g' c> r <f c'> f16( g bes8-.--) } \\ { c,8 r f, r <g d'>([ <bes f'>-.--)] } >> <c g' c>8 r |

  <c g'>2.-> ~ q8 c16 g | c,2.-> ~ c8 g'16 c | g'2.-> <ges, ges'>16-> <f f'>-> <ees ees'>8-> |
  <c c'>->( <g'' c>-.--) g,-.-- <g' c>-.-- c,( <g' c>-.--) <bes, f'>16( g' <d bes'>8) |
  <c g' c>8-> r r4 <g d' g>8->( <bes f' bes>->-.) <c g'>-> r |

} >>

dynamics = {
  s1*4\mf s2
  s1*4
  s1*4\mp
  s1*4\mf
  s1\cresc s2. s4\f
  s1 s2\< s2\!
  s1*4\mp
  s1\mf s s s2. s4\< s1\f
}

pedal = {
  s1*4 s2

  s1*8

  s4 s8.\sustainOn s16\sustainOff s4 s8 s\sustainOn |
  s4\sustainOff s8.\sustainOn s16\sustainOff s4 s8 s\sustainOn |
  s4\sustainOff s2. s1
  s1 s2. s4^\markup \italic "senza Ped."
  s1 s2\sustainOn s2\sustainOff
  s1*4

  \set Dynamics.pedalSustainStyle = #'mixed
  s1\sustainOn s
  s2. s8\sustainOff\sustainOn s16.\sustainOff\sustainOn s32\sustainOff

  \set Dynamics.pedalSustainStyle = #'text
  s8\sustainOn s\sustainOff s2.
  s2 s8\sustainOn s\sustainOff

}

\score {
  <<
    \new PianoStaff \with {
      % instrumentName = "Piano"
      connectArpeggios = ##t
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
    \tempo 4=86
  }
}