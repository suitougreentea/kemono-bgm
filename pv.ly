\version "2.19.57"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "バンバン"
  nickname = "（予算が高いやつ）"
  revision = "Revision 0"
  date = "2017/5/**"
}

\paper {
}

global = {
  \key d \minor
  \time 4/4
  \tempo 4 = 144

}

right = << \global \relative {
  \clef treble
  f'16 f8 f16 f8 d f16 f8 f16 f8 d | r f d4 g8 d c4 |
  f16 f8 f16 f8 d f16 f8 f16 f8 d | r f d4 g8 a f e16 f |

  << { d'8. d16 r d d8 c8. c16 r c bes8 | a8 bes16 a ~ a16 f c8 } \\ { f4 f f f | c c } >> r8 c bes a |
  a8 bes c f r d << { g a ~ | a bes c g } \\ { d4 | c c } >> r8 d f a |
  << { d8. d16 r d d8 c8. c16 r c bes8 | a8 bes16 a ~ a16 f c8 } \\ { f4 f f f | c c } >> r8 c bes a |
  a8 bes c f r d << { g a ~ | a bes <f c'> <g e'> ~ \oneVoice q <a f'>4. } \\ { d,4 | c } >>

  a'8 r g r g8. f16 r8 d16 d | f8 d a'8. g16 r8 a g16 f8. |
} >>

left = << \global \relative {
  \clef bass
  bes,4 bes bes, bes | c' c g g | bes bes bes, bes | <c' g'> r r2 |
  <d a'>4 q <bes f'> q | <f f'> q <c' g'> q |
  <d a'>4 q << { r8 f d r | f d r f d r bes' a } \\ { bes,4 bes | f f c c' } >>
  <d a'>4 q <bes f'> q | <f f'> q <c' g'> q |
  << { r8 bes' f d bes d f bes } \\ { <bes, f'>4 bes bes bes } >> | <f f'>4 q << { r4 <a' c> } \\ <c,, c'>2 >>

  <d' a'>2 <bes f'> | <f c'> <c' g'> |
} >>

dynamics = {
}

pedal = {
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