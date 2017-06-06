\version "2.19.59"

\include "stylesheet.ily"

t = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \tuplet 3/2 4 $notes #}
)

ti = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \scaleDurations 2/3 $notes #}
)

rp = #(define-music-function
  (parser location pos) (number?)
  #{ \once \override Rest.staff-position = $pos #}
)

hs = #(define-music-function
  (parser location shift) (number?)
  #{ \once \override NoteColumn.force-hshift = $shift #}
)

ossia = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \new Staff \with {
    \remove "Time_signature_engraver"
    \omit KeySignature
    alignAboveContext = #"right"
    \magnifyStaff #4/5
    firstClef = ##f
  } $notes #}
)

addSpace = #(define-music-function
  (parser location esw) (pair?)
  #{
    \once \override PianoStaff.BarLine.extra-spacing-width = $esw
    \once \hide PianoStaff.BarLine \once \hide PianoStaff.SpanBar
    \bar "|"
  #}
)

cstud = #(define-music-function
  (parser location reverse pos) (boolean? pair?)
  #{
    \once \override TupletBracket.positions = $pos
    \once \override TupletBracket.edge-height = #(if reverse '(0.7 . -0.7) '(-0.7 . 0.7))
  #}
)

tadj = #(define-music-function
  (parser location pos) (pair?)
  #{
    \once \override TupletBracket.positions = $pos
  #}
)

cleft = \change Staff = "left"
cright = \change Staff = "right"

ped = \sustainOn
pedr = \sustainOff
pedre = \sustainOff\sustainOn

\header {
  title = "けものパレード"
  nickname = "（すやすやぽわわんのやつ）"
  revision = "Revision 1 (Release Candidate)"
  date = "2017/6/7"
}

\paper {
  page-count = 7
  system-count = 35
  max-systems-per-page = 5
}

global = {
  \key d \major
  \time 4/4
  \set Score.tempoHideNote = ##t
  \tempo \markup {
    \concat {
      \smaller \general-align #Y #DOWN \note #"4" #1
      \normal-text " = ca. 100"
    }
  } 4 = 100
  s1
  \time 9/8
  s8*9
  \time 2/4
  s2
  \bar "||"
  \time 4/4
    \tempo \markup {
    \concat {
      \smaller \general-align #Y #DOWN \note #"4" #1
      \normal-text " = ca. 128"
    }
  } 4 = 128
  s1*4
  \set Score.tempoHideNote = ##f
  \tempo 4=155
  s1*2
  \bar "||"
  s1*51
  \bar "||"
  s1*20
  \bar "||"
  s1*10
  \bar "||"
  s1*18
  \bar "|."
}

right = << \global \relative {
  \clef treble

  a'8-_ fis'-_ e-_ d-_ e-_ a-_ fis-_ e-_ | d-_[ e-_ d-_ b-_] a-_ b-_[ b16 b] b8-_[ cis-_] |
  \override TextSpanner.bound-details.left.text = "riten."
  <fis, d'>-_\startTextSpan <fis cis'>-_ <g d'>-_ <a e'>-_\stopTextSpan |
  <a d>( cis d e ~ e d e fis ~ | fis g gis a ~ a fis e d) |
  \override TextSpanner.bound-details.left.text = "rit."
  d4(\startTextSpan b' a d, | b g' fis e\stopTextSpan |
  <fis, a d>1 ~ | q2.) r4 |

  << {
    \t { \voiceOne e8 a b d cis b a d e g fis e | d g a d cis b } <a a'>2\arpeggio
  } \\ {
    \voiceTwo <g,, b d>2 \once \override Arpeggio.X-offset = -1 <g b d g>\arpeggio | <b e g b>\arpeggio \t { <a d>8 q q <e' b'>4 <d a'>8 ^~ }
  } >>

  % A
  << \context Voice = "2" {
    \oneVoice \cstud ##f #'(-4.5 . -5) \t { <d a'>4 \cleft \voiceOne a8 b4 d8 e4 d8 e4 d8 } | \cright \oneVoice <g, b fis'>4 \t { <b d a'>4 <g d'>8 <b d> q q <d b'>4 <cis a'>8 ~ } |
    \cstud ##f #'(-5 . -5) \t { q4 \cleft \voiceOne a8 b4 d8 e4 d8 e4 d8 } | \cright \oneVoice <a d fis>4 \t { <d a'>4 <a d>8 a'( g fis e d b) }
  } \new Voice {
    \hide TupletBracket \hide TupletNumber
    \voiceTwo \cleft s4 <d, fis>4 \t { \rp 0 r8 <fis a>4 } q4 | s1 |
    s4 <cis e>4 \t { \rp 0 r8 <e a>4 } <a cis>4 | s1 |
  } >>

  \t { <a d fis>8[ r e'] ~ e4 d8 <bes' d fis>8[ r e] ~ e4 d8 |
       <a, d fis>8[ r e'] ~ e4 d8 } \addSpace #'(5 . -5) \acciaccatura ais''8 \t { <d, fis b>8[ r e] ~ e4 d8 }
  <e,, g b>4 <fis a cis> <g b d> \t { <gis b d e>4 <d' e b'>8 ~ q4 <cis e a>8 } q4 \t { <e cis'>8[ r q] r4 <fis a d>8 }

  r2 <a a'>8 r \t { r4 <g g'>8 ~ | q4 fis'8 e4 a8 } d,4-_ \t { a,8 b cis } \break |

  \repeat volta 2 {
    << {
      d8 \rp 0 r \t { a8 b cis } d8 \rp 0 r \t { d8 e fis } \noBreak |
      << { \t { g4 fis8 } fis8 \rp 0 r e \rp 0 r } \ossia { \key d \major \t { g4^\markup "2x:" fis8 fis4 e8 } e8 r } >> \t { b8 cis d } |
      e8 \rp 0 r \t { b8 cis d } e8 \rp 0 r \t { e8 fis g } |
      \t { a4 g8 g4 fis8 } fis8 \rp 0 r \t { fis4 e8 } |
       } \\ {
      <fis, a>8 s fis r a s <fis a> r | <b d> r q s q s g r |
      <a cis>8 s a r cis s <a cis> r | <ais cis e> r \ti { q8[ r e'] } <cis e>8 s <ais cis> r |
    } >>

    <fis a d>8 r \voiceOne \t { <b' d fis>8[ r e] } <d fis a>8 r \oneVoice << { << \t { fis,4 e8 } \\ { <a, d>8 r } >> | \noBreak
    <g b d>8 r } \ossia { \t { \key d \major fis'8^\markup "2x:" fis e } d8 r } >> \voiceOne \t { <b' d fis>8[ r e] } <d fis a>8 r \oneVoice r4 |
    \voiceOne \cleft <fis,, gis b e>8 r \cright <b' d fis> r \cleft <fis, gis b e>8 r \cright <b' d fis> r |
    \cleft <e,, b' e>8 r <e e'> r \t { e' \cright \oneVoice c'( cis d dis e) }

    \voiceOne \cleft <fis,, gis b d>8 r \cright <b' d e> r \cleft <fis, gis b d>8 r \cright <b' d e> r |
    \cleft e,8 r <e, e'> r \t { <e b' e> \cright \oneVoice ees''( d des c b) }
    \cleft \voiceOne <fis, a d>4 <e a cis> <d a' b> \t { <e a cis>4 <fis a d>8 ~ } |
    \cstud ##t #'(7.5 . 8) \t { q4 \cright \oneVoice d'8( e fis a } << { \voiceOne d8) r r4 } \new Voice { \voiceTwo d,4 e } >> \oneVoice

    << {
      \t { f4 e8 f4 e8 } f4 \t { e4 f8 ~ | f4 e8 f4 e8 } f4 \t { e'4 f8 ~ } |
      \t { f4 e8 f4 e8 } f4
       } \\ {
      <a,, c>2. \ti { q4 <g c>8 ~ } | q2. \ti { <g' c>4 <a c>8 ~ } |
      q2.
    } >> \t { <a c e g>4 <c f a>8 ~ q4 <c e g>8 } q4-_ \t { <g c e g>4 <f bes d f>8 ~ q4 <e a cis e>8 ~ }

    q2 r2 | r4 \t { r8 e e' } e8 r \ottava 1 \t { e8 e'4 } \ottava 0 |
    \t { <e,, gis b e>4 q8 <fis b d fis>4 q8 } <gis b d gis>4 << { \t { \oneVoice <b d e b'>4 \voiceOne a'8 ~ } | a4 r } \\ { \ti { s4 <a, d e>8 ~ } \t { q4 q8 } q4-_ } >>
    \t { <d, a' d>8 q q <b' e b'>4 <a d fis a>8 ~ }

    % A'
    << {
      \oneVoice \cstud ##t #'(-5 . -6.5) \t { q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 } | \cright \oneVoice <g, b fis'>4 \t { <b d a'>4 <g d'>8 <d' b' d> q q <b' d b'>4 <a cis e a>8 ~ } |
      \cstud ##t #'(-5 . -5.5) \t { q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 } | \cright \oneVoice <a d fis>4 \t { <d a'>4 <a d>8 a'( g fis e d b) }
    } \new Voice {
      \hide TupletBracket \hide TupletNumber
      \voiceTwo \cleft s4 <d, fis>4 \t { \rp 0 r8 <fis a>4 } q4 | s1 |
      s4 <cis e>4 \t { \rp 0 r8 <e a>4 } <a cis>4 | s1 |
    } >>

    \t { <a d fis>8[ r e'] ~ e4 d8 <bes' d fis>8[ r e] ~ e4 d8 |
         <a, d fis>8[ r e'] ~ e4 d8 } \addSpace #'(5 . -5) \acciaccatura ais''8 \t { <d, fis b>8[ r e] ~ e4 d8 }
    <b, e g b>4 <cis fis a cis> <d g b d> \t { <e gis b d e>4 <b' d e b'>8 ~ q4 <a cis e a>8 } q4 \t { <d, a' d>8 q q <b' e b'>4 <a d fis a>8 ~ }

    << {
      \oneVoice \cstud ##t #'(-5 . -6) \t { q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 } | \cright \oneVoice <a d fis>4 \t { <d a'>4 <a d>8 <d g d'> q q <b' e b'>4 <a d fis a>8 ~ } |
      \cstud ##t #'(-5 . -5.5) \t { q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 } | \cright \oneVoice <a d fis>4 \t { <d a'>4 <a d>8 a'( g fis e d b) }
    } \new Voice {
      \hide TupletBracket \hide TupletNumber
      \voiceTwo \cleft s4 <d, fis>4 \t { \rp 4 r8 <a' cis>4 } q4 | s1 |
      s4 <e g>4 \t { \rp 2 r8 <a cis>4 } q4 | s1 |
    } >>

    \t { <a d fis>8[ r e'] ~ e4 d8 <bes' d fis>8[ r e] ~ e4 d8 |
         <a, d fis>8[ r e'] ~ e4 d8 } \addSpace #'(5 . -5) \acciaccatura ais''8 \t { <d, fis b>8[ r e] ~ e4 d8 }
    <e,, g b>4 <fis a cis> <g b d> \t { <gis b d e>4 <d' e b'>8 ~ q4 <cis e a>8 } q4 \t { <e cis'>8[ r q] r4 <fis a d>8 }

    r2 <a a'>8 r \t { r4 <g g'>8 ~ | }
  }
  \alternative {
    { \t { <g g'>4 fis'8 e4 a8 } d,4-_ \t { a,8 b cis } | }
    { \t { <g' g'>4\repeatTie fis'8 e4 a8 } d,4 r4 | }
  }

  \key f \major
  \t { bes,8[ r d] f[ r a,] r4 d8 f[ r c] | r4 g'8 r4 f8 } r4 \t { d8[ r f] } |
  \t { g8[ r a] bes[ r a] r4 g8 r4 f8 | r4 <c f>8 r4 <bes f'>8 } <a f'>8 r r4 |

  \t { bes'8[ r d] f[ r a,] r4 d8 f[ r c] | r4 g'8 r4 f8 } r4 \t { d8[ r f] } |
  \t { a8[ r bes] c[ r a] r4 g8 r4 f8 | r4 f,8 c'8[ r bes] a[ r bes] c[ r f] } |

  \t { <d,, f bes>4 <f d'>8 <a f'>4 <g a>8 ~ q4 <bes d>8 <a f'>4 <g c>8 ~ | q4 <g a c g'>8 r4 <a f'>8 ~ } q4 \t { <g d'>4 <a f'>8 } |
  \t { <bes g'>4 <c a'>8 <d bes'>4 <c a'>8 ~ q4 <bes g'>8 r4 <a f'>8 | r4 <f c'>8 r4 <f bes>8 <f a> c' d f g a }

  << {
    <d, d'>4 \t { <f f'>4 <c c'>8 ~ } q4 \t { <d d'>4 \tieNeutral <c g' c>8 ~ } |
    \oneVoice \t { q4 \handBracket ##t 0.5 <\parenthesize a a'>8 <g' e' g>4 <f d' f>8 ~ } q4 \voiceOne \tuplet 6/4 { a'16 g f e d c } |
     } \\ {
    \t { bes4 d8 } \ti { s4 a8 ~ } \t { a4 d,8 } \ti { f4 c8 } | s2. <a' d>4 |
  } >>
  \t { \handBracket ##t 0.5 <\parenthesize a, bes'>4 <bes a'>8 <c bes'>4 <f a f'>8 r4 <bes, g' bes>8 <c c'> <cis cis'> <d f d'> } |
  \t { <e g e'>[ r <g g'>] <c a' c>[ r <bes g' bes>] <a f' a>[ r <bes g' bes>] <c a' c>[ r <f a f'>] }

  \t { <d f bes d>8-> q-> q-> } q8-> r \t { q8-> q-> q-> } q8-> r |
  \t { <d f d'>8-> <e g e'>-> <d f d'>-> <e g e'>-> <d f d'>-> <e g e'>-> }
  <d f d'>4-_-> \t { r8 g, bes } |
  <e, g c>4 ~ \t { q8 bes' c } <d, f bes d>4 \t { bes'8 c d } |
  <ees, aes c ees>4 \t { <c c'>8 <bes bes'> <c c'> } << \t { <bes' des>8 q q } \\ des,4 >> \t { <bes' ees bes'>4 <aes des aes'>8\arpeggio ~ }

  \key des \major
  \t { q4 aes,8 bes4 des8 ees4 des8 ees4 des8 } | f4 \t { aes4 des,8 <bes' des>8 q q <bes des bes'>4 <aes c aes'>8\arpeggio ~ } |
  \t { q4 aes,8 bes4 des8 ees4 des8 ees4 des8 } | f4 \t { aes4 des,8 ~ } << { \voiceTwo des2 } \new Voice { \voiceOne \t { aes''8( ges f ees des bes) } } >> \oneVoice |

  \set Staff.connectArpeggios = ##t
  << {
    \t { <des, f>4\arpeggio ees8 ~ ees4 des8 <des f>4\arpeggio ees8 ~ ees4 des8 |
         <des f>4\arpeggio ees8 ~ ees4 des8 <f bes>4\arpeggio ees8 ~ ees4 des8 }
     } \\ {
    aes2\arpeggio a\arpeggio | bes\arpeggio des\arpeggio |
  } >>
  <ees, ges bes>4 <f aes c> <ges bes des> \t { <g bes des ees>4 <des' ees bes'>8 ~ } |

  \t { q4 <c ees aes>8 } q4 \t { <aes' c aes'>8 q q q4 <a cis e a>8 ~ } |
  q2. ~ \t { q4 <b d fis b>8 ~ q4 <a cis e a>8 } q4-_ \t { <b e g b>8 q q q4 <a d fis a>8 ~ }

  % A''
  \key d \major
  << {
    \oneVoice \cstud ##t #'(-5 . -5.5) \t { q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 } | \cright \oneVoice <g, b fis'>4 \t { <b d a'>4 <g d'>8 <b' d g b> q q q4 <a cis e a>8 ~ } |
    \cstud ##t #'(-5 . -5.5) \t { q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 } | \cright \oneVoice <fis, a fis'>4 \t { <d' a'>4 <a d>8 a'( g fis e d b) }
  } \new Voice {
    \hide TupletBracket \hide TupletNumber
    \voiceTwo \cleft s4 <d, fis>4 \t { \rp 0 r8 <fis a>4 } q4 | s1 |
    s4 <cis e>4 \t { \rp 0 r8 <e a>4 } <a cis>4 | s1 |
  } >>

  \t { <a d fis>8[ r e'] ~ e4 d8 <bes' d fis>8[ r e] ~ e4 d8 |
       <a, d fis>8[ r e'] ~ e4 d8 } \addSpace #'(5 . -5) \acciaccatura ais''8 \t { <d, fis b>8[ r e] ~ e4 d8 }
  <b, e g b>4 <cis fis a cis> <d g b d> \t { <e gis b d e>4 <b' d e b'>8 ~ q4 <a cis e a>8 } q4 \t { <d, a' d>8 q q <b' e b'>4 <a d fis a>8 ~ }

  << {
    \oneVoice \cstud ##t #'(-5 . -6) \t { q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 } | \cright \oneVoice <a fis'>4 \t { <d a'>4 <a d>8 <d g d'> q q <b' e b'>4 <a d fis a>8 ~ } |
    \cstud ##t #'(-5 . -5.5) \t { q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 } | \cright \oneVoice <a d fis>4 \t { <d a'>4 <a d>8 a'( g fis e d b) }
  } \new Voice {
    \hide TupletBracket \hide TupletNumber
    \voiceTwo \cleft s4 <d, fis>4 \t { \rp 4 r8 <a' cis>4 } q4 | s1 |
    s4 <e g>4 \t { \rp 2 r8 <a cis>4 } q4 | s1 |
  } >>

  \t { <a d fis>8[ r e'] ~ e4 d8 <bes' d fis>8[ r e] ~ e4 d8 |
       <a, d fis>8[ r e'] ~ e4 d8 } \addSpace #'(5 . -5) \acciaccatura ais''8 \t { <d, fis b>8[ r e] ~ e4 d8 }
  <e,, g b>4 <fis a cis> <g b d> \t { <gis b d e>4 <d' e b'>8 ~ q4 <cis e a>8 } q4 \t { <e cis'>8[ r q] r4 <fis a d>8 }

  r2 <a a'>8 r \t { r4 <g g'>8 ~ | q4 fis'8 e4 a8 d, fis a } <d, fis d'>8 r |
} >>

left = << \global \relative {
  \clef bass
  fis8-_ d'-_ fis,-_ d'-_ g,-_ d'-_ g,-_ d'-_ | a-_[ e'-_ a,-_ d-_] fis-_ g-_[ g16 g] b,8-_[ a-_] | fis-_ g-_ a-_ cis-_ |
  d8-_ fis-_ d-_ a'-_ cis,-_ fis-_ cis-_ a'-_ | b,-_ fis'-_ b,-_ a'-_ a,-_ cis-_ a-_ e'-_ |
  g,-_ d'-_ g,-_ d'-_ fis,-_ d'-_ fis,-_ d'-_ | e,-_ d'-_ e,-_ d'-_ a-_ d-_ a-_ e'-_ |

  d2 d | d4 d d \t { e,8 b e, } |

  % A
  <a, a'>1-> ~ | q2. \t { a''8[ a,] <fis, fis'> ~ } |
  \voiceFour \t { q4 d'8 } \hs 0.3 fis4 \t { fis,4 d'8 \hs 0.3 g a d, } | \oneVoice \t { <g, g'>4 g8 } g'4 \t { g,4 d'8 g,[ g'] <a, a'> ~ }
  \voiceFour \t { q4 e'8 } \hs 0.3 a4 \t { a,4 e'8 \hs 0.3 cis' e a, } | \oneVoice <d, d'>4 \t { d8 d' d, } <cis cis'>4 \t { cis8 cis' cis, }

  <b b'>4-_ q-_ <bes bes'>-_ q-_ | <a a'>-_ q-_ <gis gis'>-_ q-_ |
  <e e'>4 <fis fis'> <g g'> \t { gis'8[ gis,] <a a'> ~ q4 e'8 } a,4 \t { a'8[ r g] fis r <d d'> }

  \t { r4 d8 d'[ r d'] <a, a'>[ r a'] \handBracket ##f -1 \tadj #'(-4 . -4.5) \parenthesize a' r <g,, g'> ~ | q4 <fis fis'>8 <e e'>4 a8 } <d, d'>4-_ r |

  \repeat volta 2 {
    fis4 \t { d'4 fis8 } r2 | g,4 \t { d'4 g8 } r2 |
    a,4 \t { e'4 a8 } r2 | ais,4 \t { fis'4 ais8 } r4 ais, |

    b8 r \cright \voiceTwo \t { fis''8[ r e] } d8 r \cleft \oneVoice r4 |
    e,,8 r \cright \voiceTwo \t { fis''8[ r e] } d8 r \cleft \oneVoice r4 |
    \voiceTwo e,,8 r \cright e'' r \cleft e,, r \cright e'' r |
    \cleft \t { <e,, e'>8( <fis fis'> <g g'> <a a'> <b b'> <cis cis'> } <e b' e>8) \oneVoice r r4

    \voiceTwo e,8 r \cright e'' r \cleft e,, r \cright e'' r |
    \cleft \t { <e, b' e>8( <d d'> <cis cis'> <b b'> <a a'> <g g'> } <e e'>8) \oneVoice r r4
    \voiceTwo a4 a \t { a4 a8 a,4 d8 ~ | d4 \oneVoice d8 d'4 d,8 } d'4 e |

    d,4-_ d-_ d-_ \t { d4 c8 ~ } | c4-_ c-_ c-_ \t { c4 b8 ~ } |
    \t { b4 b'8 b,4 b'8 b,4 b'8 b,[ b'] c, ~ | c4 c'8 } c,4-_ \t { <c c'>4 <bes bes'>8 ~ q4 <a a'>8 ~ } |

    << \new Voice {
      \voiceOne \t { a' e' a } <a cis e>4 \t { r8 g b } <g d' e>4 |
      \t { r8 fis a } <fis d' e>4 \t { r8 f a } <f d' e>4
       } { \voiceTwo <a,, a'>2 <g g'> | <fis fis'> <f' f'> | } >> \oneVoice
    <e e'>4 q \t { e8 e' e, e4 <a, a'>8 ~ | q4 q8 } q4-_ \t { a8 a' g, <g g'>4 <fis fis'>8 ~ } |

    % A'
    \voiceFour \t { q4 d'8 } \hs 0.3 fis4 \t { fis,4 d'8 \hs 0.3 g a d, } | \oneVoice \t { <g, g'>4 g8 } g'4 \t { g,4 d'8 g,[ g'] <a, a'> ~ }
    \voiceFour \t { q4 e'8 } \hs 0.3 a4 \t { a,4 e'8 \hs 0.3 cis' e a, } | \oneVoice <d, d'>4 \t { d8 d' d, } <cis cis'>4 \t { cis8 cis' cis, }

    <b b'>4-_ q-_ <bes bes'>-_ q-_ | <a a'>-_ q-_ <gis gis'>-_ q-_ |
    <e e'>4 <fis fis'> <g g'> \t { gis'8[ gis,] <a a'> ~ q4 e'8 } a,4 \t { <a a'>4 <ais ais'>8 r4 <b b'>8 ~ }

    \voiceFour \t { q4 b8 } \hs 0.3 b'4 <cis, cis'>4 \t { \hs 0 cis8 cis' cis, } | \oneVoice <d d'>4 \t { d8 d' d, } <g, g'>4 \t { <fis fis'>4 <e e'>8 ~ }
    \voiceFour \t { q4 e8 } \hs 0.3 e'4 <a, a'> \t { \hs 0 g8 fis' e } | \oneVoice <d d'>4 \t { d8 d' d, } <cis cis'>4 \t { cis8 cis' cis, }

    <b b'>4-_ q-_ <bes bes'>-_ q-_ | <a a'>-_ q-_ <gis gis'>-_ q-_ |
    <e e'>4 <fis fis'> <g g'> \t { gis'8[ gis,] <a a'> ~ q4 e'8 } a,4 \t { a'8[ r g] fis r <d d'> }

    \t { r4 d8 d'[ r d'] <a, a'>[ r a'] \tadj #'(-4 . -4.5) \handBracket ##f -1 \parenthesize a' r <g,, g'> ~ } |
  }
  \alternative {
    { \t { q4 <fis fis'>8 <e e'>4 a8 } <d, d'>4-_ r | }
    { \t { <g g'>4\repeatTie <fis fis'>8 <e e'>4 a8 } <d, d'>4 r | } \break
  }

  \key f \major
  R1 | R1 | R1 | R1 |
  \clef treble
  \t { bes''8[ r d] f[ r a,] r4 d8 f[ r c] | r4 g'8 r4 f8 } r4 \t { d8[ r f] } |
  \t { a8[ r bes] c[ r a] r4 g8 r4 f8 } | R1 |

  \clef bass
  <bes,,, bes'>4 \t { q4 <c c'>8 ~ } q4 \t { <bes bes'>4 <a a'>8 ~ | q4 <c c'>8 r4 <d d'>8 ~ } q4 d |
  <g, g'>4 \t { q4 <c c'>8 ~ q4 q8 ~ q4 <f, f'>8 | r4 q8 r4 q8 } q4 \t { g'4 a8 }

  << {
    \voiceOne \t { bes4 d8 f4 a,8 ~ a4 d8 f4 a,8 ~ a4 g'8 ~ g4 d8 ~ } d4 \t { d4 f8 } |
    \oneVoice <g, g'>4 \t { g4 g,8 ~ g4 g'8 ~  g4 <a, a'>8 ~ } |
      } \new Voice {
    \voiceTwo bes4 \ti { bes'4 c,8 ~ } c4 \ti { c'4 a,8 ~ | a4 a'8 ~ a4 d,8 ~ } d4 d |
  } \new Voice { \hideNotes \showStaffSwitch \override NoteColumn.ignore-collision = ##t s1 | s2. \ti { r4 c''8 | \cright a4 } } >>
  \t { q4 a,,8 ~ a4 a'8 ~ a4 a,8 } a'4 |

  \t { <bes bes'>8-> q-> q-> } q8-> r \t { <bes, bes'>8-> q-> q-> } q8-> r | \t { q8-> q-> q-> q-> q-> q-> } q4-_-> \t { bes'4 bes'8 } |
  <c, g' c>4 \t { c8 c' c, } <bes f' bes>4 \t { bes8 bes' bes, } | <aes ees' aes>4 \t { aes8 aes' aes, } <ges des' ges>4 \t { ges8[ ges'] <f des'>\arpeggio ~ } |

  \key des \major
  q1 | <ges des'>2.\arpeggio ~ \t { q4 <aes ees'>8\arpeggio ~ } | q1 | <des, aes'>2\arpeggio <c aes'>\arpeggio |

  <bes f'>2\arpeggio <a f'>\arpeggio | <aes f'>\arpeggio <g g'>\arpeggio |
  ees4 f ges \t { g4 aes8 ~ aes4 ees8 } <aes, aes'>4 \t { q4 q8 r4 a8 } |

  <e e'>4 <fis fis'> <g g'> \t { <gis gis'>4 <a a'>8 ~ q4 q8 } q4-_ \t { q8 q q a'[ a,] <fis fis'> ~ }

  % A''
  \key d \major
  \voiceFour \t { q4 d'8 } \hs 0.3 fis4 \t { fis,4 d'8 \hs 0.3 g a d, } | \oneVoice \t { <g, g'>4 g8 } g'4 \t { g,4 d'8 g,[ g'] <a, a'> ~ }
  \voiceFour \t { q4 e'8 } \hs 0.3 a4 \t { a,4 e'8 \hs 0.3 cis' e a, } | \oneVoice <d, d'>4 \t { d8 d' d, } <cis cis'>4 \t { cis8 cis' cis, }

  <b b'>4-_ q-_ <bes bes'>-_ q-_ | <a a'>-_ q-_ <gis gis'>-_ q-_ |
  <e e'>4 <fis fis'> <g g'> \t { gis'8[ gis,] <a a'> ~ q4 e'8 } a,4 \t { <a a'>4 <ais ais'>8 r4 <b b'>8 ~ }

  \voiceFour \t { q4 b8 } \hs 0.3 b'4 <cis, cis'>4 \t { \hs 0 cis8 cis' cis, } | \oneVoice <d d'>4 \t { d8 d' d, } <g, g'>4 \t { <fis fis'>4 <e e'>8 ~ }
  \voiceFour \t { q4 e8 } \hs 0.3 e'4 <a, a'> \t { \hs 0 g8 fis' e } | \oneVoice <d d'>4 \t { d8 d' d, } <cis cis'>4 \t { cis8 cis' cis, }

  <b b'>4-_ q-_ <bes bes'>-_ q-_ | <a a'>-_ q-_ <gis gis'>-_ q-_ |
  <e e'>4 <fis fis'> <g g'> \t { gis'8[ gis,] <a a'> ~ q4 e'8 } a,4 \t { a'8[ r g] fis r <d d'> }

  \t { r4 d8 d'[ r d'] <a, a'>[ r a'] \handBracket ##f -1 \tadj #'(-4 . -4.5) \parenthesize a' r <g,, g'> ~ | q4 <fis fis'>8 <e e'>4 a8 <d, d'> fis a } d8 r |
} >>

dynamics = {
  s1\mp s8*9 s2\<
  s1\! s1*3
  s1 s2. s4\<
  s1\mf\cresc s2 s2\f

  s1*3 s2 s\>
  s1*2\! s1\< s4 s\! s\> \ti { s4 s8\! }
  s1 s2. s4\mf

  s1*10 \once \override Hairpin.Y-offset = 3 s1\> s2\! s\mf |

  s1 s2. s4\< s1\! s2 s\<
  s1*3\!\cresc s4 s\f s2

  s1*3 s2 s\>
  s1*2\! s1\< s4 s\! s2
  s1*3 s2 s\>
  s1*2\! s1\< s4 s\! s\> \ti { s4 s8\! }

  s1 s2. s4\mf
  s2\> s2\!

  s1*7\mp s1\<

  s1*3\mf s2 s2\<
  s1*3\! s1\<
  s1*2\f s1\cresc s2 s4\! \ti { s4 s8^\markup { \right-align { \italic "sub." \dynamic "p" } } }

  s1*4
  s1*2\cresc s1\mp\< s4 s\mf s2 s1\< s2 s\f |
  s1*3 s2 s\>
  s1*2\! s1\< s4 s\! s2
  s1*3 s2 s\>
  s1*2\! s1\< s4 s\! s2\>
  s1\mf
}

pedal = {
  s1 s8*9 s2
  s1*4

  s1\ped s2. s4\ped s1\ped s2. \ti { s4 s8\ped }

  s1 s2.\ped \ti { s4 s8\ped } s1 s2\ped s\ped
  s1*2\pedr s4\ped s\ped s\ped \ti { s4\ped s8\ped } | s4 s\ped s2\pedr |

  s1*2

  s1*4
  s1*4
  s1*2 | s4\ped s\ped s\ped \ti { s4\ped s8\ped } | s2 s\pedr

  s1*2 s2 s4\ped \ti { s4\ped s8\ped } | s4 s\pedr \ti { s4\ped s8\ped s4 s8\ped } |
  s2 s\ped s\ped s\ped | s4\ped s\ped s\ped \ti { s4 s8\ped } | s4 s\pedr s\ped \ti { s4\ped s8\ped } |

  s1 s2.\ped \ti { s4 s8\ped } s1 s2\ped s\ped
  s1*2\pedr s4\ped s\ped s\ped \ti { s4\ped s8\ped } | s4 s\ped s\ped \ti { s4\ped s8\ped } |

  s2 s\ped s2\ped s4\ped \ti { s4\ped s8\ped } s2 s\ped s\ped s\ped
  s1*2\pedr s4\ped s\ped s\ped \ti { s4\ped s8\ped } | s4 s\ped s2\pedr |

  s1*2 s1

  s1*8

  s4\ped \ti { s4 s8\ped } s4 \ti { s4 s8\ped } | \ti { s4 s8\pedr s4 s8\ped } s2 |
  s4\ped \ti { s4 s8\ped s4 s8\pedr } s4 | s1
  s4\ped \ti { s4 s8\ped } s4 \ti { s4 s8\ped } | \ti { s4 s8\ped } \ti { s4 s8\ped } s4 s\ped |
  s4\ped \ti { s4 s8\pedr } s4 \ti { s4\ped s8\pedr } | \ti { s8 s4\ped s8\pedr s4\ped s8\pedr s4\ped s8\pedr s4 } |

  s4\ped s\pedr s4\ped s\pedr | s2\ped s\pedr | s2\ped s\ped s\ped s4\ped \ti { s4 s8\ped } |

  s1 s2.\ped \ti { s4 s8\ped } s1 s2\ped s\ped
  s2\ped s\ped s\ped s\ped | s4\ped s\ped s\ped \ti { s4\ped s8\ped } | s4 s\ped s\ped s\ped |
  s4\ped s\ped s\ped \ti { s4\ped s8\ped } | s4 s\pedr s4\ped \ti { s4 s8\ped }

  s1 s2.\ped \ti { s4 s8\ped } s1 s2\ped s\ped
  s1*2\pedr s4\ped s\ped s\ped \ti { s4\ped s8\ped } | s4 s\ped s\ped \ti { s4\ped s8\ped } |

  s2 s\ped s2\ped s4\ped \ti { s4\ped s8\ped } s2 s\ped s\ped s\ped
  s1*2\pedr s4\ped s\ped s\ped \ti { s4\ped s8\ped } | s4 s\ped s2\pedr |
}

\score {
  <<
    \new PianoStaff <<
      \new Staff = "right" \with { \consists "Span_arpeggio_engraver" } \right
      \new PianoDynamics = "dynamics" \dynamics
      \new Staff = "left" \left
      \new PianoPedal = "pedal" \pedal
    >>
  >>
  \layout {}
  \midi {}
}