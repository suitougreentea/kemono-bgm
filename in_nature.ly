\version "2.19.59"

\include "stylesheet.ily"

cleft = \change Staff = "left"
ccenter = \change Staff = "center"
cright = \change Staff = "right"

\header {
  title = "自然の中で"
  nickname = "（海じゃないやつ）"
  revision = "Revision 1"
  date = "2017/"
}

\paper {
}

global = {
  \tempo 4=85
  \key c \major
  s1*23 \bar "|."
}

right = << \global \relative {
  \clef treble
  << { r4 e'' f g | f4. e8 d4 c | d4 e2. } \\ { <e, g>1 | <f a> | <g b> | <f a> } >>
  << { r4 e' f g | f4. e8 d4 c | d4 f,2. | b4 g2. } \\ { <e g>1 | <f a> | <f bes> | <d g> } >>
  << { r4 e' f g | f4. e8 d4 c | d4 e2. } \\ { <e, g>1 | <f a> | <g b> | <f a> } >>
  << { r4 e' f g | f4. e8 d4 cis | d4 a2 b4 | a4 g2. } \\ { <e g>2 <g b> | <bes d> <e, a> | <f a>1 | <b, d> } >>

  r8 <a' f'> <a c> r <g e'> <g c> r <g c> | <f a d> c' <f, a d> f' <g, e'>4 g'8 r |
  r8 <a, f'> <a c> r <g e'> <g c> r <g c> | <f a d> r <a c f>16 e' f g <g, e'>4 c8 r |
  r8 <a f'> <a c> r <g e'> <g c> r <g c> | <f a d> c'16 d <a c e>8 d16 e <b d f>8 e16 f <b, d g>4 |
  <e, c'>8 g b <b' c e g>\arpeggio ~ q2\fermata |
} >>

left = << \global \relative {
  \clef bass
  c2. ~ c8 g | c1 | c2. ~ c8 g | c1 |
  c2. ~ c8 g | c1 | bes2 f4 fis | g2. d'4 |
  << { \voiceOne g1 ~ | g2. r4 | r b2 g4 | a f2 d8 \tuplet 3/2 { e16 d e ~ } } \new Voice { \voiceTwo c2. ~ c8 g | c1 | c2. ~ c8 g | c1 | } >>
  << { \voiceOne e2 r2 } \new Voice { \voiceTwo c4. g8 b2 | \oneVoice bes4. f8 a2 | d,2 e4 f | g2. d4 } >>

  <c' f a>8 <f, f'> q r <e e'> q r q | <d d'>4 <g g'> <c, c'>4 <e e'> |
  <c' f a>8 <f, f'> q r <e e'> q r q | <d d'>4 <g g'> <c, c'>2 |
  <c' f a>8 <f, f'> q r <e e'> q r q | <d d'>4 <f f'> <g g'>2 |
  <c g'>1\fermata
} >>

dynamics = {

}

pedal = {

}

\score {
  <<
    \new PianoStaff \with {
      connectArpeggios = ##t
    } <<
      \new Staff = "right" \right
      \new PianoDynamics = "dynamics" \dynamics
      \new Staff = "left" \left
      \new PianoPedal = "pedal" \pedal
    >>
  >>
  \layout {}
  \midi {}
}