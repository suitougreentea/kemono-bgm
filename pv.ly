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
  a8 bes c f r d << { g a ~ | a bes <f c'> \oneVoice <g e'> ~ q <a f'>4. } \\ { d,4 | c } >>

  a'8 r g r g8. f16 r8 d16 d | f8 d a'8. g16 r8 a g16 f8. |
  c16 d8 c16 d8 c16 d ~ d c f8 d c16 d ~ | d d8 c16 d8 c16 d r8 a'-. g4 |
  <a c,>8 r <g bes,> r q8. <f a,>16 r8 d16 d | <f a,>8 <g bes,> <a c,>8. <c e,>16 r8 <a c,> << { g16 a8. } \\ c,4 >> |
  <c f,>16 d8 q16 d8 q16 d ~ d c <f f,>8 <d d,> c16 d ^~ |
  << { \voiceOne d16 d8 c16 d8 c } \new Voice { \voiceTwo g4 g } >> \oneVoice <c c'>8-. <a a'>-. <g g'>4

  << { <f' a>2. ~ q8 <e g> ~ | q4 <f a> <g c>8( <c, f>) q <c e> ~ | q <d f>4. ~ q2 | d4 e f c' }
     \\ { d,4 d d d | c c c c | a a a a | g g c c } >>
} >>

left = << \global \relative {
  \clef bass
  bes,4 bes bes, bes | c' c g g | bes bes bes, bes | <c' g'> r r2 |
  <d a'>4 q <bes f'> q | <f f'> q <c' g'> q |
  <d a'>4 q << { r8 f d r | f d r f d r bes' a } \\ { bes,4 bes | f f c c' } >>
  <d a'>4 q <bes f'> q | <f f'> q <c' g'> q |
  << { r8 bes' f d bes d f bes } \\ { <bes, f'>4 bes bes bes } >> | <f f'>4 q << { r4 <a' c> } \\ <c,, c'>2 >>

  << { a''2 f | c g' } \\ { d4 d bes bes | f f c' c } >>
  << { a8 d a d f, bes f bes | c f c f r <g c>-. q4 } \\ { <d, a'>4 q <bes f'> q <f' c'> q c' r8 c } >>
  << { a'2 f | c g' } \\ { d4 d bes bes | f f c' c } >>
  << { f,8 bes f bes f bes f bes | g c g c } \\ { <bes, f'>4 q q q | <c g'> q } >><c g' c>8-. <c' g'>-. c16 c, r c

  <bes bes'>4 <bes' f' bes> q q | <c g' c> q q q | <d a' d> q q q | <c g' c> q q q |
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