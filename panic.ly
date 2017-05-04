\version "2.19.24"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

normalTime = {
  \time 4/4
}

compoundTime = {
  \compoundMeter #'((4 2 4))
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1 1 1 1)
  \set Timing.beamExceptions =
  #'(                         ;start of alist
     (end .                   ;entry for end of beams
      (                       ;start of alist of end points
       ((1 . 16) . (4 4 4 4 4 4 4 4 4 4 4 4))   ;rule for 1/32 beams -- end each 1/16
       ((1 . 8) . (4 4 4 4 4 4))   ;rule for 1/32 beams -- end each 1/16
      )))
}

\header {
  title = "食べないやつ"
  revision = "Revision 2"
  date = "2017/5/4"
}

\paper {
}

global = {
  \key d \major
  \tempo 4=158
  \compoundTime
  s1 s2 | s1 s2 |
  \normalTime
  s1*4

  s1*8
  \compoundTime
  s1.*8
  \normalTime
  s1*10
  \bar "|."
}

right = << \global \relative c'' {
  \clef treble
  b8 g16 a b8 cis d e fis d <g, cis e>-. <g cis>-. r4 |
  b8 g16 a b8 cis d e fis d <cis e g>-. q-. q-. r |
  << { \oneVoice b8 g16 a b8 cis \voiceOne d e fis d | e cis r cis d b r b } \\ { s2 fis( | e d) } >> |
  <eis gis cis>8-. r r gis16 cis gis8 eis cis eis |
  <ais, fis'>8-. r r4 \acciaccatura { fis'16 a c } fis8-. <a, c fis>-. q-. r |

 \ottava 1 b'8 g16 a b8 cis d e fis d | <g, e'>-. cis-. r4 \acciaccatura { cis'16 d } e8-. cis-. r4 |
  b,8 g16 a b8 cis d e fis d | <e g>-. q-. q-. r <e' g>-. q-. q-. r |
  b,8 gis16 a b8 cis d e fis d | g d b g d r a'16 b a gis |
  a8-. r a16 b a gis a8-. r a16 b c cis | d8-. \ottava 0 r r4 r2 |

  r2 \acciaccatura eis,8 fis2( d4-.) r | \acciaccatura dis8 e4.( g8 fis\prall e d c b4 d8-.) r |
  r4 \acciaccatura cis8 d2( e4 cis-.) r | \acciaccatura { d16 e } d4.( e8 f e\prall d c a4 cis8-.) r |
  r4 \acciaccatura eis8 fis2( g8 a d,4-.) r | cis8( d e g \once \override Script.avoid-slur = #'inside fis\prall e d c b4 d8-.) r |
  r4 \acciaccatura cis8 d2( e4 cis-.) r | \acciaccatura { d16 e } d4.( e8 f e\prall d c a4 cis8-.) r |

  << {
    \handBracket ##f -0.5 <d, \parenthesize d'>1^\markup \italic "m.g." | \handBracket ##f -0.7 <e \parenthesize e'> \handBracket ##f -0.7 <\parenthesize fis fis'> \handBracket ##f -0.7 \once \override ParenthesesItem.X-offset = 1 <g \parenthesize g'>2 \arpeggioBracket <a a'>8\arpeggio^\markup \italic "m.d." <g g'> <fis fis'> <e e'>
    <d d'>1 | <e e'> <fis fis'> <g g'>4. <a a'>8\arpeggio \arpeggioNormal <g g'> <fis fis'> <d d'> <cis cis'> |
     } \\ {
    <fis, d'>8_\markup \italic "m.d." q <g e'> q <a fis'> q <b g'> q | <cis a'> q <d b'> q <e cis'> q <fis d'> q |
    <fis, d'>8 q <g e'> q <a fis'> q <b g'> q | <cis a'> q <d b'> q cis' cis d d |
    \once \override ParenthesesItem.X-offset = 2 \handBracket ##t 0.5 <\parenthesize fis,, d'>8 <fis d'> \once \override ParenthesesItem.X-offset = 0.3 \handBracket ##f -0.7 <\parenthesize g e'> <g e'> <a fis'> q <b g'> q | <cis a'> q <d b'> q <e cis'> q <fis d'> q |
    <fis, d'>8 q <g e'> q <a fis'> q <b g'> q | <cis a'> q <d b'> b' cis cis s4 |
  } >>

  <d, d'>4-> r q-> r | q-> r <d f gis d'>8-> q-> <e a cis e>8-> r |
} >>

left = << \global \relative c {
  \clef bass
  g8 r a r b r d r <a e'>-. q-. r4 |
  g8 r a r b r d r <a g'>-. q-. q-. r |
  << { g'2( fis e d) } \\ { r4 g,8 r r4 fis8 r | r4 e8 r r4 d8 r } >>
  <cis cis'>8-. r r4 r2 | <fis fis'>8-. r r4 <d d'>8-. q-. q-. r |

  g'8( <b d g>-.) r q-. r q-. g[( q-.]) | g_\markup \italic "simile" <cis e g> r q r q g[ q] |
  g8 <b d g> r q r q g[ q] | g <cis e g> r q r q g[ q] |
  f( <gis b d>-.) gis( <d' f>-.) b( <d f>-.) gis,( <d' f>-.) |
  d, <g b d> g <b d g> b <d g> bes <d g> |
  a <cis e a> a <cis e a> e, <a cis e> ees <a cis e> |
  <d, fis a d>8-. r r <d fis a c d>-. q-. r q-. r |

  c8( <fis a c>-.) r q-. r q-. c[( q-.]) <g' b d>4-. q8-. r |
  c,8 <fis a c> r q r q c[ q] <g' b d>4 q8 r |
  bes,8( <d f bes>-.) r q-. f( <bes d>-.) bes( <d f>-.) <g, a cis e>4-. q8-. r |
  bes,8 <d f bes> r q f <bes d> bes <d f> <g, a cis e>4 q8 r |
  c,8 <fis a c> r q r q c[ q] <g' b d>4 q8 r |
  c,8 <fis a c> r q r q c[ q] <g' b d>4 q 8 r |
  bes,8 <d f bes> r q f <bes d> bes <d f> <g, a cis e>4 q8 r |
  bes,8 <d f bes> r q f <bes d> bes <d f> <g, a cis e>4 q8 r |
  r4 a,2_\markup \italic "m.g." a4 ~ | a a2 a4 ~ | a a2 a4 ~ | a a2 a4_\markup \italic "m.g." ~ |
  a <a, a'>2 q4 ~ | q q2 q4 ~ | q q2 q4 ~ | q q2 q4 |

  r4 << <fis'' a d>-> \\ <d, d'>-> >> r << <f' aes d>-> \\ <bes,, bes'>-> >> |
  r4 << <gis'' b d f>-> \\ <e, e'>-> >> <e e'>8-> q-> <a e'>8-> r
} >>

dynamics = {
  s4*6\mf-\markup \italic "non legato" s4*6

  s1\mp\cresc s2 s4 s8 s s1*2\mf

  s1*8

  s4*6*4\mp
  s4*6*4\mf
  \set crescendoText = \markup \italic "cresc. poco a poco"
  \set crescendoSpanner = #'text
  \override DynamicTextSpanner.style = #'dashed-line
  s1*8\<
  s1\f
}

pedal = {
  s4*6*2 s1*4

  s1*8

  s4*6*8

  \set Dynamics.pedalSustainStyle = #'mixed
  s1*4\sustainOn
  s1*3\sustainOff\sustainOn s2. s8. s16\sustainOff
  s4\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn
  s\sustainOff\sustainOn s\sustainOff\sustainOn s\sustainOff
}

globala = {
  \key d \major
  \tempo 4=158
  \compoundTime
  s1 s2 | s1 s2 |
  \normalTime
  s1*5
  \bar "|."
}

righta = << \globala \relative c' {
 b'8 g16 a b8 cis d e fis d <g, cis e>-. <g cis>-. r4 |
 b8 g16 a b8 cis d e fis d <cis e g>-. q-. q-. r |
 << { \oneVoice b8 g16 a b8 cis \voiceOne d e fis d | e cis r cis d b r b } \\ { s2 fis( | e d) } >> |
 <eis gis cis>8-. r r gis16 cis gis8 eis cis eis |
 <ais, fis'>8-. r r4 <a' cis dis a'>8->-. q->-. q->-. r r4 q8->-. q->-. q->-. r r4
} >>

lefta = << \globala \relative c {
  g8 r a r b r d r <a e'>-. q-. r4 |
  g8 r a r b r d r <a g'>-. q-. q-. r |
  << { g'2( fis e d) } \\ { r4 g,8 r r4 fis8 r | r4 e8 r r4 d8 r } >>
  <cis cis'>8-. r r4 r2 | <fis fis'>8-. r r4 <dis dis'>8->-. q->-. q->-. r r4 q8->-. q->-. q->-. r r4
} >>

dynamicsa = {
  s4*6\mf-\markup \italic "non legato" s4*6

  s1\mp\cresc s2 s4 s8 s s1*2\mf
}

pedala = {
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
  \header {
    piece = "Long ver."
  }
  \layout {}
  \midi {}
}

\score {
  <<
    \new PianoStaff <<
      \new Staff = "right" \righta
      \new PianoDynamics = "dynamics" \dynamicsa
      \new Staff = "left" \lefta
      \new PianoPedal = "pedal" \pedala
    >>
  >>
  \header {
    piece = "Short ver."
  }
  \layout {}
  \midi {}
}
