\version "2.19.81"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\include "arbitrary-layer-whiteout.ily"

whiteOut = #(define-music-function
  (grob-name) (symbol?)
  #{ \once \override #`(,grob-name whiteout-ex) = ##t #})

lowerLayer = #(define-music-function
  (grob-name) (symbol?)
  #{ \once \override #`(,grob-name layer) = -2 #})

inStaffDynamicSpanner = {
  \once \override DynamicLineSpanner.outside-staff-priority = ##f
  \once \override DynamicLineSpanner.Y-offset = 0
}

translateHairpin = #(define-music-function
  (offset-x offset-y rotation shorten-begin shorten-end) (number? number? number? number? number?)
  #{
    \once \override Hairpin.extra-offset = #`(,offset-x . ,offset-y)
    \once \override Hairpin.rotation = #`(,rotation 0 0)
    \once \override Hairpin.shorten-pair = #`(,shorten-begin . ,shorten-end)
  #})

global_a = {
  \key c \major
  \time 6/8
  \tempo 8 = 138
}

right_a = << \global_a \relative {
  \clef treble
  r4. << { \voiceTwo <b d g>4\arpeggio \tuplet 3/2 { <c' e>8^( <d f>16 } } \new Voice { \voiceOne r8 <g, d' f g>4-.\arpeggio } >> |
  
  \oneVoice <c e>8-.) r \tuplet 3/2 { <c e>8( <d f>16 } <c e>8-.) r \tuplet 3/2 { <c e>8( <d f>16 } |
  <c e>8-.) <d f>-. <dis fis>-. <e g>4 \tuplet 3/2 { <e g>8( <f a>16 } |
  <e g>8-.) r \tuplet 3/2 { <e g>8( <f a>16 } <e g>8-.) r \tuplet 3/2 { <e g>8( <f a>16 } |
  <e g>8-.) <f a>-. <d b'>-. <e c'>4. |
  
  r4. <g b>4( \tuplet 3/2 { <ges bes>8 <f a>16 } |
  \tuplet 3/2 8 { <e g>8 <d f>16 <c e>8 <b d>16 } <ais cis>8-.) <b d>4. |
  r4. <g' b>4 \tuplet 3/2 { <g bes>8( <f a>16 } |
  \tuplet 3/2 8 { <e g>8 <dis fis>16 <e g>8 <d gis>16 } <c a'>8-.) <b g'>4 \tuplet 3/2 { <e, c' e>8( <f d' f>16 } |
  
  <e c' e>8-.) r \tuplet 3/2 { <e c' e>8( <f d' f>16 } <e c' e>8-.) r \tuplet 3/2 { <e c' e>8( <f d' f>16 } |
  <e c' e>8-.) <f d' f>-. <fis dis' fis>-. <g e' g>4 \tuplet 3/2 { <g e' g>8( <a f' a>16 } |
  <g e' g>8-.) r \tuplet 3/2 { <g e' g>8( <a f' a>16 } <g e' g>8-.) r \tuplet 3/2 { <g e' g>8( <a f' a>16 } |
  <g e' g>8-.) <a f' a>-. <b d b'>-. <c e c'>4. |
  
  <d g b d>8~ \tuplet 3/2 { q8 <g, b g'>16 } <g b g'>8-. <g b g'>-. <fis ais fis'>-. <g b g'>-. |
  <e' g c e>8~ \tuplet 3/2 { q8 <g, c g'>16 } q8-. q-. <fis c' fis>-. <g c g'>-. |
  <g d' g>-.^\markup { \italic riten. } <a f 'a>-. <b g' b>-. <c fis a c>4.~ | q8 r r r4. \bar "|."
} >>

left_a = << \global_a \relative {
  \clef bass
  <b, b'>8-. <bes bes'>-. <a a'>-. <g g'>4.
  
  c8-. <g' e'>-. <c g'>-. g,-. <g' e'>-. <c g'>-. |
  c,8-. <g' e'>-. <c g'>-. g,-. <g' e'>-. <c g'>-. |
  c,8-. <g' e'>-. <c g'>-. g,-. <g' e'>-. <c g'>-. |
  c,8-. <g' e'>-. <c g'>-. g,-. <g' e'>-. <c g'>-. |
  
  g,8-- <d' b'>-. <g d'>-. <b f'>-. <g d'>-. <d b'>-. |
  g,8-- <d' b'>-. <g d'>-. <b f'>-. <g d'>-. <d b'>-. |
  g,8-- <d' b'>-. <g d'>-. <b f'>-. <g d'>-. <d b'>-. |
  g,8-- <d' b'>-. <g d'>-. g,-- <b' f' g>-. g,-- |
  
  c8-. <g' e'>-. <c g'>-. g,-. <g' e'>-. <c g'>-. |
  c,8-. <g' e'>-. <c g'>-. g,-. <g' e'>-. <c \parenthesize g'>-. |
  c,8-. <g' e'>-. <c \parenthesize g'>-. g,-. <g' e'>-. <c \parenthesize g'>-. |
  c,8-. <g' e'>-. <c g'>-. g,-. <g' e'>-. f,-- |
  
  g8-- <d' g b>-. <g b d>-. d,-. <g' b d>-. <b d f>-. |
  c,8-- <e g c>-. <g c e>-. g,-. <g' c e>-. <c e \parenthesize g>-. |
  <g, g'>8-. <f f'>-. <e e'>-. <d d'>4.~ | q8 r r r4. |
} >>

pedal_a = {
  s4. s\sustainOn |
  s2.*4\sustainOff
  s8\sustainOn s\sustainOff s s4. |
  s8\sustainOn s\sustainOff s s4. |
  s8\sustainOn s\sustainOff s s4. |
  s8\sustainOn s\sustainOff s s\sustainOn s s\sustainOn |
  s8\sustainOff s s\sustainOn s\sustainOff s s\sustainOn |
  s8\sustainOff s s s s s\sustainOn |
  s8\sustainOff s s\sustainOn s\sustainOff s s\sustainOn |
  s8\sustainOff s s s s s\sustainOn |
  s8\sustainOn s s\sustainOff s s s |
  s8\sustainOn s s\sustainOff s s s |
}

dynamics_a = {
  s4.\mf s4 s8\mp |
  s2.*4 |
  s2.*3 |
  s4.\< s8 s s\mf |
  s2.*3 |
  s4 s8\< s4. |
  s2.*2\! s4.\< s\!
}

global_b = {
  \key c \major
  \time 4/4
  \tempo 4 = 113
}

right_b = << \global_b \relative {
  \override Staff.Glissando.style = #'trill
  \clef treble

  <g' g'>4. q16 q q4 g,4--->\laissezVibrer |
  g16 gis a ais b c cis d dis e f fis <g' b d g>8-.-> r |
  
  <c, e>16( <d f> <c e>-.) r <c e>( <d f> <c e>-.) r <c e> <c e> <d f> <d f> <dis fis> r <e g>8 |
  <e g>16( <f a> <e g>-.) r <e g>( <f a> <e g>-.) r <e g> <e g> <f a> <f a> <g b> r <a c>8~ |
  q8 <b, d g b>4-> <des bes'>16 <c a'> <ces aes'> <bes g'> <beses ges'> <aes f'> <g e'>8 <f d' f> |
  r8 <b d g b>4-> <des bes'>16 <c a'> <b g'> <ais fis'> <b g'> <c a'> <b g'>8 r |
  
  <c e>16( <d f> <c e>-.) r <c e>( <d f> <c e>-.) r <e, c' e> <e c' e> <f d' f> <f d' f> <fis dis' fis> r <g e' g>8-- |
  <e' g>16( <f a> <e g>-.) r <e g>( <f a> <e g>-.) r <g, e' g> <g e' g> <a f' a> <a f' a> <b g' b> r <c aes' c>8-- |
  <d g b d>16-.-> r <g, b g'> q <fis ais fis'> r <g b g'>-. r <d' g b d>-.-> r <g, d' g>( <cis fis> <g d' g>-.) r <aes' bes d f>8->~ |
  q16 <g e'> <ges ees'> <f d'> <fes des'> <ees c'> <d b'> <des bes'> <a c a'>-. r <fis ais fis'>-. r <g b g'>4-- |
  
  \ottava 1
  <<{ \acciaccatura { ais''16 b } <c, c'>16-. r <b b'>-. r <ais ais'>-. <b b'>-. <ais ais'>-. <a a'>-. <aes aes'>8-. <g g'>-. <fis fis'>-. <g g'>-. }
    \\ { e'16 <d f> e-. r e f e-. r <c e> <c e> <d f> <d f> dis8-. e8-- }>> |
  <<{ <a, a'>16-. r <aes aes'>-. r <g g'>-. <aes aes'>-. <g g'>-. <ges ges'>-. <f f'>8-. <e e'>-. <dis dis'>-. <e e'>-. }
    \\ { c'16 <dis fis> c-. r c dis c-. r <g c> <g c> <a c> <a c> b8-. c8-- }>> |
  \ottava 0
  r8 <b, d g b>4-> <des bes'>16 <c a'> <ces aes'> <bes g'> <beses ges'> <aes f'> <fis e'>8 <g d' f> |
  r8 <b d g b>4-> <des bes'>16 <c a'> <b g'> <ais fis'> <b g'> <c a'> <b g'>8 r |
  
  << { \acciaccatura { ais'16 b } c16-. r b-. r ais-. b-. ais-. a-. aes8-. g-. fis-. g-. }
     \\ { <c, e>16 <d f> <c e>-. r <c e> <d f> <c e>-. r <c e> <c e> <d f> <d f> <dis fis>8-. <e g>-- } >> |
  << { a16-. r aes-. r g-. \once \override Accidental.X-offset = -4 \once \override NoteColumn.force-hshift = -2.2 aes!-. g-. ges-. f8-. e-. dis-. e-. }
     \\ { <e g>16 <fis a> <e g>-. r <e g> \once \override Accidental.X-offset = -1.1 <fis a> <e g>-. r <e g> <e g> <f a> <f a> <g b>8-. <a c>-- } >> |
  <d, g b d>16-.-> r <g, b g'> q <fis ais fis'>8 <g b g'>16-. r <e' g c e>-.-> r <g, e' g>16 <g e' g> <fis dis' fis>8 <g e' g>16-. r |
  \ottava 1 <a' f'>16 <g e'> <a f'> <b g'> <a f'> <g e'> <f d'> <e c'> <d b'> <b g'> <c a'> <d b'> <c e c'>4 \ottava 0 |

  << { \oneVoice e,16^( f <a, e'>-.) r e'^( f <a, e'>-.) r } \\ { <a cis>8 s q s } >> <a d f>8-. q4-- q8-. |
  << { \oneVoice g'16^( aes <b, d g>-.) r g'^( aes <b, d g>-.) r } \\ { <b d>8 s q s } >> <c e g>8-. <c e g c>4-- q8-. |
  <g' b>16( <a c> <g b>-.) r << { <g' b>16( <a c> <dis, g b>-.) \oneVoice r } \\ { dis8 s } >> <e g b>8 <b' e>16 <bes ees> <a d> <aes des> <g c> <fis b> |
  <f bes>16 <e a> <ees aes> <d g> <cis fis>-. r <e, c' e>-. r << { s8. \ottava 1 \once \omit Stem \once \omit Flag \lowerLayer Glissando \inStaffDynamicSpanner \translateHairpin 0 4 30 0 2 dis'16\< \glissando \once \omit Stem \once \omit Flag \once \override NoteColumn.ignore-collision = ##t b''\! s s \once \omit Stem \once \omit Flag \inStaffDynamicSpanner \translateHairpin 2.7 1 -50 -1 -2 fis\> \glissando }
                                                                 \new Voice { \oneVoice <fis,, b dis fis>8.\noBeam s16 \once \override Accidental.extra-spacing-width = #'(0.2 . 0) \whiteOut Accidental <dis'' fis b>-.-> r r } >> |
  
  \once \hide Stem b,16\! \ottava 0 r16 <gis b e gis>4 <fis b dis fis>8-. <gis b e gis>8. <fis b dis fis>16 <gis b e gis>16 r <b e gis b>8 |
  <a cis e a>4 r16 <dis, b'> <e cis'> <fis dis'> <gis e'> <a fis'> <bes g'> <b gis'> <cis a'>-. r <b dis fis a b>8--->~ |
  q8 <a b dis fis>4 <b e gis>8-. <a b dis fis>8. <cis fis cis'>16 <b eis b'>8-. <a dis a'>-. |
  << { <e' gis>4 } \\ { b8. <e, b'>16 } >> <gis e'>8 <e b'>16 <gis e'> <b gis'>8 <gis e'>16 <b gis'> <e b'>8 q |
  
  <c f a c>4~ q16 a' <f c'> <a f'> <g e'> <f d'> <e c'> <d b'> <c a'> <b g'> <a f'> <g e'> |
  <dis fis dis'>8 <dis c'>16 <fis dis'> <a fis'>8 <fis dis'>16 <a fis'> <c a'>8 <a fis'>16 <c a'> <ees c'>8 <c a'>16 <ees c'> |
  <b dis fis b>16-.-> r b,( ais b cis b ais <b dis fis b>-.->) r \once \hide Accidental \once \hide Stem \inStaffDynamicSpanner \translateHairpin -1.5 3 40 1 1 f'16\< \glissando s16 s8 \ottava 1 b''8\! |

  <<{ <c, c'>16-. r <b b'>-. r <ais ais'>-. <b b'>-. <ais ais'>-. <a a'>-. <aes aes'>8-. <g g'>-. <fis fis'>-. <g g'>-. }
    \\ { e'16 <d f> e-. r e f e-. r <c e> <c e> <d f> <d f> dis8-. e8-- }>> |
  <<{ <a, a'>16-. r <aes aes'>-. r <g g'>-. <aes aes'>-. <g g'>-. <ges ges'>-. <f f'>8-. <e e'>-. <dis dis'>-. <e e'>-. }
    \\ { c'16 <dis fis> c-. r c dis c-. r <g c> <g c> <a c> <a c> b8-. c8-- }>> |
  \ottava 0
  r8 <b, d g b>4-> <des bes'>16 <c a'> <ces aes'> <bes g'> <beses ges'> <aes f'> <fis e'>8 <g d' f> |
  r8 <b d g b>4-> <des bes'>16 <c a'> <b g'> <ais fis'> <b g'> <c a'> <b g'>8 r |
  
  << { \acciaccatura { ais'16 b } c16-. r b-. r ais-. b-. ais-. a-. aes8-. g-. fis-. g-. }
     \\ { <c, e>16 <d f> <c e>-. r <c e> <d f> <c e>-. r <c e> <c e> <d f> <d f> <dis fis>8-. <e g>-- } >> |
  << { a16-. r aes-. r g-. \once \override Accidental.X-offset = -4 \once \override NoteColumn.force-hshift = -2.2 aes!-. g-. ges-. f8-. e-. dis-. e-. }
     \\ { <e g>16 <fis a> <e g>-. r <e g> \once \override Accidental.X-offset = -1.1 <fis a> <e g>-. r <e g> <e g> <f a> <f a> <g b>8-. <a c>-- } >> |
  <d, g b d>16-.-> r <g, b g'> q <fis ais fis'>8 <g b g'>16-. r <e' g c e>-.-> r <g, e' g>16 <g e' g> <fis dis' fis>8 <g e' g>16-. r |
  \ottava 1 <a' f'>16 <g e'> <a f'> <b g'> <a f'> <g e'> <f d'> <e c'> <d b'> <b g'> <c a'> <d b'> <c e c'>4 \ottava 0 |
  
  <a f'>16 <g e'> <a f'> <b g'> <a f'> <g e'> <f d'> <e c'> r4 <b' d g b>16-> <g e' g>-> <a f' a>-> <b g' b>-> | <c e g c>4-> r \bar "|."
} >>

left_b = << \global_b \relative {
  \clef bass
  r2 r4 <g,, g'>4--->\laissezVibrer |
  g'16 ges f e ees d des c b bes a aes <g g'>8-.-> r |
  
  c'8-. <e g c>-. g,-. <e' g c>-. c-. <e g c>16-. q-. g,8-. <e' g c>-. |
  c8-. <e g c>-. g,-. <e' g c>-. c-. <e g c>16-. q-. g,8-. <e' g c>-. |
  g,8-. <b d g>-. d,-. <b' d g>-. g-. <b d g>-. <<{ r8 <b d g> } \\ { a16 ais b8-- }>> |
  g8-. <b d g>-. d,-. <b' d g>-. g-. <b d g>-. <<{ <f' a>16 <e g> \once \override NoteColumn.ignore-collision = ##t <d f>8-- } \\ { r8 <b d> }>> |

  c8-. <e g c>-. g,-. <e' g c>-. c-. <e g c>16-. c g8-. <b d g>-- |
  c8-. <e g c>-. g,-. <e' g c>-. c-. <e g c>16-. c g8-. <c ees aes c>-- |
  g8-. <b d g>-. d,-. <b' d g>-. g-. <b d g>-. f-- <bes d f>-. |
  bes-- <d f aes>-. aes-- <c ees ges>-. << { g'16 fis g aes } \\ { g,8--[ <d' g>-.] } >> <g, g'>16 <a a'> <b b'>8 |
  
  c8-- <e g c>-. g,-- <e' g c>-. c-- <e g c>-. g,8-- <b d g>-- |
  c8-- <e g c>-. g,-- <e' g c>-. c-- <e g c>-. g,8-- <e' g c>-. |
  g,8-- <b d g>16-. q-. q8-. q-. d,-- <b' d g>-. dis,-- <b' dis g>-. |
  g8-- <b d g>16-. q-. q8-. q-. d,-- <b' d g>-. dis,-- <b' dis g>-. |
  
  c8-- <e g c>-. g,-- <e' g c>-. c-- <e g c>16-. c g8-- <b d g>-- |
  c8-- <e g c>-. g,-- <e' g c>-. c-- <e g c>16-. c g8-- <c ees ges c>-- |
  g8-- <b d g>-. d,-- <b' d f>-. c-- <e g c>-. g,-- <e' g c>-. |
  <d, d'>16-. r <cis cis'> <d d'> <dis dis'> <e e'> <f f'> <fis fis'> <g g'>-. r <b d g b>-. r <c e g c>4 |
  
  a8-- <cis e>-. e,-- <cis' e>-. d,-- <a' d>-. a-- <d f>-. |
  g,8-- <b d>-. d,-- <b' d>-. c,-- <g' c>-. g-- <c e g>-. |
  b8-- <dis fis b>-. fis,8-- <b dis fis>-. e,-- <b' e>-. b-- <e g b>-. |
  <fis,, fis'>8 <gis gis'>16 <a a'> <bes bes'> <c c'> <cis cis'> <d d'> <dis dis'>-. r q8 q16 <b b'> <cis cis'> <dis dis'> |
  
  <e e'>4. <b' dis fis b>8-. <e, e'>8. <b b'>16 <e, e'> q <fis fis'> <gis gis'> |
  <a a'>8. q16 <gis gis'>8. q16 <fis fis'>8. q16 <e e'>-. r <fis fis'>8---> |
  << { r8 <fis'' b dis>4 } \\ <b,, b'>4. >> <fis fis'>8-. <a a'> q16 <b b'> <a a'> <gis gis'> <fis fis'> <f f'> |
  << { r8 <e'' gis b>4 } \\ <e,, e'>4. >> <dis dis'>8-. <e e'> <gis gis'>16 r <b b'>8 <a a'>16 <b b'> |
  
  << { r8 <f'' a c>16 q q8-. r } \\ { <c, c'>4. <b b'>8-. } >> <c c'>8. <b b'>16 <c c'> <b b'> <a a'> <g g'> |
  << { r8 <dis'' fis a>-. r <fis a c>-. r <a c ees>-. } \\ { <fis,, fis'>4 <a a'> <c c'> } >> <ees ees'>16 <d d'> <des des'> <c c'> |
  <b b'>16-.-> r r8 r4 <b b'>16-.-> r <g g'>-.-> r <g g'>4---> |
  
  c'8-- <e g c>-. g,-- <e' g c>-. c-- <e g c>-. g,8-- <b d g>-- |
  c8-- <e g c>-. g,-- <e' g c>-. c-- <e g c>-. g,8-- <e' g c>-. |
  g,8-- <b d g>16-. q-. q8-. q-. d,-- <b' d g>-. dis,-- <b' dis g>-. |
  g8-- <b d g>16-. q-. q8-. q-. d,-- <b' d g>-. dis,-- <b' dis g>-. |
  
  c8-- <e g c>-. g,-- <e' g c>-. c-- <e g c>16-. c g8-- <b d g>-- |
  c8-- <e g c>-. g,-- <e' g c>-. c-- <e g c>16-. c g8-- <c ees ges c>-- |
  g8-- <b d g>-. d,-- <b' d f>-. c-- <e g c>-. g,-- <e' g c>-. |
  <d, d'>16-. r <cis cis'> <d d'> <dis dis'> <e e'> <f f'> <fis fis'> <g g'>-. r <b d g b>-. r << { r16 <e g c>-. q-. r } \\ c4 >> |
  
  <g b d f g>8-> r r4 r \ottava -1 <g, g'>16-> <f f'>-> <e e'>-> <d d'>-> | <c c'>4-> \ottava 0 r
} >>

dynamics_b = {
  s1\mf \once \override DynamicText.parent-alignment-X = 1 s2.\mp\< s4\!
  \once \override DynamicText.parent-alignment-X = 1 s1*7\mf s2 s\<
  s1*8\f
  s1*2\mp s1*2\cresc
  s1*3\mf s2 s\<
  s1\! s\< s\!
  s1*8\f
  s2.\mf s4\f
}

pedal_b = {
  s2.\sustainOn s4\sustainOn | s2. s4\sustainOff |
  s1*8^\markup { \italic con \concat { \musicglyph "pedal.Ped" \musicglyph "pedal.." } }
  s1*8
  s1*4
  s1*6 s2. s4\sustainOn
  s1*8\sustainOff
}

\header {
  title = "芸するやつ"
  revision = "Revision 1"
  date = "2019/3/25"
}

\paper {
  systems-per-page = 5
}

\score {
  <<
    \new PianoStaff \with {
      instrumentName = \markup { \huge \bold 1. }
    } <<
      \new Staff = "right" \right_a
      \new PianoDynamics = "dynamics" \dynamics_a
      \new Staff = "left" \left_a
      \new PianoPedal = "pedal" \pedal_a
    >>
  >>
  \layout {
    system-count = 5
  }
  \midi {}
}

\score {
  <<
    \new PianoStaff \with {
      instrumentName = \markup { \huge \bold 2. }
    } <<
      \new Staff = "right" \right_b
      \new PianoDynamics = "dynamics" \dynamics_b
      \new Staff = "left" \left_b
      \new PianoPedal = "pedal" \pedal_b
    >>
  >>
  \layout {
    system-count = 15
  }
  \midi {}
}