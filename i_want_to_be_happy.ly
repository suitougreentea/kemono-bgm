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
  revision = "Revision 1 (Unfinished)"
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
  \set Score.skipTypesetting = ##t
  r4 \t { <e'' a>8-. <d g>-. <c e>-. } b8-. r \ac <c e g>8 b8-. r |
  r4 \ac fis'8 <c f g>8-. r r4 \ac { cis'16 d } <f, g>8-. r |
  r4 \t { <e a>8-. <d g>-. <c e>-. } b8-. r \ac <c e g>8 b8-. r |
  r4 \ac fis'8 <c f g>8-. r r4 \ac { cis'16 d } <f, g>8-. r |

  c8.( d16 e8. f16 g4) g | g g g2 | c,8.( d16 e8. f16 g4) g | g g g2 |

  \t { r8 <c, e g>-. a' } \t { b-.[ r c-.] } \t { r <ees, ges b>-. a-. } \t { g-.[ r f-.] } |
  \t { r <a, c e>-. f'-. } \t { g-.[ r a-.] } \t { r <b, d g>-. f'-. } \t { e-.[ r d-.] }
  c1 | r4 \t { d8-. b-. aes-. } <a e'>-. r \t { <a b fis'>-.[ r <fis a b>-.] } |

  e'8. fis16 g8. a16 b8-. r b-. r | b-. r b-. r << \vi b2 \vd \vii \re { fis''4 \t { a8-. g-. fis-. } } >>
  \ottava 1 e8.( fis16 g8. a16 b4) b | b b b2 |

  \ottava 0 g,8. a16 b8. c16 <g d'>8. e'16 d8. c16 | << \vi { b8. a16 g8. fis16 e8-. r fis-. r } \vd \vii \re { d''2( cis4 c) } >> |
  << \vi { g2. r4 } \vd \vii \re { <g' b>8-. r r4 r2 } >> | R1 |

  e4( g8-.) r r4 e( | g2 e4 g) | f4( g8-.) r r4 f( | g2 f4 g) |

  f4( g8-.) r r4 f( | g2 f4 d' |
  c8) r \t { <e, c' e>8-. <dis b' dis>-. <e c' e>-. } \ottava 1 \t { <a c e a>--[ r <b b'>-.] } \t { <c a' c>-. <d bes' d>-. <dis b' dis>-. } |
  \t { <e c' e>-. \ottava 0 gis,-. a-. } <d, aes' d>-. r <c g' c>-. r <b d g>-. r |

  e4( g8-.) r r4 e( | g2 e4 g) |
  \ac <c, e>8 <b d f>8-. r <b d g>-. r \ac { <cis, e>16 <d f> } <ais cis>8-. r <a' c f>8-. r |
  <b d g>8-. r << \vii q-. \vd \vi \re { \ac { e'''16 f fis } g8-. } >> r <a c f>-. r \t { <b d g>-.[ r <cis e>-.] }

  \t { r4 <a c f>8-. } r4 \ac <cis, e>8 \t { <d f>8-. r <b' d g>-. } <a c f>-. r |
  r4 <b d g>8-. r <a c f>-. r <f' g d'>-. r | <e g c>2. r4 |
  \ac <fis, c'>8 <g a e'>8-. r \t { <d' f>8-. <cis e>-. <d f>-. } \t { <c g'>-.[ r gis'-.] } <c, d a'>-. r |

  bes'4( c2 bes4 | c2 bes4 c) | << \vii { a4( c2 \ac gis8 a4 } \vd \vi \re { r4 \t { <f''' c'>8-. <d a'>-. <f c'>-. } <d a'>-. r r4 } >> | f2) r |

  r4 g2( e4 | g2 e4 \t { g8-.)[ r g-.] } |
  r4 \ottava 1 \t { <a a'>8-.[ r <gis gis'>-.] } \t { <a a'>-.[ r <e e'>-.] } \t { <f f'>-. <cis' cis'>-. <d d'>-. } |
  <a' c>8-. r \ac { <gis b>16 <a c> } <a, d>8-. r <b d g>8-. r \ac { <ais cis fis>16 <b d g> } \t { <f g b>8-. <a c>-. <f b d>-. } |

  <e g c e>4 <g c e g>8-. r r4 <e g c e> | <g a c e g>2 <e g c e>8-. r <g a c e g>-. r |
  \ac { e16 gis c } <f, a f'>4( <g b d g>8-.) r r4 << \vi <a c f>( \vd \vii \re \t { f''8-.[ r fis-.] } >> |
  <g b d g>2 <f a c f>4 <g b d g>) |

  <f a c f>( <g b d g>8-.) r r4 << \vi <a c f>4( \vd \vii \re { \ac fis''8 \t { f8-.[ r fis-.] } } >> |
  <g b d g>2 << \vi { <f f'>4 <d' d'>4 } \vd \vii \re { <a'' c>8-. r r4 } >> |
  <c e g c>4) \ottava 0 <a, c>8-. r \ac <fis a d>8 <g b e>8-. r <f a>-. r |
  \ac <dis fis b>8 \t { <e g c>8-. b'-. c-. } r4 \ac fis8 <a, dis g>8-. r r4 |

  r4 \ac dis8 <fis, c' e>8-. r r4 \ac dis'8 <fis, c' e>8-. r |


  r4 \ac <dis' fis>8 <e g>8-. r r2 | r4 \t { g8-. g-. g-. } \t { g-.[ r g-.] } g-. r |
  r4 \t { <e a>8-. <d g>-. <c e>-. } b8-. r \ac <c e g>8 b8-. r |
  r4 \ac fis'8 <c f g>8-. r r4 \ac { cis'16 d } <b, f' g>8-. r |

  c8.( d16 e8. f16 g4) g | g g g2 |
  << \vii { c,8.( d16 e8. f16 g4) g | g g g2 } \vd \vi \re { \t { r8 c'''-. d-. } \t { e-.[ r f-.] } g-. r g-. r | g-. r g-. r \t { r e-. cis-. } \t { d-. e-. f-.} } >> |
\set Score.skipTypesetting = ##f
  \t { r8 <c, e g>-. a' } \t { b-.[ r c-.] } \t { r <ees, ges b>-. a-. } \t { g-.[ r f-.] } |
  \t { r <a, c e>-. f'-. } \t { g-.[ r a-.] } \t { r <b, d g>-. f'-. } \t { e-.[ r d-.] }
  c1 | r4 \t { d8-. b-. aes-. } <a e'>-. r \t { <a b fis'>-.[ r <fis a b>-.] } |

  e'8. fis16 g8. a16 b8-. r b-. r | b-. r b-. r << \vi b2 \vd \vii \re { fis''4 \t { a8-. g-. fis-. } } >>
  \ottava 1 e8.( fis16 g8. a16 b4) b | b b b2 |

  \ottava 0 g,8. a16 b8. c16 <g d'>8. e'16 d8. c16 | << \vi { b8. a16 g8. fis16 e8-. r fis-. r } \vd \vii \re { d''2( cis4 c) } >> |
  << \vi { g2. r4 } \vd \vii \re { <g' b>8-. r r4 r2 } >> | R1 |

  e4( g8-.) r r4 e( | g2 e4 g) | f4( g8-.) r r4 f( | g2 f4 g) |

  f4( g8-.) r r4 f( | g2 f4 d' |
  c8) r \t { <e, c' e>8-. <dis b' dis>-. <e c' e>-. } \ottava 1 \t { <a c e a>--[ r <b b'>-.] } \t { <c a' c>-. <d bes' d>-. <dis b' dis>-. } |
  \t { <e c' e>-. \ottava 0 gis,-. a-. } <d, aes' d>-. r <c g' c>-. r <b d g>-. r |

  e4( g8-.) r r4 e( | g2 e4 g) |
  \ac <c, e>8 <b d f>8-. r <b d g>-. r \ac { <cis, e>16 <d f> } <ais cis>8-. r <a' c f>8-. r |
  <b d g>8-. r << \vii q-. \vd \vi \re { \ac { e'''16 f fis } g8-. } >> r <a c f>-. r \t { <b d g>-.[ r <cis e>-.] }

  \t { r4 <a c f>8-. } r4 \ac <cis, e>8 \t { <d f>8-. r <b' d g>-. } <a c f>-. r |
  r4 <b d g>8-. r <a c f>-. r <f' g d'>-. r | <e g c>2. r4 |
  \ac <fis, c'>8 <g a e'>8-. r \t { <d' f>8-. <cis e>-. <d f>-. } \t { <c g'>-.[ r gis'-.] } <c, d a'>-. r |

  bes'4( c2 bes4 | c2 bes4 c) | << \vii { a4( c2 \ac gis8 a4 } \vd \vi \re { r4 \t { <f''' c'>8-. <d a'>-. <f c'>-. } <d a'>-. r r4 } >> | f2) r |

  r4 g2( e4 | g2 e4 \t { g8-.)[ r g-.] } |
  r4 \ottava 1 \t { <a a'>8-.[ r <gis gis'>-.] } \t { <a a'>-.[ r <e e'>-.] } \t { <f f'>-. <cis' cis'>-. <d d'>-. } |
  <a' c>8-. r \ac { <gis b>16 <a c> } <a, d>8-. r <b d g>8-. r \ac { <ais cis fis>16 <b d g> } \t { <f g b>8-. <a c>-. <f b d>-. } |

  <e g c e>4 <g c e g>8-. r r4 <e g c e> | <g a c e g>2 <e g c e>8-. r <g a c e g>-. r |
  \ac { e16 gis c } <f, a f'>4( <g b d g>8-.) r r4 << \vi <a c f>( \vd \vii \re \t { f''8-.[ r fis-.] } >> |
  <g b d g>2 <f a c f>4 <g b d g>) |

  <f a c f>( <g b d g>8-.) r r4 << \vi <a c f>4( \vd \vii \re { \ac fis''8 \t { f8-.[ r fis-.] } } >> |
  <g b d g>2 << \vi { <f f'>4 <d' d'>4 } \vd \vii \re { <a'' c>8-. r r4 } >> |
  <c e g c>4) \ottava 0 <a, c>8-. r \ac <fis a d>8 <g b e>8-. r <f a>-. r |
  \ac <dis fis b>8 \t { <e g c>8-. b'-. c-. } r4 \ac fis8 <a, dis g>8-. r r4 |

  r4 \ac dis8 <fis, c' e>8-. r r4 \ac dis'8 <fis, c' e>8-. r |

} >>

rl = << \global \relative {
  \clef treble
  r4 <e' g>8-. r r4 <c e g>8-. r | r4 <c f g>8-. r r4 \t { <d f g>8-. a'-. b-. } |
  r4 <e, g>8-. r r4 <c e g>8-. r | r4 <c f g>8-. r r4 \t { <d f g>8-. a'-. b-. } |

  << \vii { c,8.( d16 e8. f16 g4) g | g g g2 | c,8.( d16 e8. f16 g4) g | g g g2 }
     \vd \vi \re {
       r4 c''8-. r r4 <b c>8-. r | r4 \grace a8 <a c>8-. r r4 <b d>8-. r  |
       r4 c8-. r r4 \ac c8 b8-. r | r4 <a c>8-. r \t { r8 e'-. cis-. } d-. r
  } >>

  << \vi {
    \t { g4( a8 } \t { b-.[) r c-.] } \t { b4( a8 } \t { g-.)[ r f] } |
    \t { e4( f8 } \t { g-.[) r a-.] } \t { g4( f8 } \t { e-.)[ r d-.] } |
  } \vd \vii \re {
    r4 <c' e g>8-. r r4 <c e>8-. r | r4 <a c>8-. r r4 <b g'>8-. r |
  } >>
  r4 \ac c8 <e g a>8-. r \t { r g-. g,-. } <a c e>-. r |
  \t { c-.[ r <e a c>-.] } \t { f-. d-. b-. } c-. r r4 |

  <e g b>8.( fis16 g8. a16 b8-.) r <b e>-. r | b8-. r <b e>8-. r \ac { a16 ais } << \vi b2 \vd \vii \re { \t { r4 \ac fis'8 g8-. } \t { a8-. g-. fis-. } } >> |
  \ottava 1 <e g>8.( fis16 g8. a16 b4) <b e g> | b q << \vii b2 \vd \vi \re { <e''' g>8-. r \ac fis8 g8-. \ottava 0 r } >> |

  <g, b d>8. a16 b8. c16 d8. e16 d8. c16 | b8. a16 g8. fis16 <cis e>8-. r <c fis>-. r |
  \t { r8 <a d>-. <b e>-. } \t { <e a>-. <d g>-. <e b' d>-. } <g bes des>8-. r <bes e g>-. r |
  \ac <fis' a>8 <b, g' b>8-. r \ac <g' bes>8 \t { <b, f' a>8-. cis-. d-. } <b dis>8-. r \acciaccatura { a16 fis } b,8-. r |

  r4 \ac { c16 d dis } <c e>8-. r \t { <c e g>8-. <e g a>-. <g a c>-. } q-. r |
  r4 \ac { e'16 c } a8-. r \ac { g8 } e8-. r r4 |
  r4 <f g>8-. r \t { <a d>8-. <aes des>-. <g c>-. } a-. r |
  r4 \t { <b, d f g>8-. ais-. q-. } r4 q8-. r |

  \t { r4 <c f a>8-. } \t { <d f g>-. r <fis' a d>-. } \t { <f a>-. <b, cis>-. d-. } \t { r4 fis,8-. } |
  \t { g8-. a-. ais-. } <g b>-. r r4 \ac ais8 <b d g>8-. r |
  c2. r4 | a4( aes \t { g8 a g } f4) |

  <g c>8-. r <e g a c>-. r \ac g,8 a8-. r << \vii { \ac c8 e4( | g2 e4) } \vd \vi \re { <g' a c>8-. r | \ac { <a c>16 <bes d> <b dis> } <c e>8-. r \ac <f d'>8 \t { <e c'>8-.[ r <c a'>-.] } \t { c-. b-. a-. } } >> g8-. r |
  f4( <d g>8-.) r r4 f( | g2 f4 g) |

  f4( <d g>8-.) r r4 f( | g2 f4 d' | c2.) r4 | r4 f, \t { g8-.[ r gis-.] } a-. r |

  << \vii { bes4( c2 bes4 | c2 bes4 c) }
     \vd \vi \re { <d'' f>4( <e g>) \t { a8-. g-. ges-. } <d f>4( | <e g>2 <d f>4 <e g>) } >> |
  <a c f>4( <c f a>2 <a c f>4 | <f aes c>2) r4 \t { <f aes c>8-.[ r d'-.] } |

  <g, c e>8-. r << \vii { g2( e4 | g2 e4 \t { g8-.)[ r g-.] } } \vd \vi \re { <c'' e>8-. r r4 c8-. r | r4 \ac <d f>8 <c e>8-. r \ac <fis, b>8 c'8-. r c r } >>
  << \vii { <f d'>1 ~ | q } \vd \vi \re { c''2( b | a g) } >> |

  r4 \t { <c e g>8-. <dis fis a>-. <e g c>-. } \t { <a dis fis>-.[ r <e' g>-.] } r4 |
  r4 \ac { <f, a>16 <e g> <dis fis> } <e g>8-. r r2 |
  r4 <d g>8-. r \t { r cis-. d-. } <c f>-. r | r4 \ac <cis e>8 <d f>8-. r r4 \ac { <c e>16 cis } <d f>8-. r |

  r2 \ac { b''16 a aes } g8-. r r4 | r4 \ac { a16 f } \t { <ais, cis>8-.[ r <cis e>-.] } <f, c'>-. r \t { <f a d>-.[ r <f g>-.] } |
  <e g>8-. r e2( c4 ~ | c <a dis g>) \t { <a dis f>8-. r fis'-. } \t { <a, dis g>-. fis'-. g-. } |

  <fis, c' e>4 <fis c' d>8-. r \ac dis'8 <fis, c' e>4 \t { <fis c' d>8-.[ r fis-.] }


  r4 <e' g>8-. r r4 <c e g>8-. r | r4 <c f g>8-. r r4 <d f g>8-. r |
  r4 <e g>8-. r r4 <c e g>8-. r | r4 <c f g>8-. r r4 \t { <b d f g>8-. a'-. b-. } |

  << \vii { c,8.( d16 e8. f16 g4) g | g g g2 | c,8.( d16 e8. f16 g4) g | g g g2 }
     \vd \vi \re {
       r4 c''8-. r r4 <b c>8-. r | r4 \grace a8 <a c>8-. r r4 <b d>8-. r  |
       r4 <g c>8-. r r4 \ac c8 b8-. r | r4 <a c>8-. r \t { r8 e'-. cis-. } \t { d-. e-. <f a>-. }
  } >>

  << \vi {
    \t { g4( a8 } \t { b-.[) r c-.] } \t { b4( a8 } \t { g-.)[ r f] } |
    \t { e4( f8 } \t { g-.[) r a-.] } \t { g4( f8 } \t { e-.)[ r d-.] } |
  } \vd \vii \re {
    r4 <c' e g>8-. r r4 <c e>8-. r | r4 <a c>8-. r r4 <b g'>8-. r |
  } >>
  r4 \ac c8 <e g a>8-. r \t { r g-. g,-. } <a c e>-. r |
  \t { c-.[ r <e a c>-.] } \t { f-. d-. b-. } c-. r r4 |

  <e g b>8.( fis16 g8. a16 b8-.) r <b e>-. r | b8-. r <b e>8-. r \ac { a16 ais } << \vi b2 \vd \vii \re { \t { r4 \ac fis'8 g8-. } \t { a8-. g-. fis-. } } >> |
  \ottava 1 <e g>8.( fis16 g8. a16 b4) <b e g> | b q << \vii b2 \vd \vi \re { <e''' g>8-. r \ac fis8 g8-. \ottava 0 r } >> |

  <g, b d>8. a16 b8. c16 d8. e16 d8. c16 | b8. a16 g8. fis16 <cis e>8-. r <c fis>-. r |
  \t { r8 <a d>-. <b e>-. } \t { <e a>-. <d g>-. <e b' d>-. } <g bes des>8-. r <bes e g>-. r |
  \ac <fis' a>8 <b, g' b>8-. r \ac <g' bes>8 \t { <b, f' a>8-. cis-. d-. } <b dis>8-. r \acciaccatura { a16 fis } b,8-. r |

  r4 \ac { c16 d dis } <c e>8-. r \t { <c e g>8-. <e g a>-. <g a c>-. } q-. r |
  r4 \ac { e'16 c } a8-. r \ac { g8 } e8-. r r4 |
  r4 <f g>8-. r \t { <a d>8-. <aes des>-. <g c>-. } a-. r |
  r4 \t { <b, d f g>8-. ais-. q-. } r4 q8-. r |

  \t { r4 <c f a>8-. } \t { <d f g>-. r <fis' a d>-. } \t { <f a>-. <b, cis>-. d-. } \t { r4 fis,8-. } |
  \t { g8-. a-. ais-. } <g b>-. r r4 \ac ais8 <b d g>8-. r |
  c2. r4 | a4( aes \t { g8 a g } f4) |

  <g c>8-. r <e g a c>-. r \ac g,8 a8-. r << \vii { \ac c8 e4( | g2 e4) } \vd \vi \re { <g' a c>8-. r | \ac { <a c>16 <bes d> <b dis> } <c e>8-. r \ac <f d'>8 \t { <e c'>8-.[ r <c a'>-.] } \t { c-. b-. a-. } } >> g8-. r |
  f4( <d g>8-.) r r4 f( | g2 f4 g) |

  f4( <d g>8-.) r r4 f( | g2 f4 d' | c2.) r4 | r4 f, \t { g8-.[ r gis-.] } a-. r |

  << \vii { bes4( c2 bes4 | c2 bes4 c) }
     \vd \vi \re { <d'' f>4( <e g>) \t { a8-. g-. ges-. } <d f>4( | <e g>2 <d f>4 <e g>) } >> |
  <a c f>4( <c f a>2 <a c f>4 | <f aes c>2) r4 \t { <f aes c>8-.[ r d'-.] } |

  <g, c e>8-. r << \vii { g2( e4 | g2 e4 \t { g8-.)[ r g-.] } } \vd \vi \re { <c'' e>8-. r r4 c8-. r | r4 \ac <d f>8 <c e>8-. r \ac <fis, b>8 c'8-. r c r } >>
  << \vii { <f d'>1 ~ | q } \vd \vi \re { c''2( b | a g) } >> |

  r4 \t { <c e g>8-. <dis fis a>-. <e g c>-. } \t { <a dis fis>-.[ r <e' g>-.] } r4 |
  r4 \ac { <f, a>16 <e g> <dis fis> } <e g>8-. r r2 |
  r4 <d g>8-. r \t { r cis-. d-. } <c f>-. r | r4 \ac <cis e>8 <d f>8-. r r4 \ac { <c e>16 cis } <d f>8-. r |

  r2 \ac { b''16 a aes } g8-. r r4 | r4 \ac { a16 f } \t { <ais, cis>8-.[ r <cis e>-.] } <f, c'>-. r \t { <f a d>-.[ r <f g>-.] } |
  <e g>8-. r e2( c4 ~ | c <a dis g>) \t { <a dis f>8-. r fis'-. } \t { <a, dis g>-. fis'-. g-. } |

  <fis, c' e>4 <fis c' d>8-. r \ac dis'8 <fis, c' e>4 \t { <fis c' d>8-.[ r fis-.] }
} >>

rd = {

}

lr = << \global \relative {
  \clef bass
  c'2( b | a b) | <c, c'>( <b b'> | <a a'> <b b'>) |

  e2( b' | a4 c b4 ~ b8.) \noBeam b,16( | c8. d16 e8. f16 g4 ~ g8. gis16 | a4 f' \t { e4 g,8 } d'4) |

  g,2( fis | << \vi { f) g8.( f16 e8. d16 } \vd \vii \re { r4 d8-. r d-. r r4 } >> | c1) | c4( d e fis) |

  e1( | g2 << \vii fis) \vd \vi \re { \t { r4 \ac a8 <b dis>8-. } \t { <c e>-. <b dis>-. <a b>-. } } >> |
  r4 <b e g>8-. r r4 \t { <g b ees>8-.[ r <ees' g b>-.] } r4 \ac ais,8 <e g b>8-. r \ac fis'8 <g, b e>4_( << \vii { dis') } \vd \vi \re \t { <g' b>8-. <f a>-. <g b>-. } >>

  <b d>2( <c e> | <b d> << \vi { bes4 a | g2) } \vd \vii \re { r4 d8-. r | d8-. r r4 } >> <e cis'>2( | <f d'> <fis dis'>) |

  e4( g8-.) r r4 e( | g2 \t { e8 c e } g4) | f4( g8-.) r r4 f( | g2 f4 g) |
  f4( g8-.) r r4 f( | g2 f4 d' | << \vi { c2.) } \vd \vii \re { <e d'>8-. r <g e'>-. r r4 } >> <a e'>8-. r |
  << \vi { a4( aes \t { g8 a g } f4) } \vd \vii \re { c2. r4 } >>

  << \vi { e4( g8-.) r } \vd \vii \re e2 >> r4 e( | g2 e8-.) r \ac fis8 g4 |
  f4( g8-.) r r4 f( | g2 f4 g) |

  a4( b \ac a8 g4 a | b \ac a8 g4 a b |
  << \vi c1) \vd \vii \re { e8-. r \t { <d g>-.[ r <e a>-.] } \t { e'-. a,-. <e' g>-. } a-. r } >> |
  e,4( f g8. gis16 a4) |

  << \vii { d,4( e2 d4 | e2 d4 e) } \vd \vi \re { \t { bes8-. a-. bes-. } c-. r r4 bes8-. r | c8-. r r4 r2 } >>
  f2.( e4 << \vii d1) \v "lr2" \vi \re { r4 \ac { e'16 d ees } <c d>8-. r \t { e,8( f aes } c8. d16 } >>

  \v "lr2" { <e e'>4 <c c'> <b b'> <a a'> | <g g'>2 <e e'>4 <c c'>) } |
  << \vii { d'1 ~ | d } \vd \vi \re { c'2( b | a g) } >>

  e4( g8-.) r r4 e( | g2 e4 g) | a( b2 a4 | \ac ais8 b2 << \vi { a4 b) } \vd \vii \re { \t { <c f>8-. <f, c'>-. r } r4 } >> |

  a4( b2 \ac bes8 a4 | \ac ais8 b2 a4 b | <e, g c>) r r2 | R1 |

  d4. r8 d4. r8 |


  c'2( b | a b) | <c, c'>( <b b'> | <a a'> <g g'>) |

  e'2_( \ac { f16 fis g a } b2 | a4 c << \vii { b4 ~  b8.) \noBeam b,16^( } \vd \vi \re { \t { r8 <c' ees>-. <cis e>-. } <d f>-. r } >> |
  c8. d16 e8. f16 g4 ~ g8. gis16 | a4 f' e4 d4) |
% 3/4 -> 2/3, 1/4 -> 1/3
  g,2( fis | << \vi { f) \scaleDurations 8/9 g8.( \scaleDurations 4/3 f16 \scaleDurations 8/9 e8. \scaleDurations 4/3 d16 } \vd \vii \re { r4 d8-. r d-. r r4 } >> | c1) | c4( d e fis) |

  e1( | g2 << \vii fis) \vd \vi \re { \t { r4 \ac a8 <b dis>8-. } \t { <c e>-. <b dis>-. <a b>-. } } >> |
  r4 <b e g>8-. r r4 \t { <g b ees>8-.[ r <ees' g b>-.] } r4 \ac ais,8 <e g b>8-. r \ac fis'8 <g, b e>4_( << \vii { dis') } \vd \vi \re \t { <g' b>8-. <f a>-. <g b>-. } >>

  <b d>2( <c e> | <b d> << \vi { bes4 a | g2) } \vd \vii \re { r4 d8-. r | d8-. r r4 } >> <e cis'>2( | <f d'> <fis dis'>) |

  e4( g8-.) r r4 e( | g2 \t { e8 c e } g4) | f4( g8-.) r r4 f( | g2 f4 g) |
  f4( g8-.) r r4 f( | g2 f4 d' | << \vi { c2.) } \vd \vii \re { <e d'>8-. r <g e'>-. r r4 } >> <a e'>8-. r |
  << \vi { a4( aes \t { g8 a g } f4) } \vd \vii \re { c2. r4 } >>

  << \vi { e4( g8-.) r } \vd \vii \re e2 >> r4 e( | g2 e8-.) r \ac fis8 g4 |
  f4( g8-.) r r4 f( | g2 f4 g) |

  a4( b \ac a8 g4 a | b \ac a8 g4 a b |
  << \vi c1) \vd \vii \re { e8-. r \t { <d g>-.[ r <e a>-.] } \t { e'-. a,-. <e' g>-. } a-. r } >> |
  e,4( f g8. gis16 a4) |

  << \vii { d,4( e2 d4 | e2 d4 e) } \vd \vi \re { \t { bes8-. a-. bes-. } c-. r r4 bes8-. r | c8-. r r4 r2 } >>
  f2.( e4 << \vii d1) \v "lr2" \vi \re { r4 \ac { e'16 d ees } <c d>8-. r \t { e,8( f aes } c8. d16 } >>

  \v "lr2" { <e e'>4 <c c'> <b b'> <a a'> | <g g'>2 <e e'>4 <c c'>) } |
  << \vii { d'1 ~ | d } \vd \vi \re { c'2( b | a g) } >>

  e4( g8-.) r r4 e( | g2 e4 g) | a( b2 a4 | \ac ais8 b2 << \vi { a4 b) } \vd \vii \re { \t { <c f>8-. <f, c'>-. r } r4 } >> |

  a4( b2 \ac bes8 a4 | \ac ais8 b2 a4 b | <e, g c>) r r2 | R1 |

  d4. r8 d4. r8 |
} >>

ll = << \global \relative {
  \clef bass
  c,8 r r4 g8 r r4 | d'8 r r4 g,8 r r4 | c8 r r4 g8 r r4 | d'8 r r4 g,8 r r4 |

  <c g'>8 r <g'' c>-. r g, r <g' e'>-. r | d8 r f'8-. r g,,8 r \ac <cis' e>8 <g d' f>8-. r |
  c,,8 r <g'' c>8-. r g,,8 r <c'' e>8-. r d,,8 r \ac b''8 c8-. r \t { g,8 r <f' b>-. } q-. r  |

  e,8 r r4 ees8 r r4 | d r <g, g'>8 r r4 | c8 r r4 g8 r r4 | a( b c dis) |

  e8 r <b'' e>-. r b,, r <b'' e g>-. r | \t { cis,, r <b'' e g>-. } <e g>8-. r dis,,8 r r4 |
  <e e'>2( <ees ees'> | <d d'> <des des'>) |

  r4 d8-. r r4 d'8-. r | r4 d,8-. r r4 d8 r | <g, g'>8 r r4 g'8 r <g' bes>-. r | g,,8 r <g'' b>-. r g,2 |

  c,8 r <g'' a>-. r g,, r r4 | <c g'>8 r <c'' e g>-. r g,, r <a'' c e>-. r |
  d,,8 r <g' b>-. r g,, r <c'' f>-. r | \t { d,, r b'-. } r4 g,8 r r4 |

  d'8 r <g' b>-. r g,, r <a'' c f>-. r | <d,, b'>8 r <b'' d f>-. r g,,8 r <f''' g>-. r |
  c,,8 r r4 a'2 | fis4( f \t { e8 f e } d4) |

  <c g'>8 r <a'' c>-. r g,,8 r r4 | <c g'>8 r <c'' e>-. r g,, r <c'' e>-. r
  d,,8 r r4 g,8 r \ac <b'' d>8 <a c>8-. r | d,, r <b'' f'>-. r g,, r <b'' f'>-. r |

  d,,8 r r4 g,8 r c''-. r | d,, r <b'' d f>-. r r4 \ac g,,8 <g' d' f> r |
  c,8 r r4 g8 r r4 | c4( d e8. eis16 fis4) |

  g8 r <bes' g'>-. r c,, r f''-. r | g,, r \ac fis''8 <bes, c g'>8-. r <c,, g'> r \t { <bes'' c g'>-.[ r q-.] } |
  f,8 r <c'' f a>-. r c,,8 r <c'' e>-. r | f,,,4 <f'' aes>8-. r f, r r4 |

  c8 r <g'' a>-. r g,, r <a'' c>-. r | <e,, e'> r <a'' c e>-. r g,, r \ac <fis'' b>8 <g a c>8-. r |
  << \vii { g,,8 r } \vd \vi \re g,4 >> d'8 r g r d r | g, r d' r g r d r |

  <c g'>8 r a''-. r g,, r \ac g'''8 <c, e>8-. r | <c,, g'> r \ac { a''16 ais b } c8-. r g,, r <c'' e g>-. r |
  d,,8 r r4 g,8 r r4 | d'8 r r4 f,8 r g r |

  d'8 r <d'' g>-. r g,,, r <c'' f> r | d,, r <d'' f g>8-. r g,,, r r4 |
  <c g'>4 a''8-. r <e b'>-. r f-. r | <c g'>-. r <f, c'>4 r f,8 r |

  <d' a'>4 r q \t { r4 g,8 } |


  r2 e'8 r r4 | d8 r r4 g,8 r r4 | c8 r r4 g8 r r4 | d'8 r r4 g,8 r r4 |

  <c g'>8 r <g'' c>-. r g, r <g' e'>-. r | d8 r f'8-. r g,,8 r g'-. r |
  c,,8 r <g'' c>8-. r g,,8 r <c'' e>8-. r d,,8 r \ac b''8 c8-. r \t { g,8 r <f' g b>-. } q-. r  |

  e,8 r r4 ees8 r r4 | d r <g, g'>8 r r4 | c8 r r4 g8 r r4 | a( b c dis) |

  e8 r <b'' e>-. r b,, r <b'' e g>-. r | \t { cis,, r <b'' e g>-. } <e g>8-. r dis,,8 r r4 |
  <e e'>2( <ees ees'> | <d d'> <des des'>) |

  r4 d8-. r r4 d'8-. r | r4 d,8-. r r4 d8 r | <g, g'>8 r r4 g'8 r <g' bes>-. r | g,,8 r <g'' b>-. r g,2 |

  c,8 r <g'' a>-. r g,, r r4 | <c g'>8 r <c'' e g>-. r g,, r <a'' c e>-. r |
  d,,8 r <g' b>-. r g,, r <c'' f>-. r | \t { d,, r b'-. } r4 g,8 r r4 |

  d'8 r <g' b>-. r g,, r <a'' c f>-. r | <d,, b'>8 r <b'' d f>-. r g,,8 r <f''' g>-. r |
  c,,8 r r4 a'2 | fis4( f \t { e8 f e } d4) |

  <c g'>8 r <a'' c>-. r g,,8 r r4 | <c g'>8 r <c'' e>-. r g,, r <c'' e>-. r
  d,,8 r r4 g,8 r \ac <b'' d>8 <a c>8-. r | d,, r <b'' f'>-. r g,, r <b'' f'>-. r |

  d,,8 r r4 g,8 r c''-. r | d,, r <b'' d f>-. r r4 \ac g,,8 <g' d' f> r |
  c,8 r r4 g8 r r4 | c4( d e8. eis16 fis4) |

  g8 r <bes' g'>-. r c,, r f''-. r | g,, r \ac fis''8 <bes, c g'>8-. r <c,, g'> r \t { <bes'' c g'>-.[ r q-.] } |
  f,8 r <c'' f a>-. r c,,8 r <c'' e>-. r | f,,,4 <f'' aes>8-. r f, r r4 |

  c8 r <g'' a>-. r g,, r <a'' c>-. r | <e,, e'> r <a'' c e>-. r g,, r \ac <fis'' b>8 <g a c>8-. r |
  << \vii { g,,8 r } \vd \vi \re g,4 >> d'8 r g r d r | g, r d' r g r d r |

  <c g'>8 r a''-. r g,, r \ac g'''8 <c, e>8-. r | <c,, g'> r \ac { a''16 ais b } c8-. r g,, r <c'' e g>-. r |
  d,,8 r r4 g,8 r r4 | d'8 r r4 f,8 r g r |

  d'8 r <d'' g>-. r g,,, r <c'' f> r | d,, r <d'' f g>8-. r g,,, r r4 |
  <c g'>4 a''8-. r <e b'>-. r f-. r | <c g'>-. r <f, c'>4 r f,8 r |

  <d' a'>4 r q \t { r4 g,8 } |
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