\version "2.19.24"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

av = #(define-music-function
  (parser location pos) (number?)
  #{
    \once \override Rest.staff-position = #pos
  #}
)

\header {
  title = "ハァハァしないやつ"
  revision = "Revision 1"
  date = "2017/4/14"
}

\paper {
}

global = {
  \key g \major
  \time 4/4
  \tempo 4 = 88
  \partial 2 { s2 }
  s1*8
  s1*8
  s1*8
  \bar "||"
  \time 2/4
  s2
  \bar "||"
  \time 4/4
  s1*8
  s2 \bar "|."
}

right = << \global \relative c'' {
  r8. b16 c8-.-- cis-.--
  << {
    d16[ d r d] r d[ r \acciaccatura cis8 d16] r8 c-.-- b-.-- g-.-- | a8[ \av 3 r16 b] r4 r2 |
    d16[ d r d] r d[ r \acciaccatura cis8 d16] r8 c b g | a8[ r16 g] r4 r2 |
    d'16[ d r d] r d[ r \acciaccatura cis8 d16] r8 c b g | a8[ \av 3 r16 b] r4 r8 c-.-- b16[ a r a] |
    r2 r8 c-.-- b16[ a \av 1 r g] | r2
     } \\ {
    \magnifyMusic 0.8 {
      <g b>8_\markup { \italic \fontsize #1 "(sotto voce)" } r r8. q16 r2 | <c, e>8 r r8. <d fis>16 r2 |
      <g b>8 r r8. q16 r2 | <c, e>8 r r8. <d fis>16 r2 |
      <g b>8 r r8. q16 r2 | <c, e>8 r r8. <d fis>16 r2 |
      <c e>8 r r8. <d fis>16 r2 | <g, b d>8 r r4
    }
  } >>
  r8. b'16 c8 cis |

  << {
    \voiceOne
    d16[ d \av 3 r d] r d[ \av 4 r \acciaccatura cis8 d16] r8 c b g | a8[ \av 3 r16 b] r8 \magnifyMusic 0.8 { g'16( a ~ a8 b-.) } r4 |
    d,16[ d \av 3 r d] r d[ \av 4 r \acciaccatura cis8 d16] r8 c b g | a8[ \av 2 r16 g] r8 \magnifyMusic 0.8 { g'16 a ~ a8 g } r4 |
    d16[ d \av 3 r d] r d[ \av 4 r \acciaccatura cis8 d16] r8 c b g | a8[ \av 3 r16 b] r8 \magnifyMusic 0.8 { g'16 a ~ a8 } << \magnifyMusic 0.8 b8 \new Voice { \voiceThree c, } >> b16[ a \av 1 r a] |
    r8 c b16[ a r a] r8 c b16[ a \av 1 r g] | r4
     } \new Voice {
    \voiceTwo
    \magnifyMusic 0.8 {
      r8 <d g>-.-- r q-.-- r q-.-- r q-.-- | r <c e>-.-- r4 r r16 <d fis>8.-- |
      r8 <d g> r q r q r q | r <c e> r4 r r16 <d fis>8.
      r8 <d g> r q r q r q | r <c e> r4 r r8 <b d>-.-- |
      <c e>8 r r8. <d fis>16 r2 | <g, b d>8 r
    }
  } >> \oneVoice
  <c e a>4 <cis e ais> <d g b> |

  r4 bes''( a\prall g | fis?2. g4 | \acciaccatura a8 bes8. g16) r4 r2 | \ottava 1 \magnifyMusic 0.8 { \acciaccatura a'8 bes8.( g16) } \ottava 0 r4 r2 |
  r4 <bes,, bes'>( \grace { a16 a' ~ } <a, a'>4 <g g'> | <fis? fis'?>2. <g g'>4) |
  \acciaccatura gis'8 <a, cis a'>8. e'16 r4 \acciaccatura dis'8 <cis, g' cis>8.( a'16) r <cis, cis'> <e e'>8 |
  <d fis d'>2. r4 |

  r8. <b b'>16 <c c'>8 <cis cis'> |
  <d d'>16[ q r q] r q[ r \acciaccatura cis'16 q] r8 <c, c'>8 <b b'> <g g'> |
  <a a'>8[ r16 <b b'>] r8 \magnifyMusic 0.8 { g'16 a ~ a8 b } r4 |
  <d, d'>16[ q r q] r q[ r \acciaccatura cis'16 q] r8 <c, c'>8 <b b'> <g g'> |
  <a a'>8[ r16 <g g'>] r8 \magnifyMusic 0.8 { g'16 a ~ a8 g } r4 |
  <d d'>16[ q r q] r q[ r \acciaccatura cis'16 q] r8 <c, c'>8 <b b'> <g g'> |
  <a a'>8[ r16 <b b'>] r8 \magnifyMusic 0.8 { g'16 a ~ a8 \noBeam } \acciaccatura b8 <c, c'> <b b'>16[ <a a'> r q] |
  r8 <c c'> <b b'>16[ <a a'> r q] r8 <c c'> <b b'>16[ <a a'> r <g g'>] |
  r4 b,8( d-.) \acciaccatura dis e( g-.) \acciaccatura ais b( d-.) | g,-> r r4

} >>

left = << \global \relative c {
  r2 |
  g8 r <d' g b>8 r16 b16 r8 b( <d g b>-.--) g,-.-- | c8 r <e g c> r16 d r8 d( <fis a d>-.--) a,-.-- |
  g8 r <d' g b>8 r16 b16 r8 b <d g b> g, | c8 r <e g c> r16 d << { r4 <fis a d>8-.-- r } \\ { r8 c-.-- b-.-- a-.-- } >> |
  g8 r <d' g b>8 r16 b16 r8 b <d g b> g, | c8 r <e g c> r16 d r8 d <fis a d> g, |
  a8 r <e' g c> r16 d << { r4 <fis a d>8 r } \\ { r8 c b a } >> | g8 r g r16 d r8 d' r8 d, |

  g8 r <d' g b>8 r16 b16 r8 b <d g b> g, | c8 r <e g c> r16 d r8 d <fis a d> a, |
  g8 r <d' g b>8 r16 b16 r8 b <d g b> g, | c8 r <e g c> r16 d << { r4 <fis a>8 r } \\ { r8 c b a } >> |
  g8 r <d' g b>8 r16 b16 r8 b <d g b> g, | c8 r <e g c> r16 d r8 d <fis a d> g, |
  a8 r <e' g c> r16 d << { r4 <fis a d>8 r } \\ { r8 c b a } >> | g8 r a4 ais b8 g |

  << { <g' c>8-.-- q-.-- <f bes>-.-- q16 <g c> } \\ { c,8-.-- c-.-- bes8. c16 } >> r q[ r q] <f bes>8-.-- q-.-- |
  <g c>8 q <f bes> q16 <g c> r q[ r q] << { <f bes>8-.-- <d g>-.-- } \\ { r8 g,-.-- } >> |
  << { <g' c>8 q <f bes> q16 <g c> } \\ { c,8 c bes8. c16 } >> r q[ r q] <f bes>8 q |
  <g c>8 q <f bes> q16 <g c> r q[ r q] << { <f bes>16( <g c> <bes d>8) } \\ { bes,16( c d8) } >> |
  << { <g c>8 q <f bes> q16 <g c> } \\ { c,8 c bes8. c16 } >> r q[ r q] <f bes>8 q |
  <g c>8 q <f bes> q16 <g c> r q[ r q] << { <f bes>8 <d g> } \\ { r8 g, } >> |
  << { <e' a>8 a e e16 a r a[ r a] cis8( e) } \\ { a,,8 a a8. a16 r a[ r a] cis8( e) } >>
  <d a' d>16[ <c c'> r <b b'>] r <a a'>[ r <gis gis'>] <a a'>8( <d d'>16-.) r <d, d'>4

  r2 |
  g8 r <d' g b>8 r16 b16 r8 b <d g b> g, | c8 r <e g c> r16 d r8 d <fis a d> a, |
  g8 r <d' g b>8 r16 b16 r8 b <d g b> g, | c8 r <e g c> r16 d << { r4 <fis a d>8 r } \\ { r8 c b a } >> |
  g8 r <d' g b>8 r16 b16 r8 b <d g b> g, | c8 r <e g c> r16 d r8 d <fis a d> g, |
  a8 r <e' g c> r16 d << { r4 <fis a>8 r } \\ { r8 c b a } >> | <g d' g>8 r16 g b8( d-.) \acciaccatura dis e( g-.) \acciaccatura ais b( d-.)
  <g,, d' g>8-> r r4
} >>

dynamics = {
  s2\mf
  s1*2
  s1*6-\markup \italic "simile"
  s1*8

  s1*3\mp s2. s4\<
  s1*2\mf s1\< s\f
  s2-\markup { \italic "meno" \dynamic "f" }
}

pedal = {
  s2
  s1*8
  s1*7
  s4 s\sustainOn s\sustainOn s\sustainOff

  s1*4
  s1*2
  s2 s4 s8\sustainOn s\sustainOn
  s2\sustainOff s8\sustainOn s\sustainOff
}

\score {
  <<
    \new PianoStaff <<
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