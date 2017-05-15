\version "2.19.59"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "お家ができた！"
  nickname = "（もけ！のやつ）"
  revision = "Revision 2"
  date = "2017/5/13"
}

\paper {
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 125
  s1*47 \bar "|."
}

right = << \global \relative {
  \clef treble
  e''4. g,8 g2 | r2 g8. a16 ~ a8 b | b4. c8 ~ c4 e, | g1 |
  r2 a4 f' | e4. c8 g'8. f16 ~ f8 e | e4. d8 ~ d2 | <d, g b>4. <f a c>8 ~ q4 <g b d> |
  << { e'4. g,8 g2 | r2 g8. a16 ~ a8 b | b4. c8 ~ c4 e, | g1 } \\ { <e g>1 | <d g> | <c e> | <c e> } >>
  << { r2 a'4 f' | e2 g,4 e' | c4. c8 c4 g' | f2 ~ f8 e4 f8 } \\ { <a,, c f>1 | <e' g>2 <c e> | <d f>1 | <g c d> } >>
  <g b d g>1 |

  r4. << { \voiceOne g'8(^\markup \italic "m.g." c c,) r4 | r4. \shape #'((0.5 . 1) (0 . 1) (0 . 2) (0.5 . 2)) Slur g'8(^\markup \italic "m.d." \mergeDifferentlyDottedOn c) r r4 }
     \context Voice = "r2" { \voiceTwo <c,, f a>8 q q r <d g b> | r q r <g b> <c c'>4.( <b b'>8 }>>
  \context Voice = "r2" <g c g'>4.) << { \voiceOne g'8( c c,) r4 | r4. \shape #'((0.5 . 1) (0 . 1) (0 . 2) (0.5 . 2)) Slur g'8( c) r r4 }
     \context Voice = "r2" { \voiceTwo <c,, f a>8 q q r <d g b> | r q r <g b> <f' f'>4( <e e'> } >>
  \context Voice = "r2" <c g' c>4.) << { g'8( c c,) r4 } \\ { <c, f a>8 q q r <c d g> } >> | \oneVoice r q r q <c' c'>8( <d d'> <e e'> <f f'> |
  <e e'>4. <d d'>8 ~ q2) | <f f'>4.( <e e'>8 ~ q2) | <a a'>4.( <g g'>8 ~ q2 ~ | q1) |
  r4. <a,, c f>8 q q r <g b d g> | r q r q q2 |

  <e'' g e'>4. <g, g'>8 <g c g'>2 | r2 <g b g'>8. <a c a'>16 ~ q8 <b d b'> | q4. <c e c'>8 ~ q4 <e, e'> | <g c e g>1 |
  r2 <a c a'>4 <f' a f'> | <e g c e>4. <c c'>8 <g' c g'>8. <f f'>16 ~ q8 <e e'> | <e f bes e>4. <d d'>8 ~ q2 | <c d g c>4 <b b'> <a a'> <b b'> |

  \cleft e,8( \cright g c d e2) | \cleft d,8( \cright g a b d2) |
  \cleft d,8( \cright f bes c ~ c bes4.) | << { \cleft b,8( \cright d g a b2) } \new Voice { \stemDown \once \override Stem.cross-staff = ##t \once \override Stem.length = #15 g2.\arpeggio } >> |
  r4 <e a d>8-. r <f a c>4. <e a d>8-. | r q-. r q-. <f a c>-. r q4 |
  r4 <e a d>8-. r <f a c>4. <e a d>8-. | r q-. r q-. <f a c>-. r q4 |
  <e g c>8 r r4 c8-. fis-. g-. c-. | R1 |
} >>

left = << \global \relative {
  \clef bass
  c8( g' c d e2) | b,8( g' a b d2) | a,8( e' a b c2) | g,8( e' g b c2) |
  f,,8( c' f g a2) | e,8( c' g' c ~ c2) | bes,8( f' bes c ~ c bes4.) |
  g,4. a8 ~ a4 b |

  << { c8( g' c d e2) | b,8( g' a b d2) | a,8( e' a b c2) | g,8( e' g b c2) } \\
     { \mergeDifferentlyHeadedOn \mergeDifferentlyDottedOn c,2. g4 | b2. g4 | a2. e4 | g2. g4 } >>
  << {
    f8( c' f g a2) | e,8( b' g'4) a,8( e' c'4) | bes,8( f' bes c ~ c2) |
    g,8( d' g c ~ c2) | g,8( d' g b ~ b d4.) |
  } \\ {
    f,,2. c'4 | e,2 a | bes2. bes4 | g4. d'8 ~ d4 f, | g4. d'8 ~ d4 g |
  } >>

  << <g a c>2.\arpeggio \\ <f, c'>\arpeggio >> r8 c' | f,2. f'8 c |
  <f, c' a'>2.\arpeggio r8 c' | f,2. f'8 c |
  <f, c' a'>2.\arpeggio r8 <e c'> ~ | q2 <e c' g'>4\arpeggio <e' c'> |
  << { r8 c'( d f) r c( d f) | r c( d e) r c( d e) } \\ { <bes, f'>1 | <a e'>} >>
  << { r8 c'([ d)] <a c f> q[ q] } \\ { <g, d' g>2. } >> r8 <b' d g> | r q r q << q2 \\ { r4 f, } >> |
  g1 ~ | g2 d4 g |

  << { c8( g' c d e2) | b,8( g' a b d2) | a,8( e' a b c2) | g,8( e' g b c2) } \\
     { \mergeDifferentlyHeadedOn \mergeDifferentlyDottedOn c,2. g4 | b2. g4 | a2. e4 | g2. g4 } >>
  << { f8 c' f g a2 | e,8 c' g'4 } \\ { f,2. c'4 | e,2 } >> <a e' c'>2\arpeggio |
  <bes, bes'>8 f'' bes c ~ << { \voiceOne c8 bes4. } \new Voice { \voiceTwo r4 bes, } >> | \oneVoice
  <g g'>8 d' g a b2 |
  <c, g' e'>2.\arpeggio g4 | <b g' d'>2.\arpeggio g4 | <bes f' d'>2.\arpeggio bes4 | <g d' b'>2.\arpeggio g4 |

  << { <e' a d>4 } \\ { <c, c'>} >> c'8-. c,-. c4 g'8 <c, c'>-. | r q-. r q-. q4 g'8( a) |
  << { <e' a d>4 } \\ { <c, c'>} >> c'8-. c,-. c4 g'8 <c, c'>-. | r q-. r q-. q4 g'8( a) |
  <c, c'>8 r r4 c'8-. fis-. g-. c-. | R1 |
} >>

dynamics = {
  s1*7\mp s1\<
  s1*7\! s1*2\<
  s1*6\mf s1*2\cresc s1\f s2 s\>
  s1*2\mp
  s1\mf
}

pedal = {
  \set pedalSustainStyle = #'mixed
  s1\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn
  s1\sustainOff\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn s4.\sustainOff\sustainOn s\sustainOff\sustainOn s8.\sustainOff\sustainOn s16\sustainOff

  s1\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn
  s1\sustainOff\sustainOn s2\sustainOff\sustainOn s\sustainOff\sustainOn s1\sustainOff\sustainOn
  s4.\sustainOff\sustainOn s\sustainOff\sustainOn s4 s4.\sustainOff\sustainOn s\sustainOff\sustainOn s8.\sustainOff\sustainOn s16\sustainOff

  \set pedalSustainStyle = #'text
  s2.\sustainOn s4\sustainOff s4. s8\sustainOn s2 s2.\sustainOn s4\sustainOff s4. s8\sustainOn s2
  s2.\sustainOn s4\sustainOff s2 s\sustainOn s1\sustainOn s\sustainOn
  s2.\sustainOn s4\sustainOff s2 s\sustainOn s2.\sustainOn s4\sustainOff s2 s4 s\sustainOn

  \set pedalSustainStyle = #'mixed
  s1\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn
  s1\sustainOff\sustainOn s2\sustainOff\sustainOn s\sustainOff\sustainOn s1\sustainOff\sustainOn s2.\sustainOff\sustainOn s8. s16\sustainOff

  s1\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn s2.\sustainOff\sustainOn s8. s16\sustainOff
  \set pedalSustainStyle = #'text
  s4\sustainOn s\sustainOff s2 s2. s4\sustainOn s4\sustainOn s\sustainOff s2 s2. s4\sustainOn s1\sustainOff
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
  \layout {
    \context {
      \Voice
      \override Slur.details.free-head-distance = 1
    }
  }
  \midi {}
}
