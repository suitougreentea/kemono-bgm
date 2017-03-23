\version "2.19.57"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\paper {
  %page-count = 2
  print-all-headers = ##t
}

global_a = {
  \key c \minor
  \tempo 4=65
  \partial 4 { s4 }
  s1*9 \bar "|."
}
right_a = << \global_a \relative c {
  \clef bass
  r16 a bes b |
  c8-. r \clef treble c'16[ ees r f] r g r8 r4 |
  r4. c,16 ees r c r8 r4 |
  r4 c16[ ees r f] r g r8 r4 |
  r4 c,16 ees f fis r2 |

  r4 c16[ ees r f] r g r8 r4 |
  r4. c,16 ees r c r8 r4 |
  r4 c16[ ees r f] r g r8 r g-. |
  aes8-. r g-. r <a, c ees fis>2 ~ |
  q4 <d gis>16(<ees a> <e ais> <f b>) r2
} >>
left_a = << \global_a \relative c, {
  r16 a bes b |
  c8-. r c16[ ees r f] r g r8 r4 |
  c,8-_ r r c16 ees r c r8 r4 |
  c8-_ r c16[ ees r f] r g r8 r4 |
  c,8-_ r c16 ees f fis r2 |

  c8-_ r c16[ ees r f] r g r8 r4 |
  c,8-_ r r c16 ees r c r8 r4 |
  c8-_ r c16[ ees r f] r g r8 r g8-. |
  <aes aes'>8-. r <g g'>-. r <fis fis'>2 ~ | q4 g?16( fis f ees?) r2
} >>
dynamics_a = {
  s4\mp
  s1*4 s1*4 s4 s8.\< s16\!
}
pedal_a = {
  s4
  s1*7
  s2
  \once \override Dynamics.SustainPedal.stencil =
  	#(lambda (grob) (grob-interpret-markup grob
  	(markup #:concat ( "(" #:musicglyph "pedal.Ped" "."))))
  s2\sustainOn

  s4 s8.\sustainOn
  \override Dynamics.SustainPedal.stencil =
  	#(lambda (grob) (grob-interpret-markup grob
  	(markup #:concat ( "  " #:musicglyph "pedal.*" ")" ))))
  s16\sustainOff
}

global_b = {
  \numericTimeSignature
  \key c \major
  \time 4/4
  \tempo 4 = 178
  s1*9 \bar "|."
}

right_b = << \global_b \relative c'' {
  << { fis8( g-.) dis( e-.) b( c-.) g( aes-.) } \\ { c4 g ees c } >>
  << { e'8( f-.) cis( d-.) a( bes-.) e,( f-.) } \\ { bes4 f des aes } >>
  << { fis''8 g dis e b c g aes } \\ { c4 g ees c } >>
  <bes' bes'>8( <a a'>-.) <aes aes'>-. <g g'>-. <ges ges'>( <f f'>-.) <fes fes'>-. <ees ees'>-.
  << { fis'8 g dis e b c g aes } \\ { c4 g ees c } >>
  << { e'8 f cis d a bes e, f } \\ { bes4 f des aes } >>
  << { fis''8 g dis e b c g aes } \\ { c4 g ees c } >>
  <c ees bes'>8-. r g'16( aes bes c <g a cis>8-.) <e g a cis>-. q-. q-. | <f aes bes d>8 r r4 r2 |
} >>

left_b = << \global_b \relative c {
  c8( <g' bes>-.) g,( <e' g>-.) aes,( <ees' ges>-.) ees,( <c' ees>-.) |
  bes8( <f' aes>-.) f,( <d' f>-.) des( <aes' ces>-.) aes,( <f' aes>-.) |
  c8 <g' bes> g, <e' g> aes, <ees' ges> ees, <c' ees> |
  bes8 <f' aes> b, <fis' a> c <g' bes> cis, <gis' b>
  c,8 <g' bes> g, <e' g> aes, <ees' ges> ees, <c' ees> |
  bes8 <f' aes> f, <d' f> des <aes' ces> aes, <f' aes> |
  c8 <g' bes> g, <e' g> aes, <ees' ges> ees, <c' ees> |
  <f, c' f>8-. r d'16( ees f fis <a, g'>8-.) q-. q-. q-. | <bes aes'>8 r r4 r2 |
} >>

dynamics_b = {
  s1*2\mf s1-\markup \italic "simile"
}

pedal_b = {

}

\score {
  <<
    \new PianoStaff \with {
      % instrumentName = "Piano"
      % connectArpeggios = ##t
    } <<
      \new Staff = "right" \with {
        midiInstrument = "acoustic grand"
      } \right_a
      \new Dynamics = "dynamics" \dynamics_a
      \new Staff = "left" \with {
        midiInstrument = "acoustic grand"
      } { \clef bass \left_a }
      \new Dynamics = "pedal" \pedal_a
    >>
  >>
  \header {
    title = \markup {
      \override #'(font-name . "游ゴシック体")
      "偵察するやつ"
    }
  }
  \layout {}
  \midi {}
}

\score {
  <<
    \new PianoStaff \with {
      % instrumentName = "Piano"
      % connectArpeggios = ##t
    } <<
      \new Staff = "right" \with {
        midiInstrument = "acoustic grand"
      } \right_b
      \new Dynamics = "dynamics" \dynamics_b
      \new Staff = "left" \with {
        midiInstrument = "acoustic grand"
      } { \clef bass \left_b }
      \new Dynamics = "pedal" \pedal_b
    >>
  >>
  \header {
    title = \markup {
      \override #'(font-name . "游ゴシック体")
      "早とちるやつ"
    }
  }
  \layout {}
  \midi {}
}

\header {
  tagline = \markup \fill-line \italic {
    "LilyPond - Music notation for everyone"
    \small #(string-append "Version " (lilypond-version) ", lilypond.org")
  }
}