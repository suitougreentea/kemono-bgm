\version "2.19.57"

\include "stylesheet.ily"

cll = \change Staff = "ll"
clr = \change Staff = "lr"
crl = \change Staff = "rl"
crr = \change Staff = "rr"

%{\header {
  title = "二人でお茶を"
  subtitle = \markup { \center-column { \normal-text \italic "from Kemono Friends episode 12" \bold \italic "Faithful copy for 4 hands" } }
  composer = "Original by Vincent Youmans"
  revision = "Revision 1"
  date = "2017/4/14"
}%}

\paper {
  %page-count = 8
  %system-count = 26
  %max-systems-per-page = 3
}

global = {
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
  %\set Score.skipTypesetting = ##t
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
    \voiceTwo s2 <b, d> | <bes des> <bes c>8 r s4 | s2 \acciaccatura { bes16 des } <b d>4 <bes des> | <c f>2 r2 |
  } >> \oneVoice

  << { \voiceOne \ottava 1 f4( g8. aes16 bes8. c16 des4 |
       ees8-.) \oneVoice r \voiceOne ees4 ~ ees8. des16( c8. bes16 |
       des8-.) r des4 ~ des8. c16( bes8. aes16 |
     } \new Voice {
       \voiceTwo <aes, des>8-. r r4 <ees' g>8-. r r4 | bes'8-. s aes4 ~ aes2 |
       r4 aes ~ aes ees8-. r |
  } >> \oneVoice
  <c aes' c>2.) ~ q8 r16 c''


  <ees, c' ees>4-> <des bes' des>8-. <c aes' c>-. <bes f' aes bes>->( <aes aes'>-.) r <bes bes'>-. |
  <c ees c'>8->-. r <bes bes'>-. <aes aes'>-. <bes f' aes bes>->( <c c'>-.) r <des des'>-. |
  <ees c' ees>8->-. r <des bes' des>-. <c aes' c>-. <bes f' aes bes>-. <aes aes'>-. r <bes des ees bes'>-. |
  <aes c ees aes>8-. \ottava 0 r \tuplet 3/2 { ees,8-. <g bes>-. ees'-. } \tuplet 3/2 { e,4 <b' e>8-. } \tuplet 3/2 { f8-. c'-. f-. }

  aes4.( f8 g4. f8 | \acciaccatura bes,8 aes'4. f8 g4.) ees8( | g4. ees8 f4. ees8 | \acciaccatura aes,8 g'4. ees8 f4.) ees8( |

  aes4. f8 g4. f8 | \acciaccatura bes,8 aes'4. f8 g4.) ees8( |
  c'1) | \tuplet 3/2 { <ees, aes>8-. <f bes>-. <aes c>-. } <c ees>8-. r \tuplet 3/2 { <c f>8-. <bes ees>-. <c, g'>-. } <ees aes>8-. r16 bes' |

  \key c \major
  <c, f c'>8-. r q-.[ r16 a']( <b, f' b>8-.) r q-.[ r16 a']( |
  <c, f c'>8-.) r q-.[ r16 a']( <b, f' b>8-.) r q-. r16 \ottava 1 g''( |
  <b, e b'>8-.) r q-.[ r16 g']( <a, e' a>8-.) r q-.[ r16 g']( |
  <b, e b'>8-.) r q-.[ r16 g']( <a, e' a>8-.) r q-. r16 g'( |

  <c, f c'>8-.) r q-.[ r16 a']( <b, f' b>8-.) r q-.[ r16 a']( |
  <c, f c'>8-.) r q-.[ r16 a']( <b, f' b>8-.) r <b dis g b>4
  <e g c e>1 | <ees g bes des ees>2 \ottava 0 r2 |

  \key aes \major
  aes,4.( f8 g4. f8 \acciaccatura g | aes4. f8 g4.) ees8( |
  g4. ees8 f4. ees8 | g4. ees8 f4.) ees8( |

  aes4. f8 g4. f8 \acciaccatura g | aes4. f8 g4.) ees8( |
  << { \voiceOne ees'1) ~ | \oneVoice ees2 } \new Voice {
    \voiceTwo r4 \tuplet 3/2 { ees,8-. ges-. bes-. } c8-. r \tuplet 3/2 { bes8-. ges-. ees-. } |
  } >>
  \tuplet 3/2 { r8 <c c'>-. <des des'>-. } \tuplet 3/2 { <d d'>-. <ees ees'>-. <e e'>-. } |

  %\set Score.skipTypesetting = ##f
  \ottava 1
  << {
    \voiceOne
    <f f'>4 r8 q <ees ees'>4 r8 q | <des des'>4 r8 q <c c'>4 r8 q |
    <ees ees'>4 r8 q <des des'>4 r8 q | <c c'>4 r8 q <bes bes'>4 r8 q |
     } \new Voice {
    \voiceTwo
    r4 bes'8-. r r4 <ges bes>8-. r | r4 a8-. r r4 f8-. r |
    r8 \acciaccatura bes <ges a>-. r4 r8 bes8-. r4 | r8 <fes aes>-. r4 r8 <des fes>-. r4 |
  } >>
  \ottava 0 \oneVoice

  aes'4.( f8 g4. f8 | aes4 \acciaccatura { f'16 ees des bes } aes8 f g4.) c8( |
  <aes, ees' aes>2) \tuplet 3/2 { <bes f'>8-. q-. <aes des>-. } \tuplet 3/2 { <des, f bes>-.[ r <aes' des>-.] } |
  \tuplet 3/2 { <e c'>-. q-. <d g>-. } \tuplet 3/2 { <c f>4 <f a c>8-. } \tuplet 3/2 { <f aes bes d>8-. <e g bes>-. <f aes bes d>-. } r4 |

  R1 | r2 r4 r8 \ottava 1 d''8-. |
  \set Score.skipTypesetting = ##t

  \ottava 2
  ees'''4( <bes des>8 <aes c> <g bes> <f aes>-.) r <g bes>( |
  <aes c>4 <g bes>8 <f aes> <g bes> <aes c>-.) r <bes des>( |
  <c ees>4 <bes des>8 <aes c> <g bes> <f aes>-.) r <g bes>( |
  <c, c'>4) r e8. aes16 g8-. a,16[ b] |

  <c aes' c>4( \acciaccatura { bes'16 c } <g bes>8 <f aes> <d g> f-.) r g( |
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
  r4 <f aes des>8-. r <g bes ees>-. <aes c f>-. r <bes des g>-. | r2 r4 r8 d-. |

  << {
    \voiceOne ees4( des8 c bes aes-.) r bes( | c4 bes8 aes bes c-.) r des(
    ees4 des8 c bes aes-.) r bes( | c2)
     } \new Voice {
    \voiceTwo r4 <ees, aes>8-. r r4 <des ees>8-. r | r4 <c ees>8-. r r4 <des ees>8-. r |
    r4 <ees aes>8-. r r4 <des ees>8-. r | r4 <c ees aes>8-. r
  } >> \oneVoice r2 |
  << {
    c'4^( bes8 aes \voiceOne g f-.) r g( | aes4 g8 r g aes-.) r bes( | \oneVoice c4 bes8 aes \voiceOne g f-.) r g( | \oneVoice aes2)
     } \new Voice {
    \voiceTwo s2 d,2 | f e | s2 r4 <bes des>8-. r |
  } >> \oneVoice
  <ges' bes>8.( <f aes>16 <e g>8. <ees ges>16) |

  << { f4( g8. aes16 bes8. c16 des4 | ees8-.) r \voiceOne ees4 ~ ees8. des16( c8. bes16 |
       \voiceTwo des8-.) r des4 ~ des8. c16^( \voiceOne bes8. aes16)
       \oneVoice \ottava 1 \tuplet 3/2 { r4 e''8-. } \tuplet 3/2 { g8-.[ r f-.] } \tuplet 3/2 { g-. f-. g-. } \oneVoice aes8-. \ottava 0 r16 c,,,^(
     } \new Voice {
       s1 | s4 \voiceTwo <aes' c>8-. r r4 aes8-. r | \voiceOne r4 fes'( ees) \voiceTwo aes,8-. r |
  } >>

  << {
    \voiceOne ees2( f | ees f | ees f4 ees) |
     } \new Voice {
    \voiceTwo c8-. r c-. r <bes des>8-. r \acciaccatura c q8-. r |
    c8-. r c-. r <bes des>8-. r q-. r | r4 c8-. r <bes des>8-. r des8-. r |
  } >> \oneVoice
  c8-. r <g bes>4 ( <gis b> <a c>) |

  r4 \acciaccatura { f''16 ees des } bes8-. r r4 \acciaccatura d8 <bes ees>8-. r |
  r4 \acciaccatura { f''16 ees des } bes8-. r r4 \acciaccatura d,8 <bes ees>8-. r |
  r4 \acciaccatura { ees16 b c } aes8-. r r4 \acciaccatura g8 aes-. r |
  r4 \acciaccatura { ees'16 c bes } aes8-. r r4 aes8-. r |

  r4 \acciaccatura { f'16 ees c } des8-. r r4 \acciaccatura { g'16 f c } des8-. r |
  r4 \acciaccatura { f,16 ees c } des8-. r r4 \acciaccatura { g'16 f c } des8-. r |
  r4 \tuplet 3/2 { <ees,, aes>8-.[ r <f bes>-.] } \tuplet 3/2 { <aes c>-. <ees aes>-. <aes c>-. } \tuplet 3/2 { <aes c ees>-.[ r <c f>-.] } |
  r4 <c, f aes>8-. r r4 q8-. r |

  \key c \major
  a'2( g | a g) |
  << { \voiceTwo g( a | g a) } \new Voice {
    \voiceOne r4 \acciaccatura { g'16 e c } b8-. r r \acciaccatura dis e-. r \acciaccatura f e-. |
    r16 b( c e \crr \hideNotes \once \override NoteColumn.ignore-collision = ##t b'8) \unHideNotes
  } \new Voice { s1 | s4 \voiceOne r4 r2 } >>

  << { \voiceTwo a,2( g | a g) } \new Voice {
    \voiceOne r4 \tuplet 3/2 { <c f>8-. q r } r4 <b d f>8-. r |
    \tuplet 3/2 { r <e f a>-. <d f a>-. } <c f a>-. r r4 f,8-. r
  } >> \oneVoice
  \tuplet 3/2 { <g c e>8-. <c e fis>-. <c e g>-. } <e g a>8-. r \acciaccatura { b'16 bes a } <e g c>8-.[ r16 <dis g b>-.] <e g c>8-.) r |
  << {
    \voiceOne <ees g des'>8-. g16[ d] \oneVoice \tuplet 3/2 { ees8-. g-. c-. } \tuplet 3/2 { r b-. d,-. } \tuplet 3/2 { r bes'-. f-. }
     } \new Voice {
    \voiceTwo des4( \clr \voiceOne c b bes)
  } >>

  \key aes \major
  r4 \acciaccatura <c ees>8 <bes des>-. r r4 <bes des ees>8-. r |
  r4 \acciaccatura { f'16 ees c } des8-. r \tuplet 3/2 { r8 <a' c>-. <bes des>-. } <des ees g>8-. r |
  r4 \acciaccatura <c, ees>8 aes-. r \acciaccatura { bes16 aes g } f8-. r aes-. r |
  r4 \acciaccatura { g16 aes bes } aes8-. <aes c> <c' f>16-. <bes ees>-. <aes c>8 << { <ees bes'>16-.[ aes-.] } \\ { aes,16-.[ b-.] } >> r8 |

  r4 <bes des>8-. r r4 <bes des>8-. r |
  r4 << { \acciaccatura { a16^\> bes c } des8-.\! } \\ { \acciaccatura { e,16_\> f g } aes8-.\! } >> r r4 \clr \acciaccatura { d,,16 ees c' } \crl <bes des ees>8-. r |
  r4 <ees ges>8-. r r4 q8-. r | c'8-. r \acciaccatura ees <a, a'>-. r r4 <a, c f>8-. r |

  r4 \acciaccatura <ees' ges c>8 <des f bes>-. r r4 <ees ges bes>8-. r |
  r4 \acciaccatura e8 <f a>-. r r4 \acciaccatura ges8 <f a>-. r |
  << { \voiceOne ges2( \oneVoice f | fes1) } \new Voice { \voiceTwo r4 a8-. r } >>

  << { aes8-. ees'16[ bes] <c, aes'>8-. r g'-. r <b, f' g>-. r | aes'8-. r <bes, f'>-. r } \\ { ees2( d | des) } >> \tuplet 3/2 { r8 <g c>-. <f bes>-. } <des ees g>-. r |
  r4 ees8-. r r2 | R1 |

  r4 <f aes des>8-. r <g bes ees>-. <aes c f>-. r <bes des g>-. |
  <c ees aes>8-. r <des f bes>-. r <ees g c>-. <f aes des>-. r <d b'>-. |

  \ottava 1
  <c ees>4( des8 c bes aes-.) r bes( | c4 bes8 aes bes c-.) r des( |
  ees4 des8 c bes aes-.) r bes |
  \tuplet 3/2 { c,8( des d } f-.) r e8. aes16 g8-. a,16[ b] |

  c4( bes'8 aes <b, g'> f'-.) r g( |
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
  << { \voiceTwo s1 | r2 r4 r8 b^( } \new Voice { \voiceOne ees1 ~ | ees } >> | \oneVoice

  << {
    \voiceOne c4 bes8 aes g f-.) r g( | aes4 g8 f g aes-.) r8 bes( |
    c4 bes8 aes g f-.) r g( | aes2)
     } \new Voice {
    \voiceTwo ees1 | \acciaccatura { c16 des d } ees1 | \acciaccatura f8 ees1 | \acciaccatura { c16 des d } ees2
  } >> \oneVoice e4_( f8. g16 |

  << { \voiceTwo aes4 g8 f d2 | des c) } \new Voice { \voiceOne r4 <c' f>8-. r r4 \acciaccatura <fis, ais>8 <g b>-. r | r4 \acciaccatura a8 <bes des>-. r r4 <g bes c>8-. r } >> |
  << { \voiceOne r4 <c f>8-. r r4 f,8-. r | r8. f16( aes8. c16 bes8. aes16 g8. ges16 } \new Voice { \oneVoice aes4_( g8 f d4 \voiceTwo des | c2) <ees c> } >>|

  << {  \voiceTwo f2)( g2 | ees aes \cll \voiceOne fes ees) } \new Voice {
    \voiceOne r4 <aes des>8-. r r4 <bes des ees>8-. r | r4 \acciaccatura { c16 des d } ees4-> r8. des16( c8. bes16 | des8-.) r des4 ~ des8. c16( bes8. aes16 | <f c'>2.) ~ q8 r |
  } \new Voice {
    s1 | s | \voiceTwo r4 <aes fes'>8-. r r4 <c ees>8-. r | \tuplet 3/2 { r4 e,8-. } \tuplet 3/2 { g8-.[ r f-.] } \tuplet 3/2 { g-. f-. g-. } \oneVoice aes8-. r
  } >> \oneVoice \clr

  << {
     \voiceOne aes8-. r aes-. r aes-. r aes-. r | aes-. r aes-. r aes-. r aes-. r | r4 aes8-. r aes-. r g-. r |
     \oneVoice r4 ees8-. r e-. r f-. r
     } \new Voice {
     \voiceTwo
     ees2( f | ees f | ees f4 ees) |
  } >>

  << {
    \voiceTwo
    aes4.( f8 g4. f8 | aes4. f8 g4.) ees8( | g4. ees8 f4. ees8 | g4. ees8 f4.) ees8( |
     } \new Voice {
    \voiceOne
    r4 <bes' des f>8-. r r4 <bes des ees>8-. r | r4 <bes des f>8-. r r4 <bes des ees>8-. r |
    r4 <c ees>8-. r r4 <c ees>8-. r | r4 <c ees>8-. r r4 \acciaccatura b8 <c ees>8-. r |
  } >>

  << {
    \voiceTwo aes4. f8 g4. f8 | aes4. f8 g4.) ees8^( |
    \voiceOne c'2.) <c f>8-. r |
     } \new Voice {
    \voiceOne r4 <bes des f>8-. r r4 <bes des ees>8-. r | r4 <bes des f>8-. r r4 <bes des ees>8-. r |
    \voiceTwo ees,2( f | \oneVoice ees f) |
  } >>

  \key c \major
  \clef treble
  << {
       r8 \acciaccatura e' <d f>-.) r \acciaccatura cis <c f>-. r \acciaccatura cis <d f>-. r \acciaccatura c <b f'>-. |
       r4 <d f>8-. r r4 <b f'>8-. r |
       r4 <c e>8-. r r q-. r q-. | r q-. r q-. r q-. r8 \acciaccatura dis <c e>8-. |
     } \\
     { a2( g2 | a2 g) | g( a | g a) } >>

  << {
       \voiceOne r4 \tuplet 3/2 { <c f>8-. q r } r4 \acciaccatura ais8 <b d f>8-. r | \tuplet 3/2 { r8 e-. d-. } <c f>-. r r4 b8-. r |
     } \new Voice {
       \voiceTwo a2( g | a g) |
       e8-. r g4( c b) | <ees g>2( <d fis>4 <des f>) |
     } \new Voice {
       s1 | s2. \voiceFour dis4^( |
       \voiceOne e1) | r4
  }>>

  \key aes \major
  \clef bass
  << {
    \voiceTwo
    aes,4.( f8 g4. f8 | \acciaccatura g aes4. f8 g4.) ees8( | g4. ees8 f4. ees8 | g4. ees8 f4.) ees8( |
     } \new Voice {
    \voiceOne
    r4 <bes' des f>8-. r r4 <bes des ees>8-. r | r4 \acciaccatura { aes'16 g e } <bes des f>8-. r r4 <bes des ees>8-. r |
    r4 \acciaccatura g'8 <c, ees>8-. r r4 \acciaccatura d8 <c ees>8-. r | r4 <c ees>8-. r r4 <c ees>8-. r |
  } >>

  << {
    \voiceTwo aes4. f8 g4. f8 | \acciaccatura g aes4. f8 g4.) s8 |
    r4 bes( c bes | a ges f ees) |
  } \new Voice {
    \voiceOne r4 <bes' des f>8-. r r4 <bes des ees>8-. r | r4 \acciaccatura { c16^\> des ees } f8-.\! r r4 s8 \voiceTwo ees,8^( | \voiceOne ees'1) ~  ees2
  } \new Voice {
    s1*3 | s4 \voiceOne c8-. r r2 |
  } >>

  << {
    \voiceOne s2 \tuplet 3/2 { r8 <f, a>-. <ges bes>-. } r4 | s1 |
    r4 <a c ees>8-. r r4 \acciaccatura { b16 c } <bes des>8-. r |
    r4 \acciaccatura c8 <aes bes>-. r r4 \acciaccatura c8 <aes bes>-. r |
     } \new Voice {
    \voiceTwo des,2( c | f ees) | ges( f | fes1) |
  } >>

  << { \voiceOne aes4.( f8 g4. f8 | aes4. f8 \oneVoice g4.) c8 } \new Voice { \voiceTwo <c, ees>2( <b d> | <bes des>4) r } >> |
  << { c'4( bes \voiceOne aes2) } \new Voice { s2. \voiceTwo f8-. r } >> \oneVoice e4( a bes) \tuplet 3/2 { b8-. c-. d-. }

  << { \voiceTwo s1 | r2 r4 r8 b^( } \new Voice { \voiceOne ees1 ~ | ees } >> | \oneVoice

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
  r2 r4 r8 ees-. | ees8-. r ees-. r ees-. ees-. r ees-. |

  aes,8-. r r4 ees8-. r r4 | aes,8-. r r4 ees'8-. r r4 |
  aes,8-. r r4 ees'8-. r r4 | aes8-. r r4 c,( d8. e16 |

  <f c'>8-.) r r4 <c g'>8-. r r4 | f,4 r4 c'8-. r r4 |
  f8-. r r4 c4 r | f2 << aes \\ { aes,8-. r r4 } >>

  <des aes'>8-. r r4 des8-. r r4 | c8-. r r4 f8-. r r4 |
  \voiceTwo fes8-. r r4 ees8-. r r4 | <bes f'>1 | \oneVoice

  ees8-. r r4 ees,8-. r r4  | ees'8-. r r4 ees,8-. r r4 | ees'4 r ees,8-. r r4 | <aes' ees'>8-. r des,-. r d-. r ees-. r |

  bes'8-. r r4 ees,8-. r r4 | \acciaccatura bes'8 bes,-. r r4 ees8-. r r4 |
  aes,8-. r r4 ees'8-. r r4 | \acciaccatura aes8 aes,-. r r4 ees'8 r r4 |

  bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 | \acciaccatura bes'8 bes,-. r r4 \acciaccatura { des'16 bes } ees,8-. r r4 |
  aes,8-. r r4 ees'8-. r r4 | aes,8-. r r4 ees'8-. r r4 |

  \key c \major
  d8-. r r4 g,8-. r r4 | \tuplet 3/2 { d'8-.  cis' -.d-. } r4 g,,8-. r r4 |
  c8-. r r4 g8-. r r4 | c8-. r r4 g16 b' c dis e8-. r |

  d,8-. r r4 g,8-. r r4 | d'8-. r r4 g,8-. r r4 | << { g'8-. r r4 r2 } \\ c,1 >> | ees2 r |

  \key aes \major
  bes'8-. r r4 ees,8-. r r4 | bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 |
  aes8-. r r4 ees8-. r r4 | aes8-. r r4 ees8-. r r4 |

  bes'8-. r r4 ees,8-. r r4 | bes'8-. r r4 \acciaccatura { des16 bes } ees,8-. r r4 |
  c'4 r ges r | f8-. r r4 f,8-. r r4 |

  des'8-. r r4 c8-. r r4 | f8-. r r4 f,8-. r r4 |
  << { r2 bes' | r des } \\ { bes,1 | des } >>

  ees4 r ees, r | ees' r \acciaccatura { des'16 bes } ees,,8-. r r4 |
  <aes' ees'>8-. r r4 <des, aes'>8-. r r4 | c8-. r f-. r bes,-. r r4 |

  r2 r4 r8 ees'-. | ees-. r ees-. r ees-. ees-. r ees-. |

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
  \layout {}
  \midi {}
}