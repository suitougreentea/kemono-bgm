\version "2.19.60"

#(ly:set-option 'midi-extension "mid")

\include "stylesheet.ily"

t = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \tuplet 3/2 4 $notes #}
)

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "けものパレード"
  nickname = "（）"
  revision = "Revision 1 (Unfinished)"
  date = "2017/6/4"
}

\paper {
}

global = {
  \key d \major
  \time 4/4
  \tempo 4=100
  s1
  \time 9/8
  s8*9
  \time 2/4
  s2
  \time 4/4
  \tempo 4=128
  s1*4
  \tempo 4=155
}

right = << \global \relative {
  \clef treble
  a'8 fis' e d e a fis e | d[ e d b] a b[ b16 b] b8[ cis] | <fis, d'> <fis cis'> <g d'> <a e'> |
  <a d> cis d e ~ e d e fis ~ | fis g gis a ~ a fis e d | d4 b' a d, | b g' fis e |
  <fis, a d>1 ~ | q2. r4 |

  << {
    \t { \voiceOne e8 a b d cis b a d e g fis e | d g a d cis b } <a a'>2\arpeggio
  } \new Voice = "right1" {
    \voiceTwo <g,, b d>2 <g b d g>\arpeggio | <b e g b>\arpeggio \t { <a d>8 q q <e' b'>4 <d a'>8 ^~ }
  } >>

  << \context Voice = "right1" {
    \voiceOne \t { <d a'>4 \clef "treble_8" \once \override TextScript.X-offset = -3 a8^\markup \italic "(ottava bassa)" b4 d8 e4 d8 e4 d8 } | \oneVoice <g, b fis'>4 \t { <b d a'>4 <g d'>8 <b d> q q <d b'>4 <cis a'>8 ^~ } |
    \voiceOne \t { q4 a8 b4 d8 e4 d8 e4 d8 } | \oneVoice <fis, a fis'>4 \t { <d' a'>4 <a d>8 fis' g fis e d b }

  } \new Voice {
    \voiceTwo r4 <d, fis>4 \t { r8 <fis a>4 } q4 | s1 |
    r4 <cis e>4 \t { r8 <e a>4 } <a cis>4 | s1 |
  } >>

} >>

left = << \global \relative {
  \clef bass
  fis8 d' fis, d' g, d' g, d' | a[ e' a, d] fis g[ g16 g] b,8[ a] | fis g a cis |
  d8 fis d a' cis, fis cis a' | b, fis' b, a' a, cis a e' |
  g, d' g, d' fis, d' fis, d' | e, d' e, d' a d a e' |

  d2 d | d4 d d \t { e,8 b e, } |

  <a, a'>1 ~ | q2. \t { a''8 a, <fis, fis'> ~ } |
  \t { q4 d'8 } fis4 \t { fis,4 d'8 g a d, } | \t { <g, g'>4 g'8 } g4 \t { g,4 d'8 g, g' <a, a'> ~ }
  \t { q4 e'8 } a4 \t { a,4 e'8 cis' e a, } | <d, d'>4 \t { d8 d' d, } <cis cis'>4 \t { cis8 cis' cis, }


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