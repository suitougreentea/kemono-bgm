\version "2.19.24"

\include "stylesheet.ily"

cleft = \change Staff = "left"
ccenter = \change Staff = "center"
cright = \change Staff = "right"

\header {
  title = "フィナーレ"
  nickname = "（最後のやつ）"
  revision = "Revision 2 (Unfinished)"
  date = "2017/5/4"
}

\paper {
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 100
  s1*20
  \bar "||"
  s1*24
  \bar "|."
}

right = << \global \relative c' {
  \clef treble
  r8 <g c e> q q <a c f> r q r | <g b d> q r <g c e> r2 |
  r8 <g c e> q q <a c f> r q r | << { r2 <c' c'>8. <b b'>16 ~ q8 <a a'> } \\ { <g, b d> q r <g c e> r2 }>>
  <g' g'>1 | r2 <a a'>8. <g g'>16 ~ q8 <e e'> |
  <d d'>4. <g g'>8 ~ q2 | r2 <c, c'>8. <d d'>16 ~ q8 <c c'> |
  <e e'>4. <a a'>8 <g g'>4. <b b'>8 | <g g'>4. q8 <c c'>8. <d d'>16 ~ q8 <e e'> |
  <f f'>2 ~ q8 <e e'> <d d'> <c c'> | q4. b'16 c <d, d'>2 |

  << {
    r2 e8(^\markup \italic "m.g." f g a | g2 c,) | r2 c8( d e f | e2 g) |
    s2 e8 f g a | c4 b16 c d8 ~ d g, \oneVoice <g c d g>4 |
    <e a d e>4. <a d e a>8 ~ q2 |
     } \\ {
    <f, g c>8\arpeggio b g c b g c b | g c b g c b g d |
    <f g c>8\arpeggio b g c b g c b | g c b g c-3 b-2 ~ \slurUp b32( c-1 d e f-1 g a b |
    <f g c>2) \slurNeutral <g, c>4 q |
    <c f a> <c f> <c d g>
  } >>

  r4 r8 a'8 \grace { <g b>16 g' ~ } <g, b g'>8. <fis a fis'>16 ~ q8 <d fis d'> | \break
  \key d \major
  <e g e'>4. <fis a fis'>8 ~ q2 ~ |
  q4 r8 a \grace { <g b>16 g' ~ } <g, b g'>8. <fis a fis'>16 ~ q8 <d fis d'> |
  <e a cis e>4. <a cis e a>8 ~ q2 ~ |
  q4 r \grace { <fis a>16 fis' ~ } <fis, a fis'>4 <a cis a'> |
  <b d b'>2 <d, g b d>4 <b' g' b>8 <a fis' a> ~ |
  q4 <g e' g> \grace { <fis a>16 fis' ~ } <fis, a fis'>4 <d fis d'> |
  <fis gis b fis'>4. <e gis e'>8 ~ q2 |
  r4 r8 a8 \grace { <g b>16 g' ~ } <g, b g'>8. <fis a fis'>16 ~ q8 <d fis d'> |

  <e g e'>4. <fis a fis'>8 ~ q2 ~ |
  q4 r8 a \grace { <g b>16 g' ~ } <g, b g'>8. <fis a fis'>16 ~ q8 <d fis d'> |
  <e a cis e>4. \grace { <b' e fis>16 b' ~ } <b, e fis b>8 ~ q4 <a cis e a>4 ~ |
  q4 r \grace { <fis a>16 fis' ~ } <fis, a fis'>4 <a cis a'> |
  <b d b'>4. <cis, a' cis>8 <d b' d>4 <b' g' b>8 <a fis' a> ~ |
  q4 r8 <cis, e cis'> <d fis d'>4 <a' cis a'>8 <g b g'> ~ |
  q4 r8 <d fis d'> <e g e'>4 <g b g'>8 <fis a fis'> ~ |
  q4 <e g e'> \grace { <d fis>16 d' ~ } <d, fis d'>4 <cis e cis'>  |
  << { <d d'>2 } \\ { d,2 } >> r2 | R1 |

  r8 <a d fis>8 q q <b d g> r q r |\break <a cis e>8 q r <a d fis> r2 |
  r8 <a d fis>8 q q <b d g> r q r | <a cis e>8 q r <a d fis> r2 |
  r4^\markup \italic "riten." \grace { cis'16 cis' ~ } <cis, cis'>4-- <d d'>-- <e e'>-- |
  <a cis a'>1\arpeggio\fermata |
} >>

center = << \global \relative c {
  \override Staff.VerticalAxisGroup.remove-first = ##t
  s1*20
  \key d \major
  r8 a'16 <cis e> ~ q a <d fis>8 <<{ \mergeDifferentlyDottedOn g8. fis16 ~ fis8 d } \\ { g a,16 <d fis> ~ q a d8 }>> |
  << { e4. fis8 a e d a  } \\ { <a e'>8 a16 cis ~ cis a <d fis>8 ~ q4 fis, } >> |
  r8 a16 <cis e> ~ q a <cis fis>8 <<{ g'8. fis16 ~ fis8 d } \\ { g a,16 <cis fis> ~ q a d8 }>> |
  << { e4. a8 cis a e a, } \\ { <a e'>8 a16 cis ~ cis a <cis fis a>8 ~ q4 fis, } >> |
  r8 b16 <d g> ~ q b <d g b>8 << { a'8 d, e g } \\ { a16 b, d8 g,4 } >>
  r8 a16 d ~ d a <d fis a>8 << { fis8 d e fis } \\ { fis16 a, d8 fis,4 } >>
  r8 gis16 <b fis'> ~ q gis <b e>8 ~ << { \voiceTwo b8 \cleft \stemUp e, fis gis } \new Voice { \voiceOne e'16 gis, b8 e4 } >> \ccenter  \oneVoice
  r8 a,16 <cis e> ~ q a <cis e a>8 << { g'8. fis16 ~ fis8 d } \\ { g8 a,16 <cis fis> ~ q16 \cleft \stemUp a,-> \ccenter \stemNeutral d'8 } >>

  r8 a16 <cis e> ~ q a <d fis>8 <<{ \mergeDifferentlyDottedOn g8. fis16 ~ fis8 d } \\ { g a,16 <d fis> ~ q a d8 }>> |
  << { e4. fis8 a e d a  } \\ { <a e'>8 a16 cis ~ cis a <d fis>8 ~ q4 fis, } >> |
  r8 a16 <cis e> ~ << { \voiceTwo q a <cis fis b>8 fis,16 cis' e8 <cis fis a>8 fis, } \new Voice { \voiceOne e'8 b' ~ b4 a } >> \oneVoice
  r8 a,16 cis ~ cis a <cis fis a>8 ~ << { \voiceTwo q4 fis, } \new Voice { \voiceOne cis''8 a e a, } >> \oneVoice
  r8 b16 <d g> ~ q[ b] <cis a' \parenthesize cis>8 << { <d g \parenthesize d'>4 <b b'>8 <d a'> } \\ { d16 b d8 e g } >> |
  r8 a,16 <d e> ~ q[ a] <cis fis a \parenthesize cis>8 << { <d a' \parenthesize d>4 <a a'>8 <b g'> } \\ { d16 a d8 e fis } >>
  r8 b,16 <d g> ~ q[ b] <d fis a \parenthesize d>8 << { <e g b \parenthesize e>4 <b b'>8 <d a'> } \\ { e16 b d8 e g } >>
  r8 a,16 \tieDown <cis e> ~ << { \voiceTwo q a e'8 <fis a>8 a, <e' g> a, } \new Voice { g'4 <fis a> <e g> } >> \oneVoice \tieNeutral
  r2 <f, bes d>8_\f <g c e> r <g bes d f> ~ |
  q2\> <g c e g>\arpeggio\! |

  R1
} >>

left = << \global \relative c {
  \clef bass
  c1 ~ | c2 ~ c8 g-. a( g-.) | <c, c'>1 ~ | q2 ~ q8 g'8 a g |
  c8 <g' c e> q q <a c f> r q r | <g b d> q r <g c e> r8 g, a g |
  c8 <g' c e> q q <a c f> r q r | <g b d g> q r <g c e> r8 g, a g |
  c8 <g' c e> q q <a c f> r q r | <g b d> q r <g c e> r8 g, a c |
  bes8 <f' bes d> q q <g bes c e> r q r | <a c f> q r <g c d g> r4 g'8( g,) |
  <f c'>1\arpeggio ~ | q | q\arpeggio ~ | q2. f8 c  |
  <f, f'>4. q8 <e e'>4. q8 | <d d'>4. q8 <g g'>4. q8 |
  << {
    r8 <a' d e>^\< q q q q q q | <a cis e> q q\! r r2
     } \\ {
    <a, a'>1 | \once \override Beam.positions = #`(-5 . -3) \repeat tremolo 16 { a,32_\< a'\! }
  } >>

  \key d \major
  <d,, d'>1 | <d' d'> | <fis, fis'> | <fis' fis'> |
  <g, g'> | <fis fis'> | <e e'> | <a a'> |
  <d, d'> | <d' d'> | <fis, fis'> | <fis' fis'> |
  <g, g'> | <fis fis'> | <e e'> | <a a'> |
  r2 <bes  bes'>8 <c c'> r q ~ | q1 |

  d'1 ~ | d2 ~ d8 a-. b( a-.) | <d, d'>1 ~ | q2 ~ q8 a'-. b( a-.) |
  <d, d'>4-- cis''-- d-- e-- | <d, a' e' fis>1\arpeggio\fermata
} >>

dynamics = {
  s1\mf s1*10 s2 s\>
  s1\mp s s s2. s4\<
  s1\mf\cresc s s\f s4. s8\ff s2
  s1*8
  s1*8
  s1*2
  s1\mf s1*3
  s2 s2\> s1\mp
}

pedal = {
  s1^\markup \italic "col Ped." s1*3
  s2\sustainOn s2\sustainOff s1
  s2\sustainOn s2\sustainOff s1
  s2\sustainOn s2\sustainOff s1
  s2\sustainOn s2\sustainOff s1

  s1\sustainOn s1 s1\sustainOn s1
  s2\sustainOn s\sustainOn s\sustainOn s4\sustainOn s\sustainOn
  s1\sustainOn s\sustainOn

  \set Dynamics.pedalSustainStyle = #'mixed
  s\sustainOn s s\sustainOff\sustainOn s
  s\sustainOff\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn
  s\sustainOff\sustainOn s s\sustainOff\sustainOn s
  s\sustainOff\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn s\sustainOff\sustainOn
  s2\sustainOff\sustainOn s8\sustainOff\sustainOn s\sustainOff s s\sustainOn s2 s\sustainOff\sustainOn

  s1\sustainOff
  \set Dynamics.pedalSustainStyle = #'text
  s s s
  s4 s\sustainOn s\sustainOn s\sustainOn s\sustainOn
}

\score {
  <<
    \new PianoStaff \with {
      connectArpeggios = ##t
    } <<
      \new Staff = "right" \right
      \new PianoDynamics = "dynamics" \dynamics
      \new Staff = "center" \center
      \new Staff = "left" \left
      \new PianoPedal = "pedal" \pedal
    >>
  >>
  \layout {
    \context {
      \Staff \RemoveEmptyStaves
    }
    \context {
      \PianoStaff \remove "Keep_alive_together_engraver"
    }
  }
  \midi {}
}