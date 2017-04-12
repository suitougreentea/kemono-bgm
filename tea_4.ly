\version "2.19.57"

cll = \change Staff = "ll"
clr = \change Staff = "lr"
crl = \change Staff = "rl"
crr = \change Staff = "rr"

\header {
  title = \markup {
      \override #'(font-name . "游ゴシック体")
      "二人でお茶を"
  }
  subtitle = \markup { \center-column { \normal-text \italic "from Kemono Friends episode 12" \bold \italic "Faithful copy for 4 hands" } }
  composer = "Original by Vincent Youmans"
  opus = \markup { \concat { "1" \super "st" } "version" }
  tagline = \markup \fill-line \italic {
    "LilyPond - Music notation for everyone"
    \small #(string-append "Version " (lilypond-version) ", lilypond.org")
  }
}

\paper {
  page-count = 9
  system-count = 26
  max-systems-per-page = 3
}

global = {
  \numericTimeSignature
  \key aes \major
  \time 4/4
  \tempo 4 = 141

  s1*26
  \bar "||"

  s1*8
  \bar "||"

  s1*42
  \bar "|."
}

rr = << \global \relative c'' {
  R1 | <c ees aes>4 <des f bes>8-. r <ees g c>-. <f aes des>-. r <g b d> |

  <aes c ees>4( <bes des>8 <aes c> <g bes> <f aes>-.) r <g bes>( |
  <aes c>4 <g bes>8 <f aes> <g bes> <aes c>-.) r <bes des>( |
  <c ees>4 <bes des>8 <aes c> <g bes> <f aes>-.) r <g bes>( |
  <aes c>4) \acciaccatura { d,8 } ees8-. r \tuplet 3/2 { g8-. c-. fis,-. } g-. b,-. | \pageBreak

  <c c'>4( \acciaccatura { <g' bes>16 c } <g bes>8 <aes, aes'> <g d' g> <f f'>) r <g g'>( |
  <f f'>4) r8 \noBeam <f f'>( <g g'> <aes aes'>) r <bes g' bes>( |
  <c aes' c>4 <bes bes'>8 <aes aes'> \acciaccatura { bes16 des } <g, b d g>8 <f f'> <des des'> <g g'>
  <f aes f'>4) r r2 |

  %{r4 <g g'>8.( <aes aes'>16 <bes ees g bes>8. <c c'>16 <des des'>4 |
  <ees bes' ees>8-.) r <ees aes ees'>4 r8. <des des'>16( <c c'>8. <bes bes'>16 |
  <des des'>8-.) r <des fes des'>4 ees8. <c c'>16( <bes bes'>8. <aes aes'>16 |
  <c c'>2.) r8. \ottava 1 c''16 ~ |%}

  << { \voiceOne r4 \ottava 1 g'8.( aes16 bes8. c16 des4 |
          <bes ees>8-.) \oneVoice r \voiceOne ees4 r8. des16( c8. bes16 |
        } \new Voice { \voiceTwo r2 <ees, g>8-. s s4 | s aes8-. r r4 aes8-. r } >> \oneVoice
  des8-.) r des4 ~ des8. c16( <ees, bes'>8. aes16
  <c, c'>2.->) r8. c''16 ~ |

  <ees, aes c ees>4-> <des bes' des>8-. <c aes' c>-. <bes g' bes>->( <aes f' aes>-.) r <bes bes'>-. |
  <c ees c'>4-> <bes bes'>8-. <aes aes'>-. <bes f' bes>->( <c c'>-.) r <des des'>-. |
  <ees c' ees>4-> <des bes' des>8-. <c aes' c>-. <bes g' bes>-. <aes f' aes>-. r <bes des ees bes'>-. |
  <aes c ees aes>4 \ottava 0 r4 r2 |

  aes4.( f8 g4. f8 | \acciaccatura bes,8 aes'4. f8 g4.) ees8( | g4. ees8 f4. ees8 | \acciaccatura aes,8 g'4. ees8 f4.) ees8( |

  aes4. f8 g4. f8 | \acciaccatura bes,8 aes'4. f8 g4.) ees8( |
  c'2) \tuplet 3/2 { r8 aes,-. c-. } \tuplet 3/2 { ees-.[ r f-.] } |
  \tuplet 3/2 { aes( bes c } ees8-.) r \tuplet 3/2 { f8-. ees-. g,-. } \tuplet 3/2 { ees-.[ r bes'-.] } |

  \key c \major
  <c, f c'>8-. r q-.[ r16 a'] <b, f' b>8-. r q-.[ r16 a'] |
  <c, f c'>8-. r q8. a'16 <b, f' b>8-. r q-. r16 \ottava 1 g'' |
  <b, e b'>8-. r q8. g'16 <a, e' a>8-. r q8. g'16 |
  <b, b'>8-. r <b e b'>8. g'16 <a, a'>8-. r <a e' a>8. g'16 |

  <c, c'>8-. r <c f c'>8. a'16 <b, b'>8-. r <b f' b>8. a'16 |
  <c, c'>8-. r <c f c'>8. a'16 <b, f' b>8-. r <b dis g>4 | \ottava 0
  \tuplet 3/2 { <e, g>8-. <dis fis>-. <e g>-. } <e g a>8-. r \acciaccatura { b'16 bes a } <e g>8-.[ r16 <fis b>(] <g c>8-.) r |
  <bes des g>4 \tuplet 3/2 { ees,8-. g-. c-. } \tuplet 3/2 { r b-. d,-. } \tuplet 3/2 { r bes'-. f-. }

  \key aes \major
  aes4.( f8 g4. f16 g | aes4. f8 g4.) ees8( |
  g4. ees8 f4. ees8 | g4. ees8 f4.) ees8( |

  aes4. f8 g4. f16 g | aes4. f8 g4.) ees8( |
  ees'4) \tuplet 3/2 { r8 ges,-. bes-. } c4 \tuplet 3/2 { bes8-. ges-. ees-. } |
  a,8. ees'16 <a, a'>8-.-> r \tuplet 3/2 { r8 <c c'>-. <des des'>-. } \tuplet 3/2 { <d d'>-. <ees ees'>-. <e e'>-. } |

  \ottava 1
  f'4. f8 ees4. ees8 | des4. des8 c4. c8 |
  << { <c ees>4. ees8 <f, des'>4. des'8 } \\ { r16 bes( a8) r4 r8 bes-. r4 } >> | c4. c8 bes4. bes8 | \ottava 0

  aes4.( f8 g4. f8 | aes4. f8 g4.) c8 |
  <aes c ees>4 r \tuplet 3/2 { <bes, f'>8-. q-. <aes des>-. } \tuplet 3/2 { <des, f bes>-.[ r <aes' des>-.] } |
  \tuplet 3/2 { <e c'>-. q-. <d g>-. } \tuplet 3/2 { a'4 f8 ~ } \tuplet 3/2 { f8 <e g>-. <f aes d>-. } r4 |

  R1 | R1 |

  \ottava 2
  ees'''4( <bes des>8 <aes c> <g bes> <f aes>-.) r <g bes>( |
  <aes c>4 <g bes>8 <f aes> <g bes> <aes c>-.) r <bes des>( |
  <c ees>4 <bes des>8 <aes c> <g bes> <f aes>-.) r <g bes>( |
  <c, c'>4) r e8. aes16 g8-. a,16[ b] |

  <aes' c>4( \acciaccatura { bes16 c } <g bes>8 <f aes> <d g> f-.) r g( |
  aes4 g8 f g aes8-.) \ottava 1 r <g, bes>( |
  <aes c>4 <g bes>8 <f aes> g f des g |
  f4) \ottava 0 r r2 |

  << { \voiceOne r4 \ottava 1 g8.( aes16 bes8. c16 des4 |
          <bes ees>8-.) \oneVoice r \voiceOne ees4 r8. des16( c8. bes16 |
        } \new Voice { \voiceTwo r2 <ees, g>8-. s s4 | s aes4 r4 aes8-. r } >> \oneVoice
  des8-.) r des4 ~ des8. c16( <ees, bes'>8. aes16
  <c, c'>2.->) r8. c''16 ~ |

  <ees, aes c ees>4-> <des bes' des>8-. <c aes' c>-. <bes g' bes>->( <aes f' aes>-.) r <bes bes'>-. |
  <c ees aes c>4-> <bes bes'>8-. <aes aes'>-. <bes des f bes>->( <c c'>-.) r <des des'>-. |
  <ees aes c ees>4-> <des bes' des>8-. <c aes' c>-. <bes g' bes>-. <aes aes'>-. r <bes des ees bes'>-. |
  <aes c ees aes>4 r r \tuplet 3/2 { r8 <ees ees'>-. <e e'>-. }

  \ottava 1
  f'4. f8 ees4. ees8 | des4. des8 c4. c8 |
  ees4. ees8 des4. des8  | c4. c8 bes4. bes8 | \ottava 0

  aes4.( f8 g4. f16 g | aes4. f8 g4.) c8 |
  <aes c ees>8 r r4 r2 | \tuplet 3/2 { r4 \ottava 1 ees'8-. } \tuplet 3/2 { <ees, g ees'>8-.-> <d d'>-. <ees ees'>-. } <aes c ees aes>->\arpeggio \ottava 0 r r4

} >>

rl = << \global \relative c' {
  r4 <f aes des>8-. r <g bes ees>-. <aes c f>-. r <bes des g>-. | R1 |

  r4 <c, ees>8-. r r4 <des ees>8-. r | r4 <c ees>8-. r r4 <des ees>8-. r |
  r4 <c ees>8-. r r4 <des ees>8-. r | r4 <c ees f>8-. r r2 |

  r4 <c f>8-.-> r r4 \acciaccatura { <fis, ais>8 } <g b>-. r |
  r4 \acciaccatura { a'8 } g8-. r e2-> |
  r4 <c f>8-. r r2 | r2 <ges' bes>8.( <f aes>16 <e g>8. <ees ges>16 |

  %{<des f>4) <aes des f>8-. r r4 <bes des ees>8-. r | r4 \acciaccatura { c16 des d } ees4 r8. des16( c8. bes16) |
  r4 <aes des fes>8-. r r8. c16 << { bes8. aes16 } \\ { <aes ees'>8-. r } >> | r8. \clef treble \ottava 1 e'''16 g8. f16 \tuplet 3/2 { g8 f g } aes8-. r | \ottava 0%}
    <des f>4) <aes des f>8-. r
  << { \voiceOne \shape #'((0 . -2) (-1 . 2) (0 . 0) (0 . 0)) Slur bes'8.( \crr \voiceTwo c16 des4 |
       ees8-.) \crl s
     } \new Voice {
       \voiceTwo r4 \oneVoice <bes, des ees>8-. r r4
  } >>
  \oneVoice <aes' c ees>8-. r << { \voiceOne r8. des16( c8. bes16 } \new Voice { \voiceTwo r4 <ees, aes>8-. r } >> \oneVoice
  des'8-.) r << { \voiceTwo des4 ~ des8. c16( bes8. aes16) } \new Voice { \voiceOne fes'4 ees r } >> \oneVoice
  \tuplet 3/2 { r4 \ottava 1 e'8 } \tuplet 3/2 { g4 f8 } \tuplet 3/2 { g f g } aes8-. \ottava 0 r16 c,,,( |

  <ees aes>2 f | ees f | ees f4 ees |
  c) \tuplet 3/2 { ees8-. g-. ees'-. } \tuplet 3/2 { e,4 <b' e>8-. } \tuplet 3/2 { f4 f'8-. }

  r4 \acciaccatura { f16 ees des } \stemDown <bes, des f>8-. r r4 \stemNeutral << { \acciaccatura d'8 ees8-. } \\ { <bes, des ees>-. } >> r |
  r4 << { \acciaccatura { ees''16 des } bes8-. } \\ { <bes,, des f>-. } >> r r4 << { \acciaccatura d'8 ees-. } \\ { <bes, des ees>-. } >> r |
  r4 << { \acciaccatura { ees'16 b } c8-. } \\ { <aes, c ees>-. } >> r r4 << { \acciaccatura g'8 aes-. } \\ { <aes, c ees>-. } >> r |
  r4 \acciaccatura { ees''16 c bes } \stemDown <aes, c ees>8-. r r4 \acciaccatura b8 <aes c ees>-. r \stemNeutral |

  r4 << { \acciaccatura { f''16 ees c } des8-. } \\ { <bes, des f>-. } >> r r4 << { \acciaccatura { g'''16 f c } des8-. } \\ { <bes,, des ees>-. } >> r |
  r4 << { \acciaccatura { f''16 ees c } des8-. } \\ { <bes, des f>-. } >> r r4 << { \acciaccatura { g'''16 f c } des8-. } \\ { <bes,, des ees>-. } >> r |
  r4 \tuplet 3/2 { <ees aes>8-.[ r <f bes>-.] } \tuplet 3/2 { r ees-. aes-. } \tuplet 3/2 { bes-.[ r c-.] } |
  \tuplet 3/2 { ees( f aes } bes-.) r \tuplet 3/2 { c-. bes-. c,-. } \tuplet 3/2 { aes-.[ r f'-.] } |

  \key c \major
  R1*2 | r2 r16 dis( e8-.) r16 f( e8-.) | << { \clr r16 \shape #'((0.8 . -5) (1 . 0) (0 . -5) (-0.7 . -2.5)) Slur e,( \crl b' e \crr \hideNotes \once \override NoteColumn.ignore-collision = ##t b'8) \unHideNotes } \new Voice { r8 s r4 r2 } >> \crl |

  R1*3 | r8 g16 d <g, c>4( <fis b> <f bes>) |

  \key aes \major
  r4 << { \acciaccatura ees'8 des-. } \\ { <bes, des f>-. } >> r r4 << { ees'8-. } \\ { <bes, des ees>-. } >> r |
  r4 << { \acciaccatura { f''16 ees c } des8-. } \\ { \acciaccatura { g,16[ e] } <bes des f>8-. } >> r << { \tuplet 3/2 { r8 <a'' c>-. <bes des>-. } <des g>8-. } \\ { r4 <bes,, des ees>8-. } >> r |
  r4 << { \acciaccatura ees'8 c-. } \\ { \acciaccatura g <aes, c ees>-. } >> r \acciaccatura { \stemDown bes'16 aes g } \stemDown f4 \stemNeutral << { \acciaccatura { \shape #'((0.5 . -1) (0 . -1) (0 . -1) (0 . -1)) Slur d'8 } \hideNotes \stemDown ees, \unHideNotes } \\ { \acciaccatura f8 <aes, c ees>-. } >> r |
  r4 << { \acciaccatura { g'16 aes bes } c8-. <aes c> } \\ { <aes, c ees>8-. r } >> << { <c'' f>16 <bes ees> <aes c>8 r16 b,( c8) } \\ { r4 <aes, c ees>8-. r } >>

  r4 << <bes' des>8-. \\ <bes, des f>8-. >> r r4 << <bes' des>8-. \\ <bes, des ees>8-. >> r |
  r4 << { \acciaccatura { a'16^\> bes c } des8-.\! } \\ { \acciaccatura { <c, e>16_\> <des f> <ees g> } <f aes>8-.\! } >> r r4 \clr \acciaccatura { d,16 ees c' } \crl <bes des ees>8-. r |
  r4 <ees ges>8-. r r4 q8-. r | r4 <c ees>8-. r r4 <a c f>8-. r |

  f''4. f8 ees4. ees8 |
  << {
    r4 a8-. r r4 f8-. r | \voiceTwo r4 a,8-. r \voiceOne s2 | r8 fes'-. r4 r8 <des fes>-. r4 |
     } \\ {
    des4. des8 c4. c8 | \voiceOne ees4. ees8 \voiceTwo des4. des8 | c4. c8 bes4. bes8 |
  } >>

  << { aes8 ees'16[( bes] c8-.) r } \\ { ees,2 } >> d4 <b d f>8-. r | <des aes'>4 \acciaccatura { f''16 ees des bes } <bes,, des f>8-. r \tuplet 3/2 { r8 <g' c>-. <f bes>-. } <des ees g>-. \noBeam c' |
  r4 <c, ees>8-. r r2 | R1 |

  r4 <f aes des>8-. r <g bes ees>-. <aes c f>-. r <bes des g>-. |
  <c ees aes>4 <des f bes>8-. r <ees g c>-. <f aes des>-. r <g b d> |

  \ottava 1
  <c ees>4( des8 c bes aes-.) r bes( | c4 bes8 aes bes c-.) r des( |
  ees4 des8 c bes aes-.) r bes |
  \tuplet 3/2 { c,8( des d } f-.) r e8. aes16 g8-. a,16[ b] |

  <c c'>4( bes'8 aes <b, g'> f'-.) r g( |
  <des aes'>4 g8 f <c g'> aes'-.) \ottava 0 r4 |
  r4 <c,, f>8-. r \acciaccatura { bes'16 des } <g, b d>8( f <des f> g |
  <f aes>4) r <ges bes>8.( <f aes>16 <e g>8. <ees ges>16 |

  <des f>4) \tuplet 3/2 { <aes des f aes>8-. <des f aes>4 }
  << { \voiceOne \shape #'((0 . -2) (-1 . 2) (0 . 0) (0 . 0)) Slur bes'8.( \crr \voiceTwo c16 des4 |
       ees8-.) \crl s
     } \new Voice {
       \voiceTwo r4 \oneVoice \tuplet 3/2 { <des, ees>8-. <des g>-. <f g bes>-. } r4
  } >>
  \oneVoice <aes c ees>4 << { \voiceOne r8. des16( c8. bes16 } \new Voice { \voiceTwo r4 <ees, aes>8-. r } >> \oneVoice
  des'8-.) r << { \voiceTwo des4 ~ des8. c16( bes8. aes16) } \new Voice { \voiceOne fes'4 ees r } >> \oneVoice
  \tuplet 3/2 { r4 \ottava 1 e'8( } \tuplet 3/2 { f8 g f } \tuplet 3/2 { g f g } aes8-.) \ottava 0 r16 c,,,( |

  ees16) f ees f ees8-. ees16[ g] f g f g f g f8-. | \acciaccatura bes, <aes c>8-.-> r q-. r << { f'2-> } \\ { \cll \acciaccatura { \oneVoice ees,,,8 } \crl \voiceTwo <aes'' c>8-.-> r <aes c>-. r } >> |
  ees'16 f ees f ees f ees e f g f e <des ees>8-. r |
  c4 \tuplet 3/2 { ees8-. <g bes>-. ees'-. } \tuplet 3/2 { e,8-. <gis b>-. e'-. } f,8-. r |

  f'4. f8 ees4. ees8 |
  << {
    r4 a8-. r r4 f8-. r | \voiceTwo r4 a,8-. r r4 bes8-. r \voiceOne | r8 <fes' aes>-. r4 r8 <des fes>-. r4 |
     } \\ {
    des4. des8 c4. c8 | \voiceOne ees4. ees8 des4. des8 \voiceTwo | c4. c8 bes4. bes8 |
  } >>

  << { aes8 ees'16[( bes] c8-.) r } \\ { ees,2 } >> d4 <b d f>8-. r | <des aes'>4 \acciaccatura { f''16 ees des bes } <bes,, des f>8-. r \tuplet 3/2 { r4 <f' bes>8( } <des ees g>-.) \noBeam c' |
  R1 | r4 <bes des>8-.-> r r2 |
} >>

rd = {
  s1*2\mp

  s1*4

  s1*3 s2 s\<

  s1*4\mf

  s1*3 s4 s\< s s\>

  s1*4\mp

  s1*3 s2\< s4\> s\!

  s1 s2. s4\< s1*2\!

  s1*3 s2 s\>

  s1*4\mp

  s1*3 s2 s\<

  s1*3\mf s1\>

  s1\mp s2 s\< s1\! s\>

  s1*2\mp

  s1*4

  s1*3 s2 s\<

  s1*4\mf

  s1*3 s4 s\< s s\>

  s1*3\mf s1\>

  s1\mp s2 s\< s1\! \tuplet 3/2 { s4 s8\f }
}

lr = << \global \relative c' {
  \clef bass
  ees2. r8 ees-. | ees4 ees8-. r ees-. ees-. r b( |

  c4 bes8 aes g f-.) r g( | aes4 g8 f g aes-.) r8 bes( |
  c4 bes8 aes g f-.) r g( | aes4) r e( f8. g16 |

  aes4 g8 f d2) | <f aes des>4 \acciaccatura { a8 } <bes des>8-. r r4 <e, g bes c>8-. r |
  aes4( g8 f d4 <des f bes> | <c f>4) aes'8.( c16 bes8. aes16 g8. ges16 |

  %{f4) r g2 | ees4 r aes2 |
  fes2 ees | << { \slashedGrace { \tieDown f8 ~ } <f c'>2. \tieNeutral r8. c'16 } \\ { r8. e,16 g8. f16 \tuplet 3/2 { g8 f g } aes8-. r } >> |%}
  f2) g2 | ees4 \acciaccatura { c'16 des d } ees4-> << { \voiceOne r8. des16( c8. bes16 } \new Voice { \voiceTwo aes2 } >> |
  << { \voiceOne des8-.) r des4 ~ des8. c16( bes8. aes16 } \new Voice { \voiceTwo r4 <aes fes'>8-. r r4 <c ees>8-. r } >> \oneVoice |
  << { \voiceOne \slashedGrace { \tieDown f,8-> ~ } <f c'>2.->) } \new Voice { \voiceTwo \tuplet 3/2 { r4 \slurUp e8( } \tuplet 3/2 { g4 f8 } \tuplet 3/2 { g f g } \oneVoice aes8-.) r } >> \oneVoice |

  <aes c>4-> <aes c>8-. r \cll \acciaccatura { ees,,8( } \clr <f'' aes des>8-.->) r \acciaccatura { c'8 } <aes des>8-. r |
  <aes c>8-.-> r q-. r \cll \acciaccatura { ees,,8( } \clr <f'' aes des>8-.->) r <aes bes des>8-. r |
  r4 <aes c>8-. r \cll \acciaccatura { ees,,8( } \clr <f'' aes des>8-.) r <ees bes' des>-. r |
  r4 <ees g bes>( <e gis b> <f a c>) |

  aes4.( f8 g4. f8 | aes4. f8 g4.) ees8( | g4. ees8 f4. ees8 | g4. ees8 f4.) ees8( |

  aes4. f8 g4. f8 | aes4. f8 g4.) ees8( |
  c'4) <aes c>8-. r f4 <c' ees>8-. r | ees,4 <c' f aes>8-. r f,4 <c' f>8-. r |

  \key c \major
  \clef treble
  a'2( g | a g) | g( a | g a) |

  a( g | a g) | R1 | <bes, ees>2 r |

  \key aes \major
  \clef bass
  aes4.( f8 g4. f16 g | aes4. f8 g4.) ees8( |
  g4. ees8 f4. ees8 | g4. ees8 f4.) ees8( |

  aes4. f8 g4. f16 g | aes4. f8 g4.) ees8( |
  ees'4 bes c bes | <f a> ges f ees) |

  \clef treble
  r4 \acciaccatura <ees' ges>8 <des f bes>8-. r \tuplet 3/2 { r8 <f, a> <ges bes> } <ees' ges bes>8-. r |
  r4 \acciaccatura e8 <f a>-. r r4 \acciaccatura ges8 <f a>-. r |
  \clef bass
  << { ges2( f | fes1) } \\ {
    ges,4 <a c ees>8-. r f4 \acciaccatura { bes16 b c } des8-. r |
    fes,4 \acciaccatura c'8 <fes, aes bes>8-. r r4 \acciaccatura c'8 <aes bes>-. r |
  } >> |

  << { \voiceTwo aes4.( f8 } \new Voice { \voiceOne r4 c'8-. r } >> \oneVoice g4. f8 | aes4. f8 g4.) c8 |
  <ees, c'>4\arpeggio( bes' <des, aes'>\arpeggio <f aes>8-.) r | r4 <a c ees> bes \tuplet 3/2 { b8-. c-. d-. }

  ees2. r8 ees-. | ees4 ees8-. r ees-. ees-. r b |

  c16 ees c ees bes des aes c <g bes>8-.[ <f aes>-.] <des' ees>-. g,16[ bes] |
  aes ees' aes, ees' <g, c> ees' f, ees' g, ees' aes,8-. <des ees>-. r16 des |
  c des d f <bes, ees> des aes c g bes <f aes>8-. <des' ees>-. g,16[( <f bes>]
  ees4) <c' ees>8-. r e,4( f8. g16

  aes4 g8 f d16) d' f d \cll \acciaccatura { g,16 a } <g b> \clr d' \cll d, \clr d' |
  \cll f,16 \clr f' \cll f, \clr f' \cll f,16 \clr f' \cll f, \clr f'
  \cll c,16 \clr e' \cll c, \clr e' \cll c,16 \clr e' \cll c, \clr e' |
  aes,4( g8 f d4 <des f bes> | <c f>) aes'8.( c16 bes8. aes16 g8. ges16 |

  f4) r g2 | ees4 \acciaccatura { c'16 des d } ees4 << { \voiceOne r8. des16( c8. bes16 } \new Voice { \voiceTwo aes2 } >> |
  << { \voiceOne des8-.) r des4 ~ des8. c16( bes8. aes16 } \new Voice { \voiceTwo r4 <aes fes'>8-. r r4 <c ees>8-. r } >> \oneVoice |
  << { \voiceOne <f, c'>2.->) } \new Voice { \voiceTwo \tuplet 3/2 { r4 \slurUp e8( } \tuplet 3/2 { f8 g f } \tuplet 3/2 { g f g } \oneVoice aes8-.) r8 } >> \oneVoice |

  aes8-.-> r <aes c>-. r \cll \acciaccatura { ees,, } \clr <aes'' des>-.-> r \acciaccatura c <aes des>-. r |
  ees16 f ees f ees f ees e f g f g f g f d |
  ees4 <aes c>8-. r \cll \acciaccatura ees,,8 \clr f''4 ees | r4 <ees g bes>( <e gis b> <ees a c>) |

  \clef treble
  r4 \acciaccatura <ees' ges>8 <des f bes>8-. r \tuplet 3/2 { r8 <f, a>( <ges bes> } <ees' ges bes>8-.) r |
  r4 \acciaccatura e8 <f a>-. r r4 \acciaccatura ges8 <f a>-. r |
  \clef bass
  << { ges2( f | fes1) } \\ {
    ges,4 <a c ees>8-. r f4 \acciaccatura { bes16 b c } des8-. r |
    fes,4 \acciaccatura c'8 <fes, aes bes>8-. r r4 \acciaccatura c'8 <aes bes>-. r |
  } >> |

  << { \voiceTwo aes4.( f8 } \new Voice { \voiceOne r4 c'8-. r } >> \oneVoice g4. f16 g | aes4. f8 g4.) c8 |
  c8\arpeggio r <f, aes>8. <e bes'>16 << { c'8.\arpeggio ees16 } \\ ees,4\arpeggio >> <f aes bes f'>4 ~ |
  q ees'8-.-> r c8->\arpeggio r r4 |
} >>

ll = << \global \relative c {
  \clef bass
  r2 r4 r8 ees-. | ees4 ees8-. r ees-. ees-. r4 |

  <aes, ees'>4 r ees8-. r r4 | \acciaccatura { c'16 des } <aes ees'>4 r ees8-. r8 r4 |
  \acciaccatura { f'8 } <aes, ees'>4 r ees8-. r r4 | \acciaccatura { c'16 des } <aes ees'>4 r c,( d |

  f8-.) r r4 <c g'>8-. r r4 | f8-. r r4 c4 r |
  f8-. r r4 c4 f8-. r | f4 r <aes ees'>2 |

  %{<des, aes'>4 r des8-. r r4 | c4 r f8-. r r4 |
  fes8-. r r4 ees8-. r r4 | \slashedGrace { <bes bes'>8 ~ } q1 |%}
  <des, aes'>4 r des8-. r r4 | c8-. r r4 f8-. r r4 |
  << { fes'2 ees } \\ { fes,8-. r r4 ees8-. r r4 } >> | \slashedGrace { <bes bes'>8-> ~ } <bes bes'>1 |

  <ees ees'>4-> r r2 | q8-.-> r r4 r2 | q4-> r r2 | <aes ees'>4\arpeggio r r2 |

  bes8-. r r4 \acciaccatura ees8 ees,8-. r r4 | bes'8-. r r4 \acciaccatura ees8 ees,8-. r r4 |
  aes8-. r r4 ees8-. r r4 | aes8-. r r4 ees8 r r4 |

  bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 | bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 |
  aes4 r ees8-. r r4 | aes4 r ees8-. r r4 |

  \key c \major
  \clef treble
  << {
       r16 e''( <d f>8-.) r q-. r q-. r q-. | r4 q r q |
       r <c e> r8 q-. r q-. | r q4 q8-. r q-. r16 dis( <c e>8-.) |
     } \\
     { a2( g4 ~ g16 c b8 | a2 g) | g( a | g a) } >>

  << {
       r4 \tuplet 3/2 { <c f>8-. q r } r4 \acciaccatura ais8 <b f'>8-. r | r4 <c f> r <b f'> |
     } \\
     { a2( g | a g) } >>
  \clef bass
  e4( g c b) | <ees,, ees'>2 r |

  \key aes \major
  bes'8-. r r4 ees,8-. r r4 | bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 |
  aes8-. r r4 ees8-. r r4 | aes8-. r r4 ees8-. r r4 |

  bes'8-. r r4 ees,8-. r r4 | bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 |
  c'4 r ges r | f r f r |

  <des des'>4 r <c c'> r | <f f'> r \acciaccatura { \slurUp \stemDown f,8 } \stemUp ees''4 r | \stemNeutral
  bes,2 bes' | des, des' |

  ees,2 <d b'> | <des bes'>4. r8 \acciaccatura { des'16 bes } ees,4 r |
  <aes, aes'>4\arpeggio r <des aes'>\arpeggio r | c f bes, r |

  r2 r4 r8 ees'-. | ees4 ees8-. r ees-. ees-. r4 |

  <aes, ees'>4 r ees8-. r r4 | <aes ees'>4 r ees8-. r r4 |
  <aes ees'>4 r ees8-. r r4 | aes4 r c,4( d |
  f8-.) r r4 <c g'>8-. r \voiceTwo <g'' b>4 | f,8-. r \clr \voiceOne \acciaccatura a' <g bes>4 \cll \voiceTwo c,8-. r \clr \voiceOne \acciaccatura b' <g bes c>4 | \cll \oneVoice
  f,8-. r r4 c8-. r f-. r | f4 r <aes ees'>2

  <des, aes'>4 r des8-. r r4 | c8-. r r4 f8-. r r4 |
  << { fes'2 ees } \\ { fes,8-. r r4 ees8-. r r4 } >> | <bes bes'>1-> |

  <ees ees'>4-> r r2 | ees8-.-> r r4 r2 | ees4-> r r2 | <aes ees'>4\arpeggio r r2 |

  <des, des'>4 r <c c'> r | <f f'> r \acciaccatura { \slurUp \stemDown f,8 } \stemUp ees''4 r | \stemNeutral
  bes,2 bes' | des, des' |

  ees,2 <d b'> | <des bes'>4. r8 \acciaccatura { des'16 bes } ees,4 r |
  <aes ees'>8\arpeggio r des,4 aes'\arpeggio <f d'> ~ |
  q r <aes ees'>8->\arpeggio r r4
} >>

ld = {
  s1*2\mp

  s1*3 s2 s\<

  s\> s\! s1*2 s2 s\<

  s1*4\mf

  s1*3 s4 s\< s s\>

  s1*4\mp

  s1*3 s2\< s4\> s\!

  s1 s2. s4\< s1*2\!

  s1*3 s2 s\>

  s1*4\mp

  s1*3 s2 s\<

  s1*3\mf s1\>

  s1\mp s2 s\< s1\! s\>

  s1*2\mp

  s1*3 s2 s\<

  s\> s\! s1*2 s2 s\<

  s1*4\mf

  s1*3 s4 s\< s s\>

  s1*3\mf s1\>

  s1\mp s2 s\< s4\mf s2.\< s4 s4\f
}

pedal = {
}

\score {
  <<
    \new PianoStaff \with {
      connectArpeggios = ##t
    } <<
      \new Staff = "rr" \with {
        midiInstrument = "acoustic grand"
      } \rr
      \new Dynamics = "dynamics" \rd
      \new Staff = "rl" \with {
        midiInstrument = "acoustic grand"
      } \rl
    >>
    \new PianoStaff \with {
      connectArpeggios = ##t
    } <<
      \new Staff = "lr" \with {
        midiInstrument = "acoustic grand"
      } \lr
      \new Dynamics = "dynamics" \ld
      \new Staff = "ll" \with {
        midiInstrument = "acoustic grand"
      } \ll
      \new Dynamics = "pedal" \pedal
    >>
  >>
  \layout {
    %system-count = 5
  }
  \midi {
    %\tempo 8=195
  }
}