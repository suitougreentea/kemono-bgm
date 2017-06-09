\version "2.19.59"

\include "stylesheet.ily"

t = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \tuplet 3/2 4 $notes #}
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

cleft = \change Staff = "left"
cright = \change Staff = "right"

ped = \sustainOn
pedr = \sustainOff
pedre = \sustainOff\sustainOn

\header {
  title = "けものパレード"
  subtitle = \markup { \jp-sans-semibold "～ジャパリパークメモリアル～" }
  nickname = "（すやすやぽわわんのやつ）"
  revision = "Revision 2 (Unfinished)"
  date = "2017/6/10"
}

\paper {
  page-count = 7
  system-count = 36
  min-systems-per-page = 5
  max-systems-per-page = 6
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
  \time 12/8
  \set Score.tempoHideNote = ##t
  \tempo \markup {
    \concat {
      \smaller \general-align #Y #DOWN \note #"4." #1
      \normal-text " = "
      \smaller \general-align #Y #DOWN \note #"4" #1
      \normal-text " = 155"
    }
  } 4. = 155
  s1.*51
  \bar "||"
  s1.*20
  \bar "||"
  s1.*10
  \bar "||"
  s1.*18
  \bar "||" \break
  \tempo \markup {
    \concat {
      \smaller \general-align #Y #DOWN \note #"4" #1
      \normal-text " = ca. 100"
    }
  } 4 = 100
  \time 6/8
  \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \mark \markup { \fontsize #-2 \musicglyph #"scripts.ufermata" }
  s8*12
  \bar "||"
  \time 4/4
  s1*3
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
    \voiceOne e8 a b d cis b a d e g fis e | d g a d cis b <a a'>2.\arpeggio
  } \\ {
    \voiceTwo <g,, b d>2. \once \override Arpeggio.X-offset = -1 <g b d g>\arpeggio | <b e g b>\arpeggio <a d>8 q q <e' b'>4 <d a'>8 ^~
  } >>

  % A
  << \context Voice = "2" {
    \oneVoice <d a'>4 \cleft \voiceOne a8 b4 d8 e4 d8 e4 d8 | \cright \oneVoice <g, b fis'>4. <b d a'>4 <g d'>8 <b d> q q <d b'>4 <cis a'>8 ~ |
    q4 \cleft \voiceOne a8 b4 d8 e4 d8 e4 d8 | \cright \oneVoice <a d fis>4. <d a'>4 <a d>8 a'( g fis e d b)
  } \new Voice {
    \voiceTwo \cleft s4. <d, fis>4. \rp 0 r8 <fis a>4 q4. | s1. |
    s4. <cis e>4. \rp 0 r8 <e a>4 <a cis>4. | s1. |
  } >>

  <a d fis>8[ r e'] ~ e4 d8 <bes' d fis>8[ r e] ~ e4 d8 |
  <a, d fis>8[ r e'] ~ e4 d8 \acciaccatura ais''8 <d, fis b>8[ r e] ~ e4 d8
  <e,, g b>4. <fis a cis> <g b d> <gis b d e>4 <d' e b'>8 ~ q4 <cis e a>8 q4. <e cis'>8[ r q] r4 <fis a d>8

  r2. <a a'>8 r r r4 <g g'>8 ~ | q4 fis'8 e4 a8 d,4 r8 a, b cis \break |

  \repeat volta 2 {
    << {
      d8 \rp 0 r \rp 0 r a8 b cis d8 \rp 0 r \rp 0 r d8 e fis \noBreak |
      << { g4 fis8 fis8 \rp 0 r \rp 0 r e \rp 0 r \rp 0 r } \ossia { \key d \major g4^\markup "2x:" fis8 fis4 e8 e8 r r } >> b8 cis d |
      e8 \rp 0 r \rp 0 r b8 cis d e8 \rp 0 r \rp 0 r e8 fis g |
      a4 g8 g4 fis8 fis8 \rp 0 r \rp 0 r fis4 e8 |
       } \\ {
      <fis, a>8 s s fis r r a s s <fis a> r r | <b d> r r q s s q s s g r r |
      <a cis>8 s s a r r cis s s <a cis> r r | <ais cis e> r r q8[ r e'] <cis e>8 s s <ais cis> r r |
    } >>

    <fis a d>8 r r \voiceOne <b' d fis>8[ r e] <d fis a> r r \oneVoice << { << { fis,4 e8 } \\ { <a, d>8 r r } >> | \noBreak
    <g b d>8 r r } \ossia { \key d \major fis'8^\markup "2x:" fis e d8 r r } >> \voiceOne <b' d fis>8[ r e] <d fis a>8 r r \oneVoice r4. |
    \voiceOne \cleft <fis,, gis b e>8 r r \cright <b' d fis> r r \cleft <fis, gis b e>8 r r \cright <b' d fis> r r |
    \cleft <e,, b' e>8 r r <e e'> r r e' \cright \oneVoice c'( cis d dis e)

    \voiceOne \cleft <fis,, gis b d>8 r r \cright <b' d e> r r \cleft <fis, gis b d>8 r r \cright <b' d e> r r |
    \cleft e,8 r r <e, e'> r r <e b' e> \cright \oneVoice ees''( d des c b)
    \cleft \voiceOne <fis, a d>4. <e a cis> <d a' b> <e a cis>4 <fis a d>8 ~ |
    q4 \cright \oneVoice d'8( e fis a << { \voiceOne d8) r r r4. } \new Voice { \voiceTwo d,4. e } >> \oneVoice

    << {
      f4 e8 f4 e8 f4. e4 f8 ~ | f4 e8 f4 e8 f4. e'4 f8 ~ |
      f4 e8 f4 e8 f4.
       } \\ {
      <a,, c>2. ~ q4. q4 <g c>8 ~ | q2. ~ q4. <g' c>4 <a c>8 ~ |
      q2. ~ q4.
    } >> <a c e g>4 <c f a>8 ~ q4 <c e g>8 q4 r8 <g c e g>4 <f bes d f>8 ~ q4 <e a cis e>8 ~

    q2. r2. | r4. r8 e e' e8 r r \ottava 1 e'8 e'4 \ottava 0 |
    <e,,, gis b e>4 q8 <fis b d fis>4 q8 <gis b d gis>4. << { \oneVoice <b d e b'>4 \voiceOne a'8 ~ | a4. r } \\ { s4 <a, d e>8 ~ q4 q8 q4 r8 } >>
    <d, a' d>8 q q <b' e b'>4 <a d fis a>8 ~

    % A'
    << {
      \oneVoice q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 | \cright \oneVoice <g, b fis'>4. <b d a'>4 <g d'>8 <d' b' d> q q <b' d b'>4 <a cis e a>8 ~ |
      q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 | \cright \oneVoice <a d fis>4. <d a'>4 <a d>8 a'( g fis e d b)
    } \new Voice {
      \voiceTwo \cleft s4. <d, fis>4. \rp 0 r8 <fis a>4 q4. | s1. |
      s4. <cis e>4. \rp 0 r8 <e a>4 <a cis>4. | s1. |
    } >>

    <a d fis>8[ r e'] ~ e4 d8 <bes' d fis>8[ r e] ~ e4 d8 |
    <a, d fis>8[ r e'] ~ e4 d8 \acciaccatura ais''8 <d, fis b>8[ r e] ~ e4 d8
    <b, e g b>4. <cis fis a cis> <d g b d> <e gis b d e>4 <b' d e b'>8 ~ q4 <a cis e a>8 q4. <d, a' d>8 q q <b' e b'>4 <a d fis a>8 ~

    << {
      \oneVoice q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 | \cright \oneVoice <a d fis>4. <d a'>4 <a d>8 <d g d'> q q <b' e b'>4 <a d fis a>8 ~ |
      q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 | \cright \oneVoice <a d fis>4. <d a'>4 <a d>8 a'( g fis e d b)
    } \new Voice {
      \voiceTwo \cleft s4. <d, fis>4. \rp 4 r8 <a' cis>4 q4. | s1. |
      s4. <e g>4 \rp 2 r8 <a cis>4. q4. | s1. |
    } >>

    <a d fis>8[ r e'] ~ e4 d8 <bes' d fis>8[ r e] ~ e4 d8 |
    <a, d fis>8[ r e'] ~ e4 d8 \acciaccatura ais''8 <d, fis b>8[ r e] ~ e4 d8
    <e,, g b>4. <fis a cis> <g b d> <gis b d e>4 <d' e b'>8 ~ q4 <cis e a>8 q4. <e cis'>8[ r q] r4 <fis a d>8

    r2. <a a'>8 r r r4 <g g'>8 ~ |
  }
  \alternative {
    { <g g'>4 fis'8 e4 a8 d,4 r8 a, b cis | }
    { <g' g'>4\repeatTie fis'8 e4 a8 d,4. r | }
  }

  \key f \major
  bes,8[ r d] f[ r a,] r4 d8 f[ r c] | r4 g'8 r4 f8 r4. d8[ r f] |
  g8[ r a] bes[ r a] r4 g8 r4 f8 | r4 <c f>8 r4 <bes f'>8 <a f'> r r r4. |

  bes'8[ r d] f[ r a,] r4 d8 f[ r c] | r4 g'8 r4 f8 r4. d8[ r f] |
  a8[ r bes] c[ r a] r4 g8 r4 f8 | r4 f,8 c'8[ r bes] a[ r bes] c[ r f] |

  <d,, f bes>4 <f d'>8 <a f'>4 <g a>8 ~ q4 <bes d>8 <a f'>4 <g c>8 ~ | q4 <g a c g'>8 r4 <a f'>8 ~ q4. <g d'>4 <a f'>8 |
  <bes g'>4 <c a'>8 <d bes'>4 <c a'>8 ~ q4 <bes g'>8 r4 <a f'>8 | r4 <f c'>8 r4 <f bes>8 <f a> c' d f g a

  << {
    <d, d'>4. <f f'>4 <c c'>8 ~ q4. <d d'>4 \tieNeutral <c g' c>8 ~ |
    \oneVoice q4 \handBracket ##t 0.5 <\parenthesize a a'>8 <g' e' g>4 <f d' f>8 ~ q4. \voiceOne a'16 g f e d c |
     } \\ {
    bes4 d8 s4 a8 ~ a4 d,8 f4 c8 | s2. s4. <a' d> |
  } >>
  \handBracket ##t 0.5 <\parenthesize a, bes'>4 <bes a'>8 <c bes'>4 <f a f'>8 r4 <bes, g' bes>8 <c c'> <cis cis'> <d f d'> |
  <e g e'>[ r <g g'>] <c a' c>[ r <bes g' bes>] <a f' a>[ r <bes g' bes>] <c a' c>[ r <f a f'>]

  <d f bes d>8-> q-> q-> q8-> r r q8-> q-> q-> q8-> r r |
  <d f d'>8-> <e g e'>-> <d f d'>-> <e g e'>-> <d f d'>-> <e g e'>-> <d f d'>4-> r8 r g, bes |
  <e, g c>4. ~ q8 bes' c <d, f bes d>4. bes'8 c d |
  <ees, aes c ees>4. <c c'>8 <bes bes'> <c c'> << { <bes' des>8 q q } \\ des,4. >> <bes' ees bes'>4 <aes des aes'>8\arpeggio ~

  \key des \major
   q4 aes,8 bes4 des8 ees4 des8 ees4 des8 | f4. aes4 des,8 <bes' des>8 q q <bes des bes'>4 <aes c aes'>8\arpeggio ~ |
   q4 aes,8 bes4 des8 ees4 des8 ees4 des8 | f4. aes4 des,8 ~ << { \voiceTwo des2. } \new Voice { \voiceOne aes''8( ges f ees des bes) } >> \oneVoice |

  \set Staff.connectArpeggios = ##t
  << {
    <des, f>4\arpeggio ees8 ~ ees4 des8 <des f>4\arpeggio ees8 ~ ees4 des8 |
    <des f>4\arpeggio ees8 ~ ees4 des8 <f bes>4\arpeggio ees8 ~ ees4 des8
  } \\ {
    aes2.\arpeggio a\arpeggio | bes\arpeggio des\arpeggio |
  } >>
  <ees, ges bes>4. <f aes c> <ges bes des> <g bes des ees>4 <des' ees bes'>8 ~ |

  q4 <c ees aes>8 q4. <aes' c aes'>8 q q q4 <a cis e a>8 ~ |
  q2. ~ q4. ~ q4 <b d fis b>8 ~ q4 <a cis e a>8 q4 r8 <b e g b> q q q4 <a d fis a>8 ~

  % A''
  \key d \major
  << {
    \oneVoice q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 | \cright \oneVoice <g, b fis'>4. <b d a'>4 <g d'>8 <b' d g b> q q q4 <a cis e a>8 ~ |
    q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 | \cright \oneVoice <fis, a fis'>4. <d' a'>4 <a d>8 a'( g fis e d b)
  } \new Voice {
    \voiceTwo \cleft s4. <d, fis> \rp 0 r8 <fis a>4 q4. | s1. |
    s4. <cis e> \rp 0 r8 <e a>4 <a cis>4. | s1. |
  } >>

  <a d fis>8[ r e'] ~ e4 d8 <bes' d fis>8[ r e] ~ e4 d8 |
  <a, d fis>8[ r e'] ~ e4 d8 \acciaccatura ais''8 <d, fis b>8[ r e] ~ e4 d8
  <b, e g b>4. <cis fis a cis> <d g b d> <e gis b d e>4 <b' d e b'>8 ~ q4 <a cis e a>8 q4. <d, a' d>8 q q <b' e b'>4 <a d fis a>8 ~

  << {
    \oneVoice q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 | \cright \oneVoice <a fis'>4. <d a'>4 <a d>8 <d g d'> q q <b' e b'>4 <a d fis a>8 ~ |
    q4 \cleft \voiceOne a,8 b4 d8 e4 d8 e4 d8 | \cright \oneVoice <a d fis>4. <d a'>4 <a d>8 a'( g fis e d b)
  } \new Voice {
    \voiceTwo \cleft s4. <d, fis> \rp 4 r8 <a' cis>4 q4. | s1. |
    s4. <e g> \rp 2 r8 <a cis>4 q4. | s1. |
  } >>

  <a d fis>8[ r e'] ~ e4 d8 <bes' d fis>8[ r e] ~ e4 d8 |
  <a, d fis>8[ r e'] ~ e4 d8 \acciaccatura ais''8 <d, fis b>8[ r e] ~ e4 d8
  <e,, g b>4. <fis a cis> <g b d> <gis b d e>4 <d' e b'>8 ~ q4 <cis e a>8 q4. <e cis'>8[ r q] r4 <fis a d>8

  r2. <a a'>8 r r r4 <g g'>8 ~ | q4 fis'8 e4 a8 d, fis a <d, fis d'>8 r r |

  fis8-_ e-_ d-_ fis-_ e-_ d-_ | fis-_ e-_ d-_ b'-_ e,-_ d-_ |
  <g, b>8-_ r <a cis>-_ r <b d>-_ r <cis e>-_ <fis b>-_ |
  \override TextSpanner.bound-details.left.text = "rit."
  r\startTextSpan <e a>-_ <e a>-_ r \t { fis[ r fis] r e r\stopTextSpan } | d1\fermata
} >>

left = << \global \relative {
  \clef bass
  fis8-_ d'-_ fis,-_ d'-_ g,-_ d'-_ g,-_ d'-_ | a-_[ e'-_ a,-_ d-_] fis-_ g-_[ g16 g] b,8-_[ a-_] | fis-_ g-_ a-_ cis-_ |
  d8-_ fis-_ d-_ a'-_ cis,-_ fis-_ cis-_ a'-_ | b,-_ fis'-_ b,-_ a'-_ a,-_ cis-_ a-_ e'-_ |
  g,-_ d'-_ g,-_ d'-_ fis,-_ d'-_ fis,-_ d'-_ | e,-_ d'-_ e,-_ d'-_ a-_ d-_ a-_ e'-_ |

  d2 d | d4 d d \t { e,8 b e, } |

  % A
  <a, a'>1.-> ~ | q2. ~ q4. a''8[ a,] <fis, fis'> ~ |
  \voiceFour q4 d'8 \hs 0.3 fis4. fis,4 d'8 \hs 0.3 g a d, | \oneVoice <g, g'>4 g8 g'4. g,4 d'8 g,[ g'] <a, a'> ~
  \voiceFour q4 e'8 \hs 0.3 a4. a,4 e'8 \hs 0.3 cis' e a, | \oneVoice <d, d'>4. d8 d' d, <cis cis'>4. cis8 cis' cis,

  <b b'>4.-_ q-_ <bes bes'>-_ q-_ | <a a'>-_ q-_ <gis gis'>-_ q-_ |
  <e e'>4. <fis fis'> <g g'> gis'8[ gis,] <a a'> ~ q4 e'8 a,4. a'8[ r g] fis r <d d'>

  r4 d8 d'[ r d'] <a, a'>[ r a'] \handBracket ##f -1 \parenthesize a' r <g,, g'> ~ | q4 <fis fis'>8 <e e'>4 a8 <d, d'>4 r8 r4. |

  \repeat volta 2 {
    fis4. d'4 fis8 r2. | g,4. d'4 g8 r2. |
    a,4. e'4 a8 r2. | ais,4. fis'4 ais8 r4. ais, |

    b8 r r \cright \voiceTwo fis''8[ r e] d8 r r \cleft \oneVoice r4. |
    e,,8 r r \cright \voiceTwo fis''8[ r e] d8 r r \cleft \oneVoice r4. |
    \voiceTwo e,,8 r r \cright e'' r r \cleft e,, r r \cright e'' r r |
    \cleft <e,, e'>8( <fis fis'> <g g'> <a a'> <b b'> <cis cis'> <e b' e>8) \oneVoice r r r4.

    \voiceTwo e,8 r r \cright e'' r r \cleft e,, r r \cright e'' r r |
    \cleft <e, b' e>8( <d d'> <cis cis'> <b b'> <a a'> <g g'> <e e'>8) \oneVoice r r r4.
    \voiceTwo a4. a a4 a8 a,4 d8 ~ | d4 \oneVoice d8 d'4 d,8 d'4. e |

    d,4.-_ d-_ d-_ d4 c8 ~ | c4.-_ c-_ c-_ c4 b8 ~ |
    b4 b'8 b,4 b'8 b,4 b'8 b,[ b'] c, ~ | c4 c'8 c,4 r8 <c c'>4 <bes bes'>8 ~ q4 <a a'>8 ~ |

    << \new Voice {
      \voiceOne a' e' a <a cis e>4. r8 g b <g d' e>4. |
      r8 fis a <fis d' e>4. r8 f a <f d' e>4.
    } { \voiceTwo <a,, a'>2. <g g'> | <fis fis'> <f' f'> | } >> \oneVoice
    <e e'>4. q e8 e' e, e4 <a, a'>8 ~ | q4 q8 q4 r8 a a' g, <g g'>4 <fis fis'>8 ~ |

    % A'
    \voiceFour q4 d'8 \hs 0.3 fis4. fis,4 d'8 \hs 0.3 g a d, | \oneVoice <g, g'>4 g8 g'4. g,4 d'8 g,[ g'] <a, a'> ~
    \voiceFour q4 e'8 \hs 0.3 a4. a,4 e'8 \hs 0.3 cis' e a, | \oneVoice <d, d'>4. d8 d' d, <cis cis'>4. cis8 cis' cis,

    <b b'>4.-_ q-_ <bes bes'>-_ q-_ | <a a'>-_ q-_ <gis gis'>-_ q-_ |
    <e e'>4. <fis fis'> <g g'> gis'8[ gis,] <a a'> ~ q4 e'8 a,4. <a a'>4 <ais ais'>8 r4 <b b'>8 ~

    \voiceFour q4 b8 \hs 0.3 b'4. <cis, cis'> \hs 0 cis8 cis' cis, | \oneVoice <d d'>4. d8 d' d, <g, g'>4. <fis fis'>4 <e e'>8 ~
    \voiceFour q4 e8 \hs 0.3 e'4. <a, a'> \hs 0 g8 fis' e | \oneVoice <d d'>4. d8 d' d, <cis cis'>4. cis8 cis' cis,

    <b b'>4.-_ q-_ <bes bes'>-_ q-_ | <a a'>-_ q-_ <gis gis'>-_ q-_ |
    <e e'>4. <fis fis'> <g g'> gis'8[ gis,] <a a'> ~ q4 e'8 a,4. a'8[ r g] fis r <d d'>

    r4 d8 d'[ r d'] <a, a'>[ r a'] \handBracket ##f -1 \parenthesize a' r <g,, g'> ~ |
  }
  \alternative {
    { q4 <fis fis'>8 <e e'>4 a8 <d, d'>4 r8 r4. | }
    { <g g'>4\repeatTie <fis fis'>8 <e e'>4 a8 <d, d'>4. r | } \break
  }

  \key f \major
  R1. | R | R | R |
  \clef treble
  bes''8[ r d] f[ r a,] r4 d8 f[ r c] | r4 g'8 r4 f8 r4. d8[ r f] |
  a8[ r bes] c[ r a] r4 g8 r4 f8 | R1. |

  \clef bass
  <bes,,, bes'>4. q4 <c c'>8 ~ q4. <bes bes'>4 <a a'>8 ~ | q4 <c c'>8 r4 <d d'>8 ~ q4. d |
  <g, g'>4. q4 <c c'>8 ~ q4 q8 ~ q4 <f, f'>8 | r4 q8 r4 q8 q4. g'4 a8

  << {
    \voiceOne bes4 d8 f4 a,8 ~ a4 d8 f4 a,8 ~ a4 g'8 ~ g4 d8 ~ d4. d4 f8 |
    \oneVoice <g, g'>4. g4 g,8 ~ g4 g'8 ~  g4 <a, a'>8 ~ |
  } \new Voice {
    \voiceTwo bes4. bes'4 c,8 ~ c4. c'4 a,8 ~ | a4 a'8 ~ a4 d,8 ~ d4. d |
  } \new Voice { \hideNotes \showStaffSwitch \override NoteColumn.ignore-collision = ##t s1. | s2. s4. s4 c''8 | \cright a4 } >>
  q4 a,,8 ~ a4 a'8 ~ a4 a,8 a'4. |

  <bes bes'>8-> q-> q-> q8-> r r <bes, bes'>8-> q-> q-> q8-> r r | q8-> q-> q-> q-> q-> q-> q4-> r8 bes'4 bes'8 |
  <c, g' c>4. c8 c' c, <bes f' bes>4. bes8 bes' bes, | <aes ees' aes>4. aes8 aes' aes, <ges des' ges>4. ges8[ ges'] <f des'>\arpeggio ~ |

  \key des \major
  q1. | <ges des'>2.\arpeggio ~ q4. ~ q4 <aes ees'>8\arpeggio ~ | q1. | <des, aes'>2.\arpeggio <c aes'>\arpeggio |

  <bes f'>2.\arpeggio <a f'>\arpeggio | <aes f'>\arpeggio <g g'>\arpeggio |
  ees4. f ges g4 aes8 ~ aes4 ees8 <aes, aes'>4. q4 q8 r4 a8 |

  <e e'>4. <fis fis'> <g g'> <gis gis'>4 <a a'>8 ~ q4 q8 q4 r8 q q q a'[ a,] <fis fis'> ~

  % A''
  \key d \major
  \voiceFour q4 d'8 \hs 0.3 fis4. fis,4 d'8 \hs 0.3 g a d, | \oneVoice <g, g'>4 g8 g'4. g,4 d'8 g,[ g'] <a, a'> ~
  \voiceFour q4 e'8 \hs 0.3 a4. a,4 e'8 \hs 0.3 cis' e a, | \oneVoice <d, d'>4. d8 d' d, <cis cis'>4. cis8 cis' cis,

  <b b'>4.-_ q-_ <bes bes'>-_ q-_ | <a a'>-_ q-_ <gis gis'>-_ q-_ |
  <e e'>4. <fis fis'> <g g'> gis'8[ gis,] <a a'> ~ q4 e'8 a,4. <a a'>4 <ais ais'>8 r4 <b b'>8 ~

  \voiceFour q4 b8 \hs 0.3 b'4. <cis, cis'> \hs 0 cis8 cis' cis, | \oneVoice <d d'>4. d8 d' d, <g, g'>4. <fis fis'>4 <e e'>8 ~
  \voiceFour q4 e8 \hs 0.3 e'4. <a, a'> \hs 0 g8 fis' e | \oneVoice <d d'>4. d8 d' d, <cis cis'>4. cis8 cis' cis,

  <b b'>4.-_ q-_ <bes bes'>-_ q-_ | <a a'>-_ q-_ <gis gis'>-_ q-_ |
  <e e'>4. <fis fis'> <g g'> gis'8[ gis,] <a a'> ~ q4 e'8 a,4. a'8[ r g] fis r <d d'>

  r4 d8 d'[ r d'] <a, a'>[ r a'] \handBracket ##f -1 \parenthesize a' r <g,, g'> ~ | q4 <fis fis'>8 <e e'>4 a8 <d, d'> fis a d8 r r |

  \clef treble
  d'8-_[ r a'-_] cis,-_[ r a'-_] | b,-_[ r fis'-_] a,-_[ r e'-_] |
  b8-_ r cis-_ r d-_ r e-_ b'-_ | r a-_ a-_ r \t { fis[ r fis] r e r } | d1\fermata
} >>

dynamics = {
  s1\mp s8*9 s2\<
  s1\! s1*3
  s1 s2. s4\<
  s1.\mf\cresc s2. s2.\f

  s1.*3 s2. s\>
  s1.*2\! s1.\< s4. s\! s\> s4 s8\!
  s1. s2. s4. s\mf

  s1.*10 \once \override Hairpin.Y-offset = 3 s1.\> s2.\! s\mf |

  s1. s2. s4. s\< s1.\! s2. s\<
  s1.*3\!\cresc s4. s\f s2.

  s1.*3 s2. s\>
  s1.*2\! s1.\< s4. s\! s2.
  s1.*3 s2. s\>
  s1.*2\! s1.\< s4. s\! s\> s4 s8\!

  s1. s2. s4. s\mf
  s2.\> s\!

  s1.*7\mp s1.\<

  s1.*3\mf s2. s\<
  s1.*3\! s1.\<
  s1.*2\f s1.\cresc s2. s4.\! s4 s8^\markup { \right-align { \italic "sub." \dynamic "p" } }

  s1.*4
  s1.*2\cresc s1.\mp\< s4. s\mf s2. s1.\< s2. s\f |
  s1.*3 s2. s\>
  s1.*2\! s1.\< s4. s\! s2.
  s1.*3 s2. s\>
  s1.*2\! s1.\< s4. s\! s2.\>
  s1.*2\mf

  s8*12\mp s1 s2 s\> s1\p
}

pedal = {
  s1 s8*9 s2
  s1*4

  s1\ped s2. s4\ped
  s1.\ped s2. s4. s4 s8\ped

  s1. s2.\ped s4. s4 s8\ped s1. s2.\ped s\ped
  s1.*2\pedr s4.\ped s\ped s\ped s4\ped s8\ped | s4. s\ped s2.\pedr |

  s1.*2

  s1.*4
  s1.*4
  s1.*2 | s4.\ped s\ped s\ped s4\ped s8\ped | s2. s\pedr

  s1.*2 s2. s4.\ped s4\ped s8\ped | s4. s\pedr s4\ped s8\ped s4 s8\ped |
  s2. s\ped s\ped s\ped | s4.\ped s\ped s\ped s4 s8\ped | s4. s\pedr s\ped s4\ped s8\ped |

  s1. s2.\ped s4. s4 s8\ped s1. s2.\ped s\ped
  s1.*2\pedr s4.\ped s\ped s\ped s4\ped s8\ped | s4. s\ped s\ped s4\ped s8\ped |

  s2. s\ped s\ped s4.\ped s4\ped s8\ped s2. s\ped s\ped s\ped
  s1.*2\pedr s4.\ped s\ped s\ped s4\ped s8\ped | s4. s\ped s2.\pedr |

  s1.*2 s1.

  s1.*8

  s4.\ped s4 s8\ped s4. s4 s8\ped | s4 s8\pedr s4 s8\ped s2. |
  s4.\ped s4 s8\ped s4 s8\pedr s4. | s1.
  s4.\ped s4 s8\ped s4. s4 s8\ped | s4 s8\ped s4 s8\ped s4. s\ped |
  s4.\ped s4 s8\pedr s4. s4\ped s8\pedr | s8 s4\ped s8\pedr s4\ped s8\pedr s4\ped s8\pedr s4 |

  s4.\ped s\pedr s\ped s\pedr | s2.\ped s\pedr | s2.\ped s\ped s\ped s4.\ped s4 s8\ped |

  s1. s2.\ped s4. s4 s8\ped s1. s2.\ped s\ped
  s2.\ped s\ped s\ped s\ped | s4.\ped s\ped s\ped s4\ped s8\ped | s4. s\ped s\ped s\ped |
  s4.\ped s\ped s\ped s4\ped s8\ped | s4. s\pedr s\ped s4 s8\ped

  s1. s2.\ped s4. s4 s8\ped s1. s2.\ped s\ped
  s1.*2\pedr s4.\ped s\ped s\ped s4\ped s8\ped | s4. s\ped s\ped s4\ped s8\ped |

  s2. s\ped s2.\ped s4.\ped s4\ped s8\ped s2. s\ped s\ped s\ped
  s1.*2\pedr s4.\ped s\ped s\ped s4\ped s8\ped | s4. s\ped s2.\pedr |
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