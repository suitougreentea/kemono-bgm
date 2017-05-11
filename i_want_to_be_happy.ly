\version "2.19.59"

#(set-global-staff-size 17.82)

\include "stylesheet.ily"

cll = \change Staff = "ll"
clr = \change Staff = "lr"
crl = \change Staff = "rl"
crr = \change Staff = "rr"

albs = #(define-music-function
  (parser location start end) (number? number?)
  #{
   \shape #`(((0 . ,start) (0 . ,start) (0 . 0) (0 . 0)) ((0 . 0) (0 . 0) (0 . ,end) (0 . ,end))) Slur
  #}
)

ac = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \acciaccatura $notes #}
)

t = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \tuplet 3/2 $notes #}
)

v = #(define-music-function
  (parser location name notes) (string? ly:music?)
  #{ \context Voice=$name $notes #}
)

vd = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \new Voice $notes #}
)

re = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \relative $notes #}
)

vi = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \voiceOne { $notes } \oneVoice #}
)
vii = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \voiceTwo { $notes } \oneVoice #}
)
viii = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \voiceThree { $notes } \oneVoice #}
)
viiii = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \voiceFour { $notes } \oneVoice #}
)

\header {
  title = "I Want to be Happy"
  composer = \markup \override #'(baseline-skip . 2.5) \right-column { "Original song by Vincent Youmans" "Performed by Edward Johnson" }
  revision = "Revision 0"
  date = "2017/5/4"
}

\paper {
  % page-count = 11
  % system-count = 33
  max-systems-per-page = 3
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 158


}

rr = << \global \relative {
  \clef treble
  r4 \t { <e'' a>8-. <d g>-. <c e>-. } b8-. r \ac <c e g>8 b8-. r |
  r4 \ac fis'8 <c f g>8-. r r4 \ac { cis'16 d } <f, g>8-. r |
  r4 \t { <e a>8-. <d g>-. <c e>-. } b8-. r \ac <c e g>8 b8-. r |
  r4 \ac fis'8 <c f g>8-. r r4 \ac { cis'16 d } <f, g>8-. r |

  << \vi { c8.( d16 e8. f16 g4) g | g g g2 | c,8.( d16 e8. f16 g4) g | g g g2 | }
     \vd \vii \re {
       r4 c''8-. r r4 <b c>8-. r | r4 \grace a8 <a c>8-. r r4 <b d>8-. r  |
       r4 c8-. r r4 \ac c8 b8-. r | r4 <a c>8-. r \t { r8 e'-. cis-. } d-. r
  } >>

} >>

rl = << \global \relative {
  \clef treble
  r4 <e' g>8-. r r4 <c e g>8-. r | r4 <c f g>8-. r r4 \t { <d f g>8-. a'-. b-. } |
  r4 <e, g>8-. r r4 <c e g>8-. r | r4 <c f g>8-. r r4 \t { <d f g>8-. a'-. b-. } |

  << { \vi { c,8.( d16 e8. f16 g4) g | g g g2 | c,8.( d16 e8. f16 g4) g } g g g2 | }
     \vd \vii \re { r2 r4 e'8-. r | r4 f8-. r r4 \ac e8 f8-. r | r2 r4 <c e>8-. r } >>
} >>

rd = {

}

lr = << \global \relative {
  \clef bass
  c'2( b | a b) | <c, c'>( <b b'> | <a a'> <b b'>) |

  e2( b' | a4 c b4 ~ b8.) \noBeam b,16( | c8. d16 e8. f16 g4 ~ g8. gis16 | a4 f' \t { e4 g,8 } d'4) |
} >>

ll = << \global \relative {
  \clef bass
  c,8-. r r4 g8-. r r4 | d'8-. r r4 g,8-. r r4 | c8-. r r4 g8-. r r4 | d'8-. r r4 g,8-. r r4 |

  <c g'>8-. r <g'' c>-. r g,-. r g'-. r | d8-. r r4 g,8-. r \ac cis'8 <g d'>8-. r | c,,8-. r <g'' c>8-. r g,,8-. r r4 d'8-. r \ac b''8 c8-. r \t { g,8-. r <f' b>-. } q-. r  |
} >>

ld = {

}

pedal = {

}

\score {
  <<
    \new PianoStaff \with {
      connectArpeggios = ##t
    } <<
      \new Staff = "rr" \rr
      \new PianoDynamics = "rd" \rd
      \new Staff = "rl" \rl
    >>
    \new PianoStaff \with {
      connectArpeggios = ##t
    } <<
      \new Staff = "lr" \lr
      \new PianoDynamics = "ld" \ld
      \new Staff = "ll" \ll
      \new PianoPedal = "pedal" \pedal
    >>
  >>
  \layout {}
  \midi {}
}

\markup \italic \column {
  "Welte Licensee No. 5676"
  "Special thanks to Spencer Chase for providing e-rolls"
}