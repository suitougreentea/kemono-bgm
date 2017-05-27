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


\header {
  title = "二人でお茶を"
  subtitle = \markup { \center-column { \normal-text \italic "Completed version" \bold \italic "Faithful copy for 4 hands" } }
  composer = \markup \override #'(baseline-skip . 2.5) \right-column { "Original song by Vincent Youmans" "Performed by Edward Johnson" }
  revision = "Revision 2 (Unfinished)"
  date = "2017/5/4"
}

\paper {
  page-count = 11
  system-count = 33
  max-systems-per-page = 3
}

global = {
  \key aes \major
  \time 4/4
  \tempo 4 = 141

  s1*26
  \bar "||"

  s1*8
  \bar "||"

  s1*33 s2.
  \footnote \markup \null #'(0 . 0) \markup {
    \super "*" "The region"
    \override #'(thickness . 2)
    \override #'(on . 0.4)
    \override #'(off . 0.3)
    \translate #'(0 . -2) \draw-dashed-line #'(0 . 5)
    "~"
    \override #'(thickness . 2)
    \override #'(on . 0.4)
    \override #'(off . 0.3)
    \translate #'(0 . -2) \draw-dashed-line #'(0 . 5)
    "is skipped in the anime."
  } \mark \markup \larger "*" \bar "!" \noBreak s4

  s1*8
  \bar "||"

  s1*8
  \bar "||"

  s1*7 s2. \bar "!" \noBreak s4

  s1*8
  \bar "|."
}

rr = << \global \relative c'' {
  \clef treble
  R1 | <c ees aes>8-. r <des f bes>8-. r <ees g c>-. <f aes des>-. r <b d>-. |

  <c ees>4( <bes des>8 <aes c> <g bes> <f aes>-.) r <g bes>( |
  <aes c>4 <g bes>8 <f aes> <g bes> <aes c>-.) r <bes des>( |
  <c ees>4 <bes des>8 <aes c> <g bes> <f aes>-.) r <g bes>( |
  << { \voiceOne <aes c>2)  } \new Voice { \voiceTwo r4 <d, f>8-. r } >> \oneVoice \tuplet 3/2 { e8-. c'-. fis,-. } g-. b,16 c |

  << {
    <aes' c>4( \acciaccatura { <g bes>16 c } <g bes>8 <f aes> \voiceOne g f-.) r g( |
    aes4 g8 f g aes-.) \oneVoice r <g bes>( |
    <aes c>4 <g bes>8 <f aes> \voiceOne g f-.) r g( |
    aes1) |
     } \new Voice {
    \voiceTwo s2 <b, d>( | <bes des> <bes c>8) r s4 | s2 \acciaccatura { bes16 des } \shape #'((0 . -2) (0 . -1.5) (0 . 0) (0 . 0)) Slur <b d>4( <bes des> | <c f>2) r2 |
  } >> \oneVoice

  << { \voiceOne \ottava 1 f4( g8. aes16 bes8. c16 des4 |
       ees8-.) \oneVoice r \voiceOne ees4 ~ ees8. \shape #'(() ((0 . 2) (0.7 . 1.7) (0 . 0.5) (0 . 0))) Slur des16( c8. bes16 |
       des8-.) r des4 ~ des8. c16( bes8. aes16 |
     } \new Voice {
       \voiceTwo <aes, des>8-. r r4 <ees' g>8-. r r4 | bes'8-. s aes4 ~ aes2 |
       r4 aes ~ aes ees8-. r |
  } >> \oneVoice
  <c aes' c>2.) ~ q8 r16 c''

  <ees, c' ees>4-> <des bes' des>8-. <c aes' c>-. <bes f' aes bes>->( <aes aes'>-.) r <bes bes'>-. |
  <c ees aes c>8-> r <bes bes'>-. <aes aes'>-. <bes f' aes bes>->( <c c'>-.) r <des des'>-. |
  <ees c' ees>8-> r <des bes' des>-. <c aes' c>-. <bes f' aes bes>-. <aes aes'>-. r <bes des ees bes'>-. |
  <aes c ees aes>8-. \ottava 0 r \tuplet 3/2 { ees,8-. <g bes>-. ees'-. } \tuplet 3/2 { e,4 <b' e>8-. } \tuplet 3/2 { f8-. c'-. f-. }

  aes4.( f8 g4. f8 | \acciaccatura bes,8 aes'4. f8 g4.) ees8( | g4. ees8 f4. ees8 | \acciaccatura aes,8 g'4. ees8 f4.) ees8( |

  aes4. f8 g4. f8 | \acciaccatura bes,8 aes'4. f8 g4.) ees8( |
  c'1) | \tuplet 3/2 { <ees, aes>8-. <f bes>-. <aes c>-. } <c ees>8-. r \tuplet 3/2 { <c f>8-. <bes ees>-. <c, g'>-. } <ees aes>8-. r16 bes' |

  \key c \major
  <c, f c'>8-. r q-.[ r16 a']( <b, f' b>8-.) r q-.[ r16 a']( |
  <c, f c'>8-.) r q-.[ r16 a']( <b, f' b>8-.) r q-. r16 \ottava 1 g''( |
  <b, e b'>8-.) r q-.[ r16 g']( <a, e' a>8-.) r q-.[ r16 g']( |
  <b, e b'>8-.) r q-.[ r16 g']( <a, e' a>8-.) r q-. r16 g'( |

  <c, f c'>8-.) r \acciaccatura { f16 g a b } q8-.[ r16 a]( <b, f' b>8-.) r \acciaccatura ais8 q-.[ r16 a']( |
  <c, f c'>8-.) r q-.[ r16 a']( <b, f' b>8-.) r <b dis g b>4
  <e g c e>1-> | <ees g bes des ees>2 \ottava 0 r2 |

  \key aes \major
  aes,4.( f8 g4. f8 \acciaccatura g | aes4. f8 g4.) ees8( |
  g4. ees8 f4. ees8 | g4. ees8 f4.) ees8( |

  aes4. f8 g4. f8 \acciaccatura g | aes4. f8 g4.) ees8( |
  << { \voiceOne ees'1) ~ | \oneVoice ees2 } \new Voice {
    \voiceTwo r4 \tuplet 3/2 { ees,8-. ges-. bes-. } c8-. r \tuplet 3/2 { bes8-. ges-. ees-. } |
  } >>
  \tuplet 3/2 { r8 <c c'>-. <des des'>-. } \tuplet 3/2 { <d d'>-. <ees ees'>-. <e e'>-. } |

  \ottava 1
  << {
    \voiceOne
    <f f'>4 r8 q <ees ees'>4 r8 q | <des des'>4 r8 q <c c'>4 r8 q |
    <ees ees'>4 r8 q <des des'>4 r8 q | <c c'>4 r8 q <bes bes'>4 r8 q |
     } \new Voice {
    \voiceTwo
    r4 bes'8-. r r4 <ges bes>8-. r | r4 a8-. r r4 f8-. r |
    r8 \acciaccatura bes <ges a>-. r4 r8 <f bes>8-. r4 | r8 <fes aes>-. r4 r8 <des fes>-. r4 |
  } >>
  \ottava 0 \oneVoice

  \shape #'((0 . -3.5) (0 . 0.8) (0 . 0.8) (0 . -3.5)) Slur aes'4.( f8 g4. f8 | aes4 \acciaccatura { f'16 ees des bes } aes8 f g4.) c8( |
  <aes, ees' aes>2) \tuplet 3/2 { <bes f'>8-. q-. <aes des>-. } \tuplet 3/2 { <des, f bes>-.[ r <aes' des>-.] } |
  \tuplet 3/2 { <e c'>-. q-. <d g>-. } \tuplet 3/2 { <c ees>4 <f a c>8-. } \tuplet 3/2 { <f aes bes d>8-. <e g bes>-. <f aes bes d>-. } r4 |

  R1 | r2 r4 r8 \ottava 1 d''8-. |

  \ottava 1
  << {
    ees'8-. r des-. c-. bes-. aes-. r bes-. | c-. r bes-. aes-. bes-. c-. r des-. |
    ees-. r des-. c-. bes-. aes-. r bes-. | c8-. r r4
  } \\ {
    ees,4( des8 c bes aes-.) r bes( | c4 bes8 aes bes c-.) r des(
    ees4 des8 c bes aes-.) r bes( | c2)
  } >> \tuplet 3/2 { e8-.[ r aes-.] } g8-. r |

  << {
    c8-. r \acciaccatura { bes16 c } bes8-. aes-. g-. f-. r g-. | aes-. r g-. f-. g-.[ aes-.]
  } \\ {
    \grace { a,16 bes b <e, g c> } c'4( bes8 aes g f-.) r g( | aes4 g8 f g[ aes-.])
  } >> \ottava 0 r8 <g bes>(
  << {
    <aes c>4 <g bes>8 <f aes> \voiceOne g f-.) r g( | aes1) |
     } \new Voice {
    \voiceTwo s2 \acciaccatura { bes,16 des } <b d>4 <bes des> | <c f>2 r2 |
  } >> \oneVoice

  << { \voiceOne \ottava 1 f4( g8. aes16 bes8. c16 des4 |
       ees8-.) \oneVoice r \voiceOne ees4 ~ ees8. des16( c8. bes16 |
       des8-.) r des4 ~ des8. c16( <ees, bes'>8. aes16 |
     } \new Voice {
       \voiceTwo <aes, des>8-. r r4 <ees' g>8-. r r4 | bes'8-. s aes4 ~ aes2 |
       r4 aes ~ aes s4 |
  } >> \oneVoice
  <c, aes' c>2.) ~ q8 r16 c''

  <ees, c' ees>4-> <des bes' des>8-. <c aes' c>-. <bes f' aes bes>->( <aes aes'>-.) r <bes bes'>-. |
  <c ees aes c>8-> r <bes bes'>-. <aes aes'>-. <bes f' aes bes>->( <c c'>-.) r <des des'>-. |
  <ees c' ees>8-> r <des bes' des>-. <c aes' c>-. <bes f' aes bes>-. <aes aes'>-. r <bes des ees bes'>-. |
  <aes c ees aes>8-. \ottava 0 r \tuplet 3/2 { ees,8-. <g bes>-. ees'-. } \tuplet 3/2 { e,8-. <gis b>-. e'-. } \tuplet 3/2 { f,8-.[ r <a c f>-.] }

  aes'4.( f8 g4. f8 | aes4. f8 g4.) ees8( | g4. ees8 f4. ees8 | \acciaccatura aes,8 g'4. ees8 f4.) ees8( |

  aes4. f8 g4. f8 | \acciaccatura bes,8 aes'4. f8 g4.) ees8( |
  c'1) | \tuplet 3/2 { <ees, aes>8-. <f bes>-. <aes c>-. } <c ees>8-. r \tuplet 3/2 { <c f>8-. <bes ees>-. <c, g'>-. } <ees aes>8-. r16 bes' |

  \key c \major
  <c, f c'>8-. r q-.[ r16 a']( <b, f' b>8-.) r q-.[ r16 a']( |
  <c, f c'>8-.) r q-.[ r16 a']( <b, f' b>8-.) r \ottava 1 <b' f' b>-. r16 <g g'>( |
  <b e b'>8-.) r q-.[ r16 <g g'>]( <a e' a>8-.) r q-.[ r16 <g g'>]( |
  <b e b'>8-.) r q-.[ r16 g']( <a, e' a>8-.) r q-. r16 g'( |

  <c, f c'>8-.) r \acciaccatura { f16 g a b } q8-.[ r16 a]( <b, f' b>8-.) r \acciaccatura ais8 q-.[ r16 a']( |
  <c, f c'>8-.)[ r16 g'(] q8-.)[ r16 a]( <b, f' b>8-.) r <b dis g b>4
  <e g c e>1-> | <ees g bes des ees>2 \ottava 0 r2 |

  \key aes \major
  aes,4.( f8 g4. f8 \acciaccatura g | aes4. f8 g4.) ees8( |
  g4. ees8 f4. ees8 | g4. ees8 f4.) ees8( |

  aes4. f8 g4. f8 \acciaccatura g | aes4. f8 g4.) ees8( |
  << { \voiceOne ees'1) ~ | \oneVoice ees2 } \new Voice {
    \voiceTwo r4 \tuplet 3/2 { ees,8-. ges-. bes-. } c8-. r \tuplet 3/2 { bes8-. ges-. ees-. } |
  } >>
  \tuplet 3/2 { r8 <c c'>-. <des des'>-. } \tuplet 3/2 { <d d'>-. <ees ees'>-. <e e'>-. } |

  \ottava 1
  << {
    \voiceOne
    <f f'>4 r8 q <ees ees'>4 r8 q | <des des'>4 r8 q <c c'>4 r8 q |
    <ees ees'>4 r8 q <des des'>4 r8 q | <c c'>4 r8 q <bes bes'>4 r8 q |
     } \new Voice {
    \voiceTwo
    r4 bes'8-. r r4 <ges bes>8-. r | r4 a8-. r r4 f8-. r |
    r4 <ges a>8-. r r4 <f bes>8-. r | r8 <fes aes>-. r4 r8 <des fes>-. r4 |
  } >>
  \ottava 0 \oneVoice

  \shape #'(((0 . 0) (0 . 0) (0 . 1) (0 . 1)) ((0 . 3) (0 . 0) (0 . 0) (0 . 0))) Slur aes'4.( f8 g4. f8 | aes4 \acciaccatura { f'16 ees des bes } aes8 f g4.) c8( |
  <aes, ees' aes>8) r r4 r2 | r4 \ottava 1 \acciaccatura { ees''16 f } \tuplet 3/2 { <g, ees'>8-. d'-. ees-. } <aes, c ees aes>->\arpeggio \ottava 0 r r4
} >>

rl = << \global \relative c' {
  \clef treble
  r4 <f aes des>8-. r <g bes ees>-. <aes c f>-. r <bes des g>-. | r2 r4 r8 d-. |

  << {
    \voiceOne ees4( des8 c bes aes-.) r \shape #'((1 . 1.5) (0.7 . 1.5) (0.3 . 1.5) (0 . 1.5)) Slur bes( | c4 bes8 aes bes c-.) r des(
    ees4 des8 c bes aes-.) r bes( | c2)
     } \new Voice {
    \voiceTwo r4 <ees, aes>8-. r r4 <des ees>8-. r | r4 <c ees>8-. r r4 <des ees>8-. r |
    r4 <ees aes>8-. r r4 <des ees>8-. r | r4 <c ees aes>8-. r
  } >> \oneVoice r2 |

  << {
    c'4^( bes8 aes \voiceOne g f-.) r g( | aes4 g8 r g aes-.) r bes( | \oneVoice c4 bes8 aes g f-.) r g( | aes2)
     } \new Voice {
    \voiceTwo s2 d,2( | f e) |
  } >> \oneVoice
  <ges bes>8.( <f aes>16 <e g>8. <ees ges>16) |

  << { f4( g8. aes16 bes8. c16 des4 | ees8-.) r \voiceOne ees4 ~ ees8. des16( c8. bes16 |
       \voiceTwo des8-.) r des4 ~ des8. c16^( \voiceOne bes8. aes16)
       \oneVoice \ottava 1 \tuplet 3/2 { r4 e''8-. } \tuplet 3/2 { g8-.[ r f-.] } \tuplet 3/2 { g-. f-. g-. } \oneVoice aes8-. \ottava 0 r16 c,,,
     } \new Voice {
       s1 | s4 \voiceTwo <aes' c>8-. r r4 aes8-. r | \voiceOne r4 fes'( ees) \voiceTwo aes,8-. r |
  } >>

  << {
    \voiceOne \albs 2 0 ees2( f | ees f | ees f4 ees) |
  } \new Voice {
    \voiceTwo c8-. r c-. r <bes des>8-. r \acciaccatura c q8-. r |
    c8-. r c-. r <bes des>8-. r q-. r | r4 c8-. r <bes des>8-. r des8-. r |
  } >> \oneVoice
  c8-. r <g bes>4 ( <gis b> <a c>) |

  r4 \acciaccatura { f''16 ees des } bes8-. r r4 \acciaccatura d8 <bes ees>8-. r |
  r4 \acciaccatura { f''16 ees des } bes8-. r r4 \acciaccatura d,8 <bes ees>8-. r |
  r4 \acciaccatura { ees16 b c } aes8-. r r4 \acciaccatura g8 aes-. r |
  r4 \acciaccatura { ees''16 c bes } aes8-. r r4 aes,8-. r |

  r4 \acciaccatura { f'16 ees c } des8-. r r4 \acciaccatura { g'16 f c } des8-. r |
  r4 \acciaccatura { f,16 ees c } des8-. r r4 \acciaccatura { g'16 f c } des8-. r |
  c,4 \tuplet 3/2 { <ees, aes>8-.[ r <f bes>-.] } \tuplet 3/2 { <aes c>-. <ees aes>-. <aes c>-. } \tuplet 3/2 { <aes c ees>-.[ r <c f>-.] } |
  r4 <c, f aes>8-. r r4 q8-. r |

  \key c \major
  a'2( g | a g) |
  << { \voiceTwo g( a | g a) } \new Voice {
    \voiceOne r4 \acciaccatura { g'16 e c } b8-. r r \acciaccatura dis <c e>-. r \acciaccatura f <c e>-. |
    r16 \shape #'(((0 . -0.5) (1 . -0.5) (0 . -7) (-0.5 . -5))) Slur b( c e \crr \hideNotes \once \override NoteColumn.ignore-collision = ##t b'8) \unHideNotes
  } \new Voice { s1 | s4 \voiceOne r4 r2 } >>

  << { \voiceTwo a,2( g | a g) } \new Voice {
    \voiceOne r4 \tuplet 3/2 { <c f>8-. q r } r4 <b d f>8-. r |
    \tuplet 3/2 { r <e f a>-. <d f a>-. } <c f a>-. r r4 f,8-. r
  } >> \oneVoice
  \tuplet 3/2 { <g c e>8-. <c dis fis>-. <c e g>-. } <e g a>8-. r \acciaccatura { b'16 bes a } <e g c>8-.[ r16 <dis g b>-.] <e g c>8-. r |
  << {
    \voiceOne <ees g des'>8-. g16[ d] \tuplet 3/2 { ees8-. g-. c ~ } \oneVoice \tuplet 3/2 { c b-. fis-. } \tuplet 3/2 { f-.[ r bes-.] }
     } \new Voice {
    \voiceTwo \shape #'((0 . 9) (0 . 7) (0.5 . 10) (0.5 . 5)) Slur des,4( c \clr \voiceOne b bes)
  } >>

  \key aes \major
  r4 \acciaccatura <c ees>8 <bes des>-. r r4 <bes des ees>8-. r |
  r4 \acciaccatura { f'16 ees c } des8-. r \tuplet 3/2 { r8 <a' c>-. <bes des>-. } \acciaccatura f'8 <des g>8-. r |
  r4 \acciaccatura <c, ees>8 aes-. r \acciaccatura { bes16 aes g } f8-. r \acciaccatura f aes-. r |
  r4 \acciaccatura { g16 aes bes } aes8-. <aes c>-. <c' f>16-. <bes ees>-. <aes c>8 <ees bes'>16-.[ <b aes'>-.] r8 |

  r4 <bes des>8-. r r4 <bes des>8-. r |
  r4 << { \acciaccatura { a16 bes c } des8-. } \\ { \acciaccatura { e,16 f g } aes8-. } >> r r4 \clr \acciaccatura { \shape #'((0 . -6) (0 . -5) (1.7 . -6.6) (-0.2 . -4.2)) Slur \slurUp d,,16 ees c' } \crl \slurNeutral <bes des ees>8-. r |
  r4 <ges' bes>8-. r r4 q8-. r | c8-. r \acciaccatura ees <a, a'>-. r r4 <a, c f>8-. r |

  r4 \acciaccatura <ees' ges c>8 <des f bes>-. r r4 <ees ges bes>8-. r |
  r4 \acciaccatura e8 <f a>-. r r4 \acciaccatura ges8 <f a>-. r |
  ges2( f | fes1)

  << { aes8-. ees'16[ bes] <c, aes'>8-. r g'-. r <b, f' g>-. r | aes'8-. r <bes, f'>-. r } \\ { ees2( d | des) } >> \tuplet 3/2 { r8 <g c>-. <f bes>-. } <des ees g>-. r |
  r4 ees8-. r r2 | R1 |

  r4 <f aes des>8-. r <g bes ees>-. <aes c f>-. r <bes des g>-. |
  <c ees aes>8-. r <des f bes>-. r <ees g c>-. <f aes des>-. r <d b'>-. |

  <ees c'>4( <des bes'>8 <c aes'> <bes g'> <aes f'>-.) r <bes g'>( |
  <c aes'>4 <bes g'>8 <aes f'> <bes g'> <c aes'>-.) r <des bes'>( |
  <ees c'>4 <des bes'>8 <c aes'> <bes g'> <aes f'>-.) r <bes g'>( |
  << { \voiceOne <c aes'>2) } \new Voice { \tuplet 3/2 { \voiceTwo r8 des-. d-. } f-. r } >> \oneVoice \tuplet 3/2 { e8-.[ r aes-.] } g8-. r |

  \grace { a,16 bes b c } <c aes'>4_( <bes g'>8 <aes f'> << { \voiceTwo g f-.) r g( aes4 g8 r \voiceOne <g bes c> aes-.) } \new Voice { \voiceOne <b d>2 | <bes des>4 q } >> r8 bes( \oneVoice
  c4 bes8 aes g f-.) r g(
  aes2) <ges bes>8.( <f aes>16 <e g>8. <ees ges>16) |

  << { \oneVoice f4( g8. aes16 bes8. c16 des4 | ees8-.) r \voiceOne ees4 ~ ees8. des16( c8. bes16 |
       \voiceTwo des8-.) r des4 ~ des8. c16^( \voiceOne bes8. aes16)
       \oneVoice \ottava 1 \tuplet 3/2 { r4 e''8-. } \tuplet 3/2 { f8-.g-. f-. } \tuplet 3/2 { g-. f-. g-. } \oneVoice aes8-. \ottava 0 r8 |
     } \new Voice {
       s1 | s4 \voiceTwo <aes,, c>8-. r r4 aes8-. r | \voiceOne r4 fes'( ees) \voiceTwo aes,8-. r |
  } >>

  ees16( f ees f ees f ees g f g f g f g f b,) |
  << { ees2( f) } \\ { <aes, c>8-. r q-. r <aes bes des>8-. r q-. r } >> |
  ees'16( f ees f ees f ees e f g f e ees4) |
  c8-. r <g bes>4 ( <gis b> <a c>) |

  r4 \acciaccatura { f'''16 ees des } bes8-. r r2 |
  r4 <bes, des>8-. r r4 \acciaccatura d8 <bes ees>-. r |
  r4 \acciaccatura { ees16 b c } aes8-. r r4 \acciaccatura g8 aes-. r |
  r4 \acciaccatura { ees''16 c bes } aes8-. r r4 aes,8-. r |

  r4 \acciaccatura { f'16 ees c } des8-. r r4 \acciaccatura { g'16 f c } des8-. r |
  r4 \acciaccatura { f,16 ees c } des8-. r r4 \acciaccatura { g'16 f c } des8-. r |
  r4 \tuplet 3/2 { <ees,, aes>8-.[ r <f bes>-.] } \tuplet 3/2 { <aes c>-. <ees aes>-. <aes c>-. } \tuplet 3/2 { <aes c ees>-.[ r <c f>-.] } |
  r4 <c, ees aes>8-. r r4 <c f aes>8-. r16 gis'( |

  \key c \major
  a4) ~ a8. fis16( g4) ~ g8. gis16( | a4) ~ a8. fis16( g4) ~ << { \voiceTwo g8. fis16_( } \new Voice { \voiceOne <b d>8-. r } >> \oneVoice |
  << { \voiceTwo g4) ~ g8. gis16( a4) ~ a8. aes16( | g4) ~ g8. gis16( a4) ~ a8. gis16( } \new Voice {
    \voiceOne r4 \acciaccatura { g'16 e c } b8-. r r2 |
    r16 \shape #'(((0 . -1) (1 . -1) (0 . -7) (-0.5 . -5))) Slur b( c e \crr \hideNotes \once \override NoteColumn.ignore-collision = ##t b'8) \unHideNotes
  } \new Voice { s1 | s4 \voiceOne r4 r2 } >>

  << { \voiceTwo a,4) ~ a8. aes16( g4) ~ g8. gis16( | a4) ~ a8. fis16( \shape #'((0 . -0.5) (0 . -1) (0 . -1) (0 . -0.5)) Tie g4) ~ g8. \shape #'((0 . 6) (1 . 4.5) (1 . 6.5) (0 . 3)) Slur f16( } \new Voice {
    \voiceOne r4 \tuplet 3/2 { <c' f>8-. q r } r4 \acciaccatura ais8 <b d f>8-. r |
    \tuplet 3/2 { r <e f a>-. <d f a>-. } <c f a>-. r r4 f,8-. r
  } >> \oneVoice
  << {
    \clr \once \override NoteColumn.ignore-collision = ##t e1)
     } \new Voice {
    \tuplet 3/2 { <g c e>8-. <c dis fis>-. <c e g>-. } <e g a>8-. r \acciaccatura { g16 ges f } <e g c>8-.[ r16 <dis g b>-.] <e g c>8-. r |
  } >> \crl
  << {
    \voiceOne <ees g des'>8-. g16[ d] \tuplet 3/2 { ees8-. g-. c ~ } \oneVoice \tuplet 3/2 { c b-. fis-. } \tuplet 3/2 { f-.[ r bes-.] }
     } \new Voice {
    \voiceTwo \shape #'((0 . 9) (0 . 7) (0.5 . 10) (0.5 . 5)) Slur des,4( c \clr \voiceOne b bes)
  } >>

  \key aes \major
  r4 \acciaccatura <c ees>8 <bes des>-. r r4 \acciaccatura { g''16 f c } des8-. r |
  r4 \acciaccatura { f,16 ees c } des8-. r \tuplet 3/2 { r8 <a' c>-. <bes des>-. } <des f g>8-. r |
  r4 \acciaccatura <c, ees>8 aes-. r \acciaccatura { bes16 aes g } f8-. r \acciaccatura f aes-. r |
  r4 \acciaccatura { g16 aes bes } aes8-. <aes c>-.
  \ottava 1 << { <c'' f>16-. <bes ees>-. <aes c>8-. } \\ { <c, f>16-. <bes ees>-. <aes c>8-. } >> <ees' bes'>16-. <b aes'>-. ees8-. \ottava 0 |

  r4 <bes, des>8-. r r4 <bes des>8-. r |
  r4 << { \acciaccatura { a16 bes c } des8-. } \\ { \acciaccatura { e,16 f g } aes8-. } >> r r4 \clr \acciaccatura { \shape #'((0 . -6) (0 . -5) (1.7 . -6.0) (-0.2 . -4.2)) Slur \slurUp d,,16 ees c' } \slurNeutral \crl <bes des ees>8-. r |
  r4 <ges' bes>8-. r r4 q8-. r | c8-. r \acciaccatura ees <a, a'>-. r r4 <a, c f>8-. r |

  r4 \acciaccatura <ees' ges c>8 <des f bes>-. r r4 <ees ges bes>8-. r |
  r4 \acciaccatura e8 <f a>-. r r4 \acciaccatura ges8 <f a>-. r |
  ges2( f | fes1) |

  << { aes8-. ees'16[ bes] <c, aes'>8-. r g'-. r \tuplet 3/2 { <b, f' g>-. fis'-. g-. } | aes8-. r <bes, f'>-. r } \\ { \albs -2 0 ees2( d | des) } >> \tuplet 3/2 { r8 <g c>-. <f bes>-. } <des ees g>-. r |
  \clef bass
  r4 << { \voiceOne aes8.( bes16 c8. ees16 \oneVoice <aes, bes f'>4 ~ } \new Voice { \voiceTwo \mergeDifferentlyDottedOn aes4 ~ \mergeDifferentlyDottedOff aes } >>
  <aes bes f'>4) \clef treble <ees' bes' des>8-. r r2 |
} >>

rd = {
  s1*2\p\cresc
  s1*3\mp s2 s\<
  s\> s\! s1*2 s2 s\<

  s1*4\mf
  s1*3 s4 s\< s s\>

  s1*4\mp
  s1*2 s1\< s2 s4\> s\!

  s1 s2. s4\< s1*2\!
  s1 s2. s4\< s1\! s1\>

  s1*4\mp
  s1*2 s1*2\cresc

  s1*2\f s1*2\dim
  s1\mf s2 s\< s1\mf s2 s\<

  s1*2\p\cresc
  s1*3\mf s2 s\<
  s\> s\! s s\> s1\! s2 s\<

  s1*3\mf s2. s4\<
  s1*3\f s4 s\< s s\>

  s1*4\mp
  s1*2 s1\< s2 s4\> s\!

  s1 s2. s4\< s1*2\!
  s1 s2. s4\< s1\! s1\>

  s1*4\mp
  s1*2 s1*2\cresc

  s1*2\f s1*2\dim
  s1\mf s2 s\< s4\mf s2.\< s4 s2.\f
}

lr = << \global \relative c' {
  \clef bass
  << { \voiceTwo s1 | r2 r4 r8 b^( } \new Voice { \voiceOne ees1-> ~ | ees } >> | \oneVoice

  << {
    \voiceOne c4 bes8 aes g f-.) r \shape #'((0.8 . -0.8) (0.4 . -0.5) (0 . 0) (0 . 0.2)) Slur g( | aes4 g8 f g aes-.) r8 bes( |
    c4 bes8 aes g f-.) r g( | aes4) r
     } \new Voice {
    \voiceTwo ees1 | \acciaccatura { c16 des d } ees1 | \acciaccatura f8 ees1 | \acciaccatura { c16 des d } ees2
  } >> \oneVoice e4_( f8. g16 |

  << { \voiceTwo aes4 g8 f d2 | des c) } \new Voice { \voiceOne r4 <c' f>8-. r r4 \acciaccatura <fis, ais>8 <g b>-. r | r4 \acciaccatura a8 <bes des>-. r r4 <g bes c>8-. r } >> |
  << { \voiceOne r4 <c f>8-. r r4 <f, bes des>8-. r | r8. f16( aes8. c16 bes8. aes16 g8. ges16) } \new Voice { \oneVoice \albs -1 0 aes4_( g8 f d4 \voiceTwo des | c2) <ees c'> } >>|

  << {  \voiceTwo \shape #'(((0 . 0) (0 . 0) (0 . 1) (0 . -3)) ((0 . 6) (0 . 6) (0 . 7.5) (0 . 4))) Slur f2( g2 | ees aes \cll \voiceOne fes ees) } \new Voice {
    \voiceOne r4 <aes des>8-. r r4 <bes des ees>8-. r |
    r4 \acciaccatura { c16 des d } ees4-> ~ ees8. des16( c8. bes16) |
    \oneVoice r4 \voiceOne des4 ~ des8. c16( bes8. aes16 |
    <d, c'>2.) ~ \once \override TieColumn.tie-configuration = #'((7 . 1) (0 . -1)) q8 s |
  } \new Voice {
    s1 | s | \voiceTwo s4 <aes' fes'>8-. r r4 <c ees>8-. r | \tuplet 3/2 { r4 e,8-. } \tuplet 3/2 { g8-.[ \once \override Rest.staff-position = 0 r f-.] } \tuplet 3/2 { g-. f-. g-. } \once \override NoteColumn.force-hshift = -0.6 aes8-. \oneVoice r
  } >> \oneVoice \clr

  << {
     \voiceOne aes8-. r aes-. r aes-. r aes-. r | aes-. r aes-. r aes-. r aes-. r | r4 aes8-. r aes-. r g-. r |
     \oneVoice r4 ees8-. r e-. r f-. r
     } \new Voice {
     \voiceTwo
     \albs -2 0 ees2( f | ees f | ees f4 ees) |
  } >>

  << {
    \voiceTwo
    aes4.( f8 g4. f8 | \acciaccatura bes,8 aes'4. f8 g4.) ees8( | g4. ees8 f4. ees8 | \acciaccatura aes,8 g'4. ees8 f4.) ees8( |
     } \new Voice {
    \voiceOne
    r4 <bes' des f>8-. r r4 <bes des ees>8-. r | r4 <bes des f>8-. r r4 <bes des ees>8-. r |
    r4 <c ees>8-. r r4 <c ees>8-. r | r4 <c ees aes>8-. r r4 \acciaccatura b8 <c ees>8-. r |
  } >>

  << {
    \voiceTwo aes4. f8 g4. f8 | \acciaccatura bes,8 aes'4. f8 g4.) ees8^( |
    \voiceOne c'2.) <c f>8-. r |
     } \new Voice {
    \voiceOne r4 <bes des f>8-. r r4 <bes des ees>8-. r | r4 <bes des f>8-. r r4 <bes des ees>8-. r |
    \voiceTwo ees,2( f | \oneVoice ees f) |
  } >>

  \key c \major
  \clef treble
  << {
       r8 \acciaccatura e' <d f>-. r \acciaccatura cis <c f>-. r \acciaccatura cis <d f>-. r \acciaccatura c <b f'>-. |
       r4 <d f>8-. r r4 <b f'>8-. r |
       r4 <c e>8-. r r q-. r q-. | r q-. r q-. r q-. r8 \acciaccatura dis <c e>8-. |
     } \\
     { \albs -2 -1 a2( g2 | a2 g) | g( a | g a) } >>

  << {
       \voiceOne r4 \tuplet 3/2 { <c f>8-. q r } r4 \acciaccatura ais8 <b d f>8-. r | \tuplet 3/2 { r8 e-. d-. } <c f>-. r r4 b8-. r |
     } \new Voice {
       \voiceTwo a2( g | a g) |
       e8-. r g4( c b) | \oneVoice \shape #'((0 . 1.5) (0 . 0.2) (-0.5 . -0.5) (0 . 0)) Slur <ees g>2_( \voiceTwo <d fis>4 <des f>) |
     } \new Voice {
       s1 | s2. \voiceFour \shape #'((0 . -1) (0 . -1) (0 . 0) (0 . 0)) Slur dis4_( |
       \voiceOne e1) |
  }>>

  \key aes \major
  \clef bass
  << {
    \voiceTwo
    aes,4.( f8 g4. f8 | \acciaccatura g aes4. f8 g4.) ees8( | g4. ees8 f4. ees8 | g4. ees8 f4.) \albs -1 0 ees8( |
     } \new Voice {
    \voiceOne
    r4 <bes' des f>8-. r r4 <bes des ees>8-. r | r4 \acciaccatura { aes'16 g e } <bes des f>8-. r r4 <bes des ees>8-. r |
    r4 \acciaccatura g'8 <c, ees>8-. r r4 \acciaccatura d8 <c ees>8-. r | r4 <c ees>8-. r r4 <c ees aes>8-. r |
  } >>

  << {
    \voiceTwo aes4. f8 g4. f8 | \acciaccatura g aes4. f8 g4.) s8 |
    r4 bes( c bes | a ges f ees) |
  } \new Voice {
    \voiceOne r4 <bes' des f>8-. r r4 <bes des ees>8-. r | r4 \acciaccatura { c16 des ees } f8-. r r4 s8 \voiceTwo ees,8^( | \voiceOne ees'1) ~  ees2
  } \new Voice {
    s1*3 | s4 \voiceOne c8-. r r2 |
  } >>

  << {
    \voiceOne s2 \tuplet 3/2 { r8 <f, a>-. <ges bes>-. } r4 | s1 |
    r4 <a c ees>8-. r r4 \acciaccatura { b16 c } <bes des>8-. r |
    r4 \acciaccatura c8 <aes bes>-. r r4 \acciaccatura c8 <aes bes>-. r |
     } \new Voice {
    \voiceTwo des,2( c | f ees) | \albs -2 0 ges( f | fes1) |
  } >>

  << { \voiceOne \shape #'((0 . 0.7) (0 . 0.7) (0 . 0.7) (0 . 0.7)) Slur aes4.( f8 g4. f8 | aes4. f8 g4.) c8 } \new Voice { \voiceTwo <c, ees>2( <b d> | <bes des>4) r des8-. r r4 } >> \oneVoice |
  << { c'4( bes \voiceOne aes2) } \new Voice { s2 \voiceTwo r4 f8-. r } >> \oneVoice e4( a bes) \tuplet 3/2 { b8-.-> c-.-> d-.-> }

  << { \voiceTwo s1 | r2 r4 r8 b^( } \new Voice { \voiceOne ees1-> ~ | ees } >> | \oneVoice

  << {
    \voiceOne
    c16) ees c ees <bes aes'> des aes c g bes <f aes>8-. <des' ees>-. g,16[ bes] |
    aes ees' aes, ees' <g, c> ees' f, ees' g, ees' aes,8-. <des ees>-. bes16[ des] |
    c des d f <bes, ees aes> des aes c g bes <f aes>8-. <des' ees>-. \shape #'((0 . 5) (0 . 5) (2.5 . 7) (1 . 5)) Slur g,16[_( <f bes>]
    \cll \voiceOne ees2) \clr \oneVoice \shape #'((0 . 0) (0 . 0) (0 . 1) (0 . 1)) Slur e4( f8. g16
     } \new Voice {
    \voiceTwo ees1 | \acciaccatura d8 ees1 | \acciaccatura d8 ees1 | \oneVoice r4 <c' ees aes>8-. r
  } >>

  aes4 g8 f d16) d' d, d' d, d' d, d' |
  << {
    \clr des,16 \crl f' \clr des, \crl f' \clr des,16 \crl f' \clr des, \crl f'
    \clr c,16 \crl e' \clr c, \crl e' \clr c,16 \crl e' \clr c, \crl e' | \clr
     } \new Voice {
    \voiceTwo r4 \acciaccatura a,8 <bes des>4 r \acciaccatura b8 <g bes c>4 |
  } >>
  << { \shape #'((0 . -1) (0 . 0) (0 . 0) (0 . -1)) Slur \voiceTwo aes4_( g8 f d4 des | c2) <ees c'> } \new Voice { \voiceOne r4 <c' f>8-. r r4 <f, bes des>8-. r | r8. f16( aes8. c16 bes8. aes16 g8. ges16) } >> \oneVoice |

  << { \voiceTwo \shape #'(((0 . 1) (0 . 1) (0 . 8) (0 . 4.5))) Slur f2( g2 | ees aes \cll \voiceOne fes ees) } \new Voice {
    \voiceOne r4 \tuplet 3/2 { <aes des>8-. <aes des f> r } r4 \tuplet 3/2 { <bes des ees>8-. <des ees g>-. <f g bes>-. } |
    ees8-. r \acciaccatura { c16 des d } ees4-> ~ ees8. des16( c8. bes16) |
    \oneVoice r4 \voiceOne des4 ~ des8. c16( bes8. aes16 |
    <d, c'>2.) ~ \once \override TieColumn.tie-configuration = #'((7 . 1) (0 . -1)) q8 s |
  } \new Voice {
    s1 | s |
    \voiceTwo s4 <aes' fes'>8-. r r4 <c ees>8-. r | \tuplet 3/2 { r4 e,8-. } \tuplet 3/2 { f-. g-. f-. } \tuplet 3/2 { g-. f-. g-. } \once \override NoteColumn.force-hshift = -0.6 aes8-. \oneVoice r16 c |
  } >> \oneVoice \clr

  << { <aes c>8-. r q-. r <aes bes des>-. r \acciaccatura c q-. r } \\ { ees,2( f) } >> |
  ees16( f ees f ees f ees e f g f g f g f d) |
  << { r4 <aes' c>8-. r <aes bes des>-. r <g des'>-. r } \\ { ees2( f4 ees) } >> |
  r4 ees8-. r e-. r f-. r |

  << {
    \voiceTwo
    aes4.( f8 g4. f8 | aes4. f8 g4.) ees8( | g4. ees8 f4. ees8 | \acciaccatura aes,8 g'4. ees8 f4.) \shape #'((-0.5 . -2) (-0.5 . -2) (0 . -2) (0 . -2)) Slur ees8( |
     } \new Voice {
    \voiceOne
    r4 <bes' des f>8-. r r4 <bes des ees>8-. r | r4 \acciaccatura { f'16 ees des } <bes f'>8-. r r4 <bes des ees>8-. r |
    r4 <c ees>8-. r r4 <c ees>8-. r | r4 <c ees aes>8-. r r4 \acciaccatura b8 <c ees>8-. r |
  } >>

  << {
    \voiceTwo aes4. f8 g4. f8 | \acciaccatura bes,8 aes'4. f8 g4.) \voiceOne r8 |
    \voiceTwo \albs -2 0 ees2( f | \oneVoice ees f4 ~ f8.) \noBeam \clef treble gis16_( |
     } \new Voice {
    \voiceOne r4 <bes des f>8-. r r4 <bes des ees>8-. r | r4 <bes des f>8-. r r4 <bes des ees>8-. \noBeam \voiceTwo \shape #'((0 . -0.5) (0 . -0.5) (0 . 0) (0 . 0)) Slur ees,8^( |
    \voiceOne c'2.) <c f>8-. r
  } >>

  \key c \major
  << { \voiceTwo a4) ~ a8. fis16( g4) ~ g8. gis16( | a4) ~ a8. fis16( g4) ~ g8. fis16( | g4) ~ g8. gis16( a4) ~ a8. aes16( | g4) ~ g8. gis16( a4) ~ a8. gis16( } \new Voice {
       \voiceOne
       r4 <c f>8-. r r4 <b f'>8-. r |
       r4 <d f>8-. r r4 \acciaccatura a8 <b f'>8-. r |
       r4 <c e>8-. r r q-. r q-. | r q-. r q-. r \acciaccatura dis q-. r q-. |
     }
  >>

  << {
       \voiceTwo a4) ~ a8. aes16( g4) ~ g8. gis16( | a4) ~ a8. fis16( g4) ~ g8. f16(  |
       e8-.) r g4( c b) | \oneVoice \shape #'((1 . 2) (1 . 2) (-0.5 . -0.5) (0 . 0)) Slur <ees g>2_( \voiceTwo <d fis>4 <des f>) |
     } \new Voice {
       \voiceOne r4 \tuplet 3/2 { <c f>8-. q r } r4 <b f'>8-. r | \tuplet 3/2 { r8 e-. d-. } <c f>-. r r4 \once \override NoteColumn.force-hshift = 0.5 b8-. r |
     } \new Voice {
       s1 | s2. \voiceThree \once \override NoteColumn.force-hshift = 0 \shape #'((0.6 . 1.2) (0.5 . 0.7) (0.5 . 0) (0 . 0)) Slur dis4^( |
       \voiceOne e1) |
     } \new Voice {
       s1*3 | \voiceFour <g, bes>8-. \once \override Rest.staff-position = -12 r \once \override Rest.staff-position = -14 r4
  }>>

  \key aes \major
  \clef bass
  << {
    \voiceTwo
    aes4.( f8 g4. f8 | \acciaccatura g aes4. f8 g4.) ees8( | g4. ees8 f4. ees8 | g4. ees8 f4.) ees8( |
     } \new Voice {
    \voiceOne
    r4 <bes' des f>8-. r r4 <bes des ees>8-. r | r4 \acciaccatura { aes'16 g e } <bes des f>8-. r r4 <bes des ees>8-. r |
    r4 \acciaccatura g'8 <c, ees>8-. r r4 \acciaccatura d8 <c ees>8-. r | r4 <c ees>8-. r r4 <c ees aes>8-. r |
  } >>

  << {
    \voiceTwo aes4. f8 g4. f8 | \acciaccatura g aes4. f8 g4.) s8 |
    r4 bes( c bes | a ges f ees) |
  } \new Voice {
    \voiceOne r4 <bes' des f>8-. r r4 <bes des ees>8-. r | r4 \acciaccatura { c16 des ees } f8-. r r4 s8 \voiceTwo ees,8^( | \voiceOne ees'1) ~  ees2
  } \new Voice {
    s1*3 | s4 \voiceOne c8-. r r2 |
  } >>

  << {
    \voiceOne s2 \tuplet 3/2 { r8 <f, a>-. <ges bes>-. } r4 | s1 |
    r4 <a c ees>8-. r r4 \acciaccatura { b16 c } <bes des>8-. r |
    r4 \acciaccatura c8 <aes bes>-. r r4 \acciaccatura c8 <aes bes>-. r |
     } \new Voice {
    \voiceTwo \albs -2 -2 des,2( c | f ees) | ges( f | fes1) |
  } >>

  << { \voiceOne aes4.( f8 g4. f8 | aes4. f8 \oneVoice g4.) c8 } \new Voice { \voiceTwo \albs -2 0 <c, ees>2( <b d> | <bes des>8-.) r r4 } >> |
  c'8 r f,8.( e16 ees4 d ~ |
  d) r4 c'8->\arpeggio r r4 |
} >>

ll = << \global \relative c {
  \clef bass
  r2 r4 r8 ees-. | ees8-. r ees-. r ees-. ees-. r ees-. |

  aes,8-. r r4 ees8-. r r4 | aes,8-. r r4 ees'8-. r r4 |
  aes,8-. r r4 ees'8-. r r4 | aes8-. r r4 c,( d8. e16 |

  <f c'>8-.) r r4 <c g'>8-. r r4 | f,4 r4 c'8-. r r4 |
  f8-. r r4 c4 r | f2 << aes \\ { aes,8-. r r4 } >>

  <des aes'>8-. r r4 des8-. r r4 | c8-. r r4 f8-. r r4 |
  \voiceTwo fes8-. r r4 ees8-. r r4 | <bes f'>1 | \oneVoice

  ees8-. r r4 ees,8-. r r4  | ees'8-. r r4 ees,8-. r r4 | ees'8-. r r4 ees,8-. r r4 | <aes' ees'>8-. r des,-. r d-. r ees-. r |

  bes'8-. r r4 ees,8-. r r4 | bes8-. r r4 ees8-. r r4 |
  aes,8-. r r4 ees'8-. r r4 | aes,8-. r r4 ees'8 r r4 |

  bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 | bes8-. r r4 \acciaccatura { des'16 bes } ees,8-. r r4 |
  aes,8-. r r4 ees'8-. r r4 | aes,8-. r r4 ees'8-. r r4 |

  \key c \major
  d8-. r r4 g,8-. r r4 | \tuplet 3/2 { d'8-.  cis' -.d-. } r4 g,,8-. r r4 |
  c8-. r r4 g8-. r r4 | c8-. r r4 g16 b' c dis e8-. r |

  d,8-. r r4 g,8-. r r4 | d'8-. r r4 g,8-. r r4 | << { g'8-. r r4 r2 } \\ c,1 >> | ees1 |

  \key aes \major
  bes'8-. r r4 ees,8-. r r4 | bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 |
  aes,8-. r r4 ees'8-. r r4 | aes,8-. r r4 ees'8-. r r4 |

  bes'2 ees,2 | bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 |
  c'4 r ges r | f8-. r r4 f,8-. r r4 |

  des'8-. r r4 c8-. r r4 | f8-. r r4 f,8-. r r4 |
  << { r2 bes' | r des } \\ { bes,1 | des } >>

  ees4 r ees, r | ees' r \acciaccatura { des'16 bes } ees,,8-. r r4 |
  <aes' ees'>8-. r r4 <des, aes'>8-. r r4 | c8-. r f-. r bes,-. r r4 |

  r2 r4 r8 ees'-. | ees-. r ees-. r ees-. ees-. r ees-. |

  aes,8-. r r4 ees8-. r r4 | aes,8 r r4 ees'8-. r r4 |
  aes,8-. r r4 ees'8-. r r4 | \voiceTwo aes8-. r r4 \oneVoice c,4( d8. e16 |
  <f c'>8-.) r r4 <c g'>8-. r \acciaccatura { fis'16 g a } <g b>4-> | f,,2-. c'8-. r r4 |
  f8-. r r4 c4 r | f2 << aes \\ { aes,4 r } >>

  <des aes'>8-. r r4 des8-. r r4 | c8-. r r4 f8-. r r4 |
  \voiceTwo fes8-. r r4 ees8-. r r4 | <bes f'>1 | \oneVoice

  ees8-. r r4 ees,8-. r r4 | ees'8-. r r4 ees,8-. r r4 | ees'8-. r r4 ees,8-. r r4 | <aes' ees'>8-. r des,-. r d-. r ees-. r |

  bes'8-. r r4 ees,8-. r r4 | bes'8-. r r4 ees,8-. r r4 |
  aes,8-. r r4 ees'8-. r r4 | r2 ees8-. r r4 |

  bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 | bes8-. r r4 \acciaccatura { des'16 bes } ees,8-. r r4 |
  aes,8-. r r4 ees'8-. r r4 | aes,8-. r r4 ees'8-. r r4 |

  \key c \major
  d8-. r r4 g,8-. r r4 | d'8-.  r r4 g,8-. r r4 |
  c8-. r r4 g8-. r r4 | c8-. r r4 g8-. r r4 |

  d'8-. r r4 g,8-. r r4 | d'8-. r r4 g,8-. r r4 | << { g'8-. r r4 r2 } \\ c,1 >> | ees1 |

  \key aes \major
  bes'8-. r r4 ees,8-. r r4 | bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 |
  aes,8-. r r4 ees'8-. r r4 | aes,8-. r r4 ees'8-. r r4 |

  bes'2 ees,2 | bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 |
  c'4 r ges r | f8-. r r4 f,8-. r r4 |

  des'8-. r r4 c8-. r r4 | f8-. r r4 f,8-. r r4 |
  << { r2 bes' | r des } \\ { bes,1 | des } >>

  ees4 r ees, r | ees'8-. r r4 \acciaccatura { des'16 bes } ees,8-. r r4 |
  <aes ees'>8 r <des, aes'>-. r <aes ees' aes>-. r f'4 ~ |
  f r <aes ees'>8->\arpeggio r r4
} >>

ld = {
  s1*2\p\cresc
  s1*3\mp s2 s\<
  s\> s\! s1*2 s2 s\<

  s1*4\mf
  s1*3 s4 s\< s s\>

  s1*4\mp
  s1*2 s1\< s2 s4\> s\!

  s1 s2. s4\< s1*2\!
  s1 s2. s4\< s1\! s1\>

  s1*4\mp
  s1*2 s1*2\cresc

  s1*2\f s1*2\dim
  s1\mf s2 s\< s1\mf s2 s\<

  s1*2\p\cresc
  s1*3\mf s2 s\<
  s\> s\! s s\> s1\! s2 s\<

  s1*3\mf s2. s4\<
  s1*3\f s4 s\< s s\>

  s1*4\mp
  s1*2 s1\< s2 s4\> s\!

  s1 s2. s4\< s1*2\!
  s1 s2. s4\< s1\! s1\>

  s1*4\mp
  s1*2 s1*2\cresc

  s1*2\f s1*2\dim
  s1\mf s2 s\< s4\mf s2.\< s4 s2.\f
}

pn = { s8.\sustainOn s16\sustainOff s2. }
pl = { s4.\sustainOn s8\sustainOff s2 }
ps = { s8\sustainOn s\sustainOff s2. }

pedal = {
  \pn \pn
  \pn s1*3
  s1 \pn s1 \pn

  \pn s1*2 \pn
  \pn s1 \pn \pn

  \pn \pn \pn \pn
  \pn \pn \pn \pn

  \pl \pl \pl \pl
  \ps \ps \pn \pn

  \pn \pn \pn \pn
  \pn \pn \pn \pn

  \pn \pn \pn \pn
  \pn \pn \pn s1

  \pn \pn
  s1*2 \pn \pn
  s1*3 \pn

  \pn \pn \pn \pn
  \pn \pn \pn \pn

  \pn \pn \pn \pn
  \pn \pn \pn \pn

  \pl \pl \pl \pl
  \ps \ps \pn \pn

  \pn \pn \pn s1
  \pn s1 \pn s1

  \pn \pn \pn \pn
  \pn \pn s1 s4\sustainOn s\sustainOff
}

pedaluc = {
  s1\unaCorda s4 s\treCorde s2
  s1^"use arpeggios freely" s1*7
  s1*7 s2. s4\unaCorda

  s1*6 s1\treCorde s1
  s1*7 s2. s4\unaCorda

  s1*5 s2. s4\treCorde s1*2
  s1*7 s2. s4\unaCorda

  s1 s2. s4\treCorde
  s1*8
  s1*7 s2 s8 s\unaCorda s4

  s1*5 s2. s4\treCorde s1*2
  s1*7 s2. s4\unaCorda

  s1*5 s2. s4\treCorde s1*2
  s1*8
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
      \new PianoPedal = "pedaluc" \pedaluc
      \new PianoPedal = "pedal" \pedal
    >>
  >>
  \layout {}
  \midi {}
}

\markup \italic \column {
  "Welte Licensee No. 5675"
  "Special thanks to Peter Phillips and Spencer Chase for providing e-rolls"
}