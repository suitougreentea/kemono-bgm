\version "2.19.59"

\include "stylesheet.ily"

cleft = \change Staff = "left"
ccenter = \change Staff = "center"
cright = \change Staff = "right"

\header {
  title = ""
  revision = "Revision 1"
  date = "2017/"
}

\paper {
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 120
}

right = << \global \relative {
  \clef treble
  e''4. g,8 g2 | r2 g8. a16 ~ a8 b | b4. c8 ~ c4 e, | g2. r4 |
  r2 a4 f' | e4. c8 g'8. f16 ~ f8 e | e4. d8 ~ d2 | <d, g b>4. <e a c>8 ~ q4 <f g b d> |
  e'4. g,8 g2 | r2 g8. a16 ~ a8 b | b4. c8 ~ c4 e, | g2. r4 |
  r2 a4 f' | e2 g,4 e' | c4. c8 c4 g' | f2 ~ f8 e4 f8 |
  g2. r4 |

  r4. <c,, f a>8 q q r <d g b> | r q r q c'4. b8 |
  g4. <c, f a>8 q q r <d g b> | r q r q f'4 e |
  c4. <c, f a>8 q q r <c d g> | r q r q c'8 d e f |
  e4. d8 ~ d2 | f4. e8 ~ e2 | a4. g8 ~ g2 ~ | g1 |
  r4. <a,, c f>8 q q r <b d g> | r q r q q2 |

  e'4. g,8 g2 | r2 g8. a16 ~ a8 b | b4. c8 ~ c4 e, | g2. r4 |
  r2 a4 f' | e4. c8 g'8. f16 ~ f8 e | e4. d8 ~ d2 | c4 b a b |

  r8 g c d e2 | r8 g, a b d2 | r8 f, bes c ~ c bes4. | g4 g8 a b2 |
  r4 <e, a d>8 r <f a c>4. <e a d>8 | r q r q <f a c> r q4 |
  r4 <e a d>8 r <f a c>4. <e a d>8 | r q r q <f a c> r q4 |
  r2 c8 fis g c |
} >>

left = << \global \relative {
  \clef bass
  c8 g' c d e2 | b,8 g' a b d2 | a,8 e' a b c2 | g,8 e' g b c2 |
  f,,8 c' f g a2 | e,8 c' g' r r2 | bes,8 f' bes c ~ c bes4. |
  g,4. a8 ~ a4 b |

  c8 g' c d e4 g,, | b8 g' a b d4 g,, | a8 e' a b c4 e,, | g8 e' g b c4 g, |
  f8 c' f g a4 c, | e,8 b' g'4 a,8 e' c'4 | bes,8 f' bes c ~ c4 bes, |
  g8 d' g <d c'> ~ q4 f, | g8 d' g <d b'> ~ q d' g,4
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