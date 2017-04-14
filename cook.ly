\version "2.19.57"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "何故かやめられないやつ"
  revision = "Revision 1"
  date = "2017/4/14"
}

\paper {
  systems-per-page = 5
  system-count = 10
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 150
  %85
  s4
  s1*4
  s1*18
  \time 6/4
  s4*6
  \bar "||"
  \time 4/4
  \tempo 4 = 85
  s1*17
  \bar "|."
}

right = << \global \relative c'' {
  \partial 4 { r8 g16 g }
  g8( a-.) ais-. b-. g4-. r8 <g b>16 q |
  q8( <a c>-.) <ais cis>-. <b d>-. <g b>4-. r8 d'16 d |
  d8( f-.) e-. d-. c( b-.) a-. aes-. |
  g8-. r d'-. r <g, b d g>4. r8 |

  r8 <g, c e>-. r q-. r q-. r q-. |
  r8 q-. r q-. r <fis b dis>4( <g c e>8-.) |

  r8 g''-. g-. a-. g-. e-. c-. g-. |
  <dis dis'>4( <e e'>8-.) r <dis dis'>4( <e e'>8-.) r |
  r8 g'-. g-. a-. g-. e-. c-. a-. |
  <ais, ais'>4( <b b'>8-.) r <ais ais'>4( <b b'>8-.) r |
  r8 b'-. b-. d-. f-. a-. r f-. |
  g-. r <e, e'>4( <c c'>8-.) r g'16( a c d |
  e8-.) r a,16( b c d e8-.) r a,16( b c e |
  d8-.) <g, d' g>-.-> r q-.-> r q-.-> r q-.-> |

  \ottava 1
  r8 <g' g'> q <a a'> <g g'> <e e'> <c c'> <g g'> |
  <dis' fis dis'>4 <e g e'>8 r <dis fis dis'>4 <e g e'>8 r |
  r8 <g g'> q <a a'> <g g'> <e e'> <c c'> <a a'> |
  <ais cis ais'>4 <b d b'>8 r <ais cis ais'>4 <b d b'>8 r |
  r <b b'> q <d d'> <f f'> <a a'> <g g'> <f f'> |
  <e e'> r <g g'>4 <c c'>8 r c16 d e c |
  d8 r c16 d e c d8 r c16 b bes a |
  g8 \ottava 0 <g, d' g> r q r q r q |
  \tuplet 3/2 { <g cis g'>8^\markup \italic "rit." r <ges c ges'> r <f b f'> r }
  \tuplet 3/2 { <e ais e'> r <ees a ees'> r <d gis d'> r }
  \tuplet 3/2 { <des g des'> r <c fis c'> r <b f' b> r }

  \key ees \major
  <bes f' bes>4-- d8-. f-. g4( f8-.) d-. | bes4( d8-.) bes-. aes4. r8 |
  bes4( d8-.) f-. g4( f8-.) g-. | aes4( g8-.) e-. f4. r8 |
  bes,4( d8-.) f-. g4( f8-.) d-. | bes4( d8-.) bes-. aes4. r8 |
  g4( b8-.) d-. e-. e-. d-. b-. | <f' b e> r <fis bes dis> r <g cis e>2 |

  r4 \ottava 1 <f'' aes>2 \tuplet 3/2 { <f aes>8-_ <e g>-_ <ees ges>-_ } |
  <d f>2 \tuplet 3/2 { <d f>8-_ <cis e>-_ <c ees>-_ } <b d>8-_ <g cis>-_ |
  <aes d> r <d f>2. | R1 |
  r4 <aes f' aes>2 \tuplet 3/2 { q8-_ <g e' g>-_ <ges ees' ges>-_ } |
  <f d' f>2 \tuplet 3/2 { q8-_ <e cis' e>-_ <ees c' ees>-_ } <d b' d>8-_ <cis g' cis>-_ |
  <d g d'>8 r <g d' g>2. | \ottava 0
  <f, b e>8 r <fis bes ees> r <g cis e>2 |
  <g cis fis>8^\markup \italic "riten." r <gis c f> r <a dis fis>2\fermata |
} >>

left = << \global \relative c {
  \partial 4 { r4 }
  R1 |
  r2 r4 r8 d16 d |
  d8( f-.) e-. d-. c( b-.) a-. aes-. |
  g8-. r d'-. r g16 g, r g g8-. g'-. |

  c,8 r g r c r g r | c r g r c r dis( e |

  c8)( <e g c>-.) g,-. q-. c( q-.) g-. q-. |
  c( q-.) g-. q-. << { \voiceTwo c8-. r dis( e } \new Voice { \voiceOne r <fis b>4( <g c>8-.) } >> \oneVoice
  c,8)(_\markup \italic "simile" <e g c>-.) g, q c q g q |
  g <d' g> d, q << { r <cis' fis>4 g'8 } \\ { g, r d' e } >>
  f8 <b d> d, q f q d q |
  e <g c e> c, <g' c> e <g c> c, q |
  d <fis c' d> a, q d q a q |
  <g' b d>-. <g, g'>-.-> r q-.-> r q-.-> r q-.-> |

  c8 <e g c> g, q c q g q |
  c q g q << { r <fis' b dis>4 <g c e>8 } \\ { c,8 r dis e } >>
  c8 <e g c> g, q c q g q |
  g <d' g> d, q << { r <cis' fis ais>4 <g' b>8 } \\ { g, r d' e } >>
  f8 <b d> d, q f q d q |
  e <g c e> c, q e q c q |
  d <fis c' d> a, q d q a q |
  <g' b d> <g, g'> r q r q r q |
  \tuplet 3/2 { <g g'>8 r <ges ges'> r <f f'> r }
  \tuplet 3/2 { <e e'> r <ees ees'> r <d d'> r }
  \tuplet 3/2 { <des des'> r <c c'> r <b b'> r }

  \key ees \major
  <bes bes'>4-- d'8-. f-. g4( f8-.) d-. | bes4( d8-.) bes-. aes4. r8 |
  bes4( d8-.) f-. g4( f8-.) g-. | aes4( g8-.) e-. f4. r8 |
  bes,4( d8-.) f-. g4( f8-.) d-. | bes4( d8-.) bes-. aes4. r8 |
  g4( b8-.) d-. e-. e-. d-. b-. | <g g'> r <gis gis'> r <a a'>2 |
  bes8 r r f( bes) r r f( | bes4 d8-.) bes-. aes4. r8 |
  bes8 r r f( bes) r r f( | aes4 g8-.) e-. f2 |
  bes8 r r f( bes) r r f( | bes4 d8-.) bes-. aes4 r |
  g4( b8-.) d-. e-. e-. d-. b-. | <g g'> r <gis gis'> r <a a'>2 |
  <a a'>8 r <ais ais'> r <b b'>2\fermata |

} >>

dynamics = {
  s4\mf
  s1*4
  s1*2\mp
  s1*8
  s1*8\mf
  s4*6\dim
  s1*7\mp s1\cresc
  s1*7\mf s1\cresc s2 s2\!
}

pedal = {
  s4
  s1*4
  s1*18
  s4*6
  s4\sustainOn s4\sustainOff s2 s1*6 s2 s2\sustainOn
  s1\sustainOff s1*6 s2 s\sustainOn s\sustainOff s4..\sustainOn s16\sustainOff
}

\score {
  <<
    \new PianoStaff \with {
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
  \layout {}
  \midi {}
}