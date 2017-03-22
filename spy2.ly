\version "2.19.24"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "早とちるやつ"
}

\paper {
  %page-count = 2
}

global = {
  \numericTimeSignature
  \key c \major
  \time 4/4
  \tempo 4 = 178
  s1*9 \bar "|."
}

right = << \global \relative c'' {
  << { fis8( g-.) dis( e-.) b( c-.) g( aes-.) } \\ { c4 g ees c } >>
  << { e'8( f-.) cis( d-.) a( bes-.) e,( f-.) } \\ { bes4 f des aes } >>
  << { fis''8 g dis e b c g aes } \\ { c4 g ees c } >>
  <bes' bes'>8( <a a'>-.) <aes aes'>-. <g g'>-. <ges ges'>( <f f'>-.) <fes fes'>-. <ees ees'>-.
  << { fis'8 g dis e b c g aes } \\ { c4 g ees c } >>
  << { e'8 f cis d a bes e, f } \\ { bes4 f des aes } >>
  << { fis''8 g dis e b c g aes } \\ { c4 g ees c } >>
  <c ees bes'>8-. r g'16( aes bes c <g a cis>8-.) <e g a cis>-. q-. q-. | <f aes bes d>8 r r4 r2 |
} >>

left = << \global \relative c {
  c8( <g' bes>-.) g,( <e' g>-.) aes,( <ees' ges>-.) ees,( <c' ees>-.) |
  bes8( <f' aes>-.) f,( <d' f>-.) des( <aes' ces>-.) aes,( <f' aes>-.) |
  c8 <g' bes> g, <e' g> aes, <ees' ges> ees, <c' ees> |
  bes8 <f' aes> b, <fis' a> c <g' bes> cis, <gis' b>
  c,8 <g' bes> g, <e' g> aes, <ees' ges> ees, <c' ees> |
  bes8 <f' aes> f, <d' f> des <aes' ces> aes, <f' aes> |
  c8 <g' bes> g, <e' g> aes, <ees' ges> ees, <c' ees> |
  <f, c' f>8-. r d'16( ees f fis <a, g'>8-.) q-. q-. q-. | <bes aes'>8 r r4 r2 |
} >>

dynamics = {
  s1*2\mf s1-\markup \italic "simile"
}

pedal = {

}

\score {
  <<
    \new PianoStaff \with {
      % instrumentName = "Piano"
      % connectArpeggios = ##t
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
    %\tempo 8=195
  }
}