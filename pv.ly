\version "2.19.57"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = \markup \center-column { \jp-sans-semibold "バンバン" \normalsize "（予算が高いやつ）" }
  revision = "Revision 0"
  date = "2017/4/**"
}

\paper {
}

global = {
  \key d \minor
  \time 4/4
  \tempo 4 = 144

}

right = << \global \relative {
  f'16 f8 f16 f8 d f16 f8 f16 f8 d | r f d4 g8 d c4 |
  f16 f8 f16 f8 d f16 f8 f16 f8 d | r f d4 g8 a f e16 f |

  <f d'>8. q16 r q q8 <f c'>8. q16 r q bes8 |
  <c, a'>8 bes'16 <c, a'> ~ q16 f c8 r c bes a |
  a8 bes c f r d << { g a ~ | a bes c g } \\ { d4 | c c } >> r8 d f a |

} >>

left = << \global \relative {
  bes,4 bes bes, bes | c' c g g | bes bes bes, bes | <c' g'> r r2 |
  <d a'>4 q <bes f'> q | <f f'> q <c' g'> q |
  <d a'>4 q << { r8 f d r | f d r f d r bes' a } \\ { bes,4 bes | f f c c' } >>
} >>

dynamics = {
}

pedal = {

}

\score {
  <<
    \new PianoStaff \with {
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