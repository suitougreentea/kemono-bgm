\version "2.19.24"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "しゃべったー！のやつ"
  revision = "Revision 2 (Unfinished)"
  date = "2017/5/13"
}

\paper {
  page-count = 2
}

global = {
  \key g \major
  \time 4/4
  \tempo 4 = 120

  \partial 2 s2
  s1*24

  \bar "||"
  \time 7/4
  s4*7*3

  \time 4/4
  s1*2

  \time 7/4
  s4*7*2

  \time 4/4
  s1*5

  \bar "||"
  s1*7
  \time 2/4
  s2

  \time 4/4
  s1*8
  s2 \bar "|."
}

right = << \global \relative c' {
  \clef treble
  \partial 2 { <d a'>8-. <d d'>16 q <g b>4-. } |
  r4 ais8( b-.--) c( cis-.--) d4-.-- | r4 ais8( b-.--) g4-.-- r |
  R1*2 |
  r4 ais8 b c cis d4 | r4 ais8 b g4 r |
  R1*2 |
  r4 ais8 b c cis d4 | r4 f8 d <g, e'>4 r |
  r4 d'8( cis-.--) c-.-- b-.-- a4-.-- | r4 << { ais8( b-.--) } \\ { <d, fis>4 } >> <b d g>4-.-- r |

  R1*4 |

  r4 <ais' ais'>8 <b b'> <c c'> <cis cis'> <d d'>4 | r4 <ais ais'>8 <b b'> <g g'>4 r |
  r4 <ais ais'>8 <b b'> <c c'> <cis cis'> <d d'>4 | r4 <ais ais'>8 <b b'> <g g'>4 r |
  r4 <ais ais'>8 <b b'> <c c'> <cis cis'> <d d'>4 | r4 << { b'4 } \\ { <f f'>8 <d d'>  } >> <e c' e>4 r |
  r4 <ees ees'>8 <d d'> <c c'> <bes bes'> <aes aes'>4 | r4 << { d4 } \\ { <ais ais'>8 <b b'> } >> <g b g'>4 r |

  \key a \major
  << { \voiceOne r4 a8-.-- a-.-- r a-.-- r a-.-- b8-.-- r d4( } \new Voice { \voiceTwo cis,8-.-- cis-.-- r cis-.-- cis-.-- cis-.-- r cis-.-- cis-.-- cis-.-- r cis-.-- } >> \oneVoice <cis fis ais cis>4-.--)
  << { r4 a'8 a r a r a b4( a8-.--) g-.-- } \\ { cis,8 cis r cis cis cis r cis cis cis r cis } >> <ais cis fis>4
  << { \voiceOne r4 a'8 a r a r a b r d4( } \new Voice { \voiceTwo cis,8 cis r cis cis cis r cis cis cis r cis } >> <cis fis ais cis>4)
  << { r4 cis'8 cis r cis r cis } \\ { eis,8 eis r eis eis eis r eis } >> \oneVoice \acciaccatura e'8 <a, c f>4( <eis gis cis>-.--) \acciaccatura e'8 <a, c f>4( <eis gis cis>--) |

  r4 <a a'>8-.-- q-.-- r q-.-- r q-.-- <b b'>4( <d d'>8)-.-- r <cis fis ais cis>4--
  r4 <a a'>8 q r q r q <b b'>4( <a a'>8)-.-- <g g'>-.-- <fis ais cis fis>4-- |
  r4 <a a'>8 q r q r q <b b'>4( <d d'>8)-.-- r <cis cis'>4( <a a'>8-.--) r | <b d b'>2. r4 |
  r8 <e, gis>8-.-- r <fis a>-.-- <fisis ais>-.-- <gis b>-.-- r <a cis>-.-- | <b d>4( <c e>8-.--) <cis eis>-.-- \voiceOne <d fis>4 r |

  \key g \major
  \oneVoice r4 ais8 b c cis d4 | r ais8 b g4 r |
  r4 ais8 b c cis d4 | r ais8 b g4 r |
  r4 ais8 b c cis d4 | r << { f8 d } \\ { <gis, b>4 } >> <a c e>4 r |
  r4 ees'8 d c bes aes4 | r << { ais8 b } \\ { <d, fis>4 } >> |

  <b d g>8\noBeam <d g b> r q <c f a> q r q | <d g b> q r q <c f a>4-.-- <dis' e>4-> |
  <d, g b>8 <d g b> r q <c f a> q r q | <d g b> q r q <eis gis cis>4-.-- <d ees>-> |
  <d g b>8 <d g b> r q <c f a> q r q | <d g b> q r q <c f a>4-.-- \acciaccatura { e'16 f } fis4-.->
  <d, g b>8 <d g b> r q <c f a> q r q | <d g b>4-.-- r <b g' b>8-.-- <c fis? bes c>-.-- <cis f a cis>-.-- <d e gis d'>-.-- | <ees g bes ees>4-- r
           }
>>

left = << \global \relative c {
  \clef bass
  \partial 2 { r2 }
  << <d g b>4-.-- \\ g,4-.-- >> r d-.-- <d' g b>-.-- |
  << <d g b>4-.-- \\ g,4-.-- >> r d-.-- <d' fis a d>( |
  << { \voiceOne <d g b>4-.--) \oneVoice r4 \voiceOne r8 <d g b> q4-.-- } \new Voice { \voiceTwo g,4-.-- s4 d-.-- r } >>
  << <d' g b>4-.-- \\ g,4-.-- >> \oneVoice r d-.-- <d' fis a d>( |
  << { \voiceOne <d g b>4) } \new Voice { \voiceTwo g,4 } >> \oneVoice r d <d' g b> |
  << <d g b>4 \\ g,4 >> r d <d' fis a d> |
  << <d g b>4 \\ g,4 >> r << { r8 <d' g b> q4 } \\ { d,4 r } >>
  << <d' g b>4 \\ g,4 >> r d <d' fis a d> |
  << <d g b>4 \\ g,4 >> r d <d' g b> |
  << <d g b>4 \\ g,4 >> r <c, c'> r |
  << <fis' a d>4 \\ d,4 >> r a <fis'' a d> |
  << <fis a d>4 \\ d,4 >> d g8( fis)-.-- e-.-- d-.-- |

  << <d' g b>4 \\ g,4 >> r << { r8 <d' g b> q4 } \\ { d,4 r } >>
  << <d' g b>4 \\ g,4 >> r d <d' fis a d> |
  << <d g b>4 \\ g,4 >> r << { r8 <d' g b> q4 } \\ { d,4 r } >>
  << <d' g b>4 \\ g,4 >> r d <d' fis a d> |

  << <d g b>4 \\ g,4 >> r d <d' g b> |
  << <d g b>4 \\ g,4 >> r d <d' fis a d> |
  << <d g b>4 \\ g,4 >> r d <d' g b> |
  << <d g b>4 \\ g,4 >> r d <d' g b>-.-- |
  << <c f a>4 \\ f,4 >> r c <c' f a> |
  << <e gis b>4 \\ e,4 >> r <a e'> r |
  << <aes' c ees>4 \\ aes,4 >> r ees <aes' c ees> |
  << <a c e>4-.-- \\ a,4-.-- >> <d fis a d>( <g, g'>8) d'-.-- g,-.-- gis-.-- |

  \key a \major
  << { <e' a>8-.-- q-.-- } \\ { a,4 } >> r8 e << { <e' a>8-.-- q-.-- } \\ { a,4 } >> r8 e << { <e' a>8-.-- q-.-- } \\ { a,4 } >> r8 e <fis cis' fis>4-.-- |
  << { <e' a>8 q } \\ { a,4 } >> r8 e << { <e' a>8 q } \\ { a,4 } >> r8 e << { <e' a>8 q } \\ { a,4 } >> r8 e <fis cis' fis>4 |
  << { <e' a>8 q } \\ { a,4 } >> r8 e << { <e' a>8 q } \\ { a,4 } >> r8 e << { <e' a>8 q } \\ { a,4 } >> r8 e <fis cis' fis>4 |
  << { <gis' cis>8-.--[ q-.--] } \\ { cis,4 } >> r8 gis << { <gis' cis>8-.-- q-.-- r q-.-- } \\ { cis,4 cis8 dis } >> |
  <f c' f>4( <cis gis' cis>-.--) <f c' f>4( <cis gis' cis>--)

  <a a'>8( <a' cis e>-.--) r <e a cis e>-.-- a,8( <a' cis e>-.--) r <e a cis e>-.-- a,8( <a' cis e>-.--) r <e a cis e>-.-- <fis, cis' fis>4-- |
  <a a'>8 <a' cis e> r <e a cis e> a,8 <a' cis e> r <e a cis e> a,8 <a' cis e> r <e a cis e> <fis, cis' fis>4-- |
  <a a'>8 <a' cis e> r <e a cis e> a,8 <a' cis e> r <e a cis e> |
  a,8 <a' cis e> r <e a cis e> <fis, fis'>8 <fis' a cis> r <cis fis a cis> |
  b( <fis' a d>)-.-- r fis,-.-- b( <cis fis a>)-.-- d-.-- dis-.-- |
  << <gis b e>8-.-- \\ e-.-- >> <e gis>-.-- r <fis a>-.-- <fisis ais>-.-- <gis b>-.-- r <a cis>-.-- | <b d>4( <c e>8-.--) <cis eis>-.-- \cright \voiceTwo <d a'>8-. <d d'>16 q <g b>4-.

  \cleft \oneVoice
  \key g \major
  << <d, g b>4 \\ g,4 >> r d <d' g b> |
  << <d g b>4 \\ g,4 >> r d <d' fis a d> |
  << <d g b>4 \\ g,4 >> r d <d' g b> |
  << <d g b>4 \\ g,4 >> r d <d' g b>-.-- |
  << <c f a>4 \\ f,4 >> r c <c' f a> |
  << <e gis b>4 \\ e,4 >> r <a e'> r |
  << <aes' c ees>4 \\ aes,4 >> r ees <aes' c ees> |
  << <a c e>4-.-- \\ a,4-.-- >> <d fis a> |

  << { g8 g r g f f r f | g g r g } \\ { g,4 d' f, c' | g d' } >> <f, f'>4-.-- r |
  << { g'8 g r g f f r f | g g r g } \\ { g,4 d' f, c' | g d' } >> <cis, cis'>4-.-- r |
  << { g''8 g r g f f r f | g g r g } \\ { g,4 d' f, c' | g d' } >> <f, f'>4-.-- r |
  << { g'8 g r g f f r f } \\ { g,4 d' f, c' } >> <g g'>4-.-- r <g g'>8-.-- <fis fis'>-.-- <f f'>-.-- <e e'>-.-- | <ees ees'>4-- r
          }
>>

dynamics = {
  \partial 2 s2\mf
  s1*4
  s1^\markup \italic "simile" s1*7
  s1*4
  s1*8

  s4*7-\offset X-offset -3 \mf s4*7*2
  s1 s1\<
  s4*7\mf s4*7
  s1 s s-\offset Y-offset -2 \< s8\f s\mp-\offset Y-offset -3 \< s2. s2 s2\!
  s1-\offset Y-offset -2 \mf s1*6 s2
  s1\mf s1*6 s2 s2\< s2\!
}

pedal = {
  \partial 2 s2
  s1 s2. s4\sustainOn
  s1\sustainOff s2. s4\sustainOn
  s1*12\sustainOff
  s1*7
  s4 s\sustainOn s\sustainOff s
  s1 s4
    \once \override Dynamics.SustainPedal.stencil =
  	#(lambda (grob) (grob-interpret-markup grob
  	(markup #:concat ( "(" #:musicglyph "pedal.Ped" "."))))
  s\sustainOn
    \once \override Dynamics.SustainPedal.stencil =
  	#(lambda (grob) (grob-interpret-markup grob
  	(markup #:concat ( "  " #:musicglyph "pedal.*" ")" ))))
  s\sustainOff

  s4*7*2
  s1 s4\sustainOn s\sustainOff s\sustainOn s\sustainOn
  s8\sustainOn s\sustainOff s4 s8\sustainOn s\sustainOff s4 s8\sustainOn s s\sustainOff s s4
  s4*7
  s1 s4\sustainOn s\sustainOff s\sustainOn s\sustainOff
  s8\sustainOn s\sustainOff s2.
  s1*2
  s1*7
  s4 s\sustainOn
  s4\sustainOn s\sustainOn s\sustainOn s\sustainOn s\sustainOn s\sustainOn s\sustainOff s\sustainOn
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