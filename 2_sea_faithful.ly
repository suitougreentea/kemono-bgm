\version "2.19.81"

\include "stylesheet.ily"
\include "arbitrary-layer-whiteout.ily"

#(define small-sforzato-stencil
   (lambda (grob)
     (ly:stencil-scale
      (ly:font-get-glyph
       (ly:grob-default-font grob)
       "scripts.sforzato")
      0.9 0.8)))

#(set! default-script-alist (assoc-set! default-script-alist "accent" `(
        (avoid-slur . around)
        (padding . 0.20)
        (quantize-position . #t)
        ;(script-stencil . (feta . ("sforzato" . "sforzato")))
        (stencil . ,small-sforzato-stencil)
        (side-relative-direction . ,DOWN))))

#(define line-positions-gf '(-10 -8 -6 -4 -2 2 4 6 8 10))
#(define line-positions-ggff '(-24 -22 -20 -18 -16 -10 -8 -6 -4 -2 2 4 6 8 10 16 18 20 22 24))

#(define (combined-clef-stencil grob)
   (ly:stencil-add
    (ly:stencil-translate-axis (ly:font-get-glyph (ly:grob-default-font grob) "clefs.G") 9 1)
    (ly:stencil-translate-axis (ly:font-get-glyph (ly:grob-default-font grob) "clefs.G") 2 1)
    (ly:stencil-translate-axis (ly:font-get-glyph (ly:grob-default-font grob) "clefs.F") -2 1)
    (ly:stencil-translate-axis (ly:font-get-glyph (ly:grob-default-font grob) "clefs.F") -9 1)))

#(define (combined-time-signature-stencil grob)
   (let ((stencil-orig (ly:time-signature::print grob)))
     (ly:stencil-add
      (ly:stencil-translate-axis stencil-orig 3 1)
      (ly:stencil-translate-axis stencil-orig -3 1))))
 

#(define (notehead-with-ledger grob)
   (let ((stencil-orig (ly:note-head::print grob)))
     (ly:stencil-add
      stencil-orig
      (grob-interpret-markup grob (markup (#:path 0.2 '((moveto -0.2 0) (lineto 1.5 0)))))))) 

vi = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \voiceOne { $notes } \oneVoice #})
vii = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \voiceTwo { $notes } \oneVoice #})
viii = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \voiceThree { $notes } \oneVoice #})
viiii = #(define-music-function
  (parser location notes) (ly:music?)
  #{ \voiceFour { $notes } \oneVoice #})

hs = #(define-music-function
  (amount) (number?)
  #{ \override NoteColumn.force-hshift = $amount #})

bp = #(define-music-function
  (a b) (number? number?)
  #{ \once \override Beam.positions = #(cons a b) #})

"r" = #(define-music-function
  (num) (number?)
  #{ \override Rest.staff-position = $num #})

sl = #(define-music-function
  (len) (number?)
  #{ \once \override Stem.length = $len #})

rx = #(define-music-function
  (offset) (number?)
  #{ \once \override Rest.extra-offset = #`(,offset . 0) #})

ledgerWhiteout = #(define-music-function
  (music) (ly:music?)
  #{ \tweak NoteHead.whiteout-ex ##t \tweak NoteHead.stencil #notehead-with-ledger \tweak NoteHead.X-extent #'(0 . 0) $music #})

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

\header {
  title = "芸するやつ"
  subtitle = \markup { \center-column { \bold \italic "Faithful copy" } }
  revision = "Revision 1"
  date = "2019/3/25"
}

\paper {
  %systems-per-page = 5
  system-count = 18
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 113
}

music = \relative {
  <g' g'>4. q16 q q4 <g,,, g' g'>^-\laissezVibrer |
  \voices 1,2
  << { g''16 gis a ais b c cis d dis e f fis <g' b d g>8-.-> \r 16 r } \\
     { g,,,16 ges f e ees d des c b bes a aes <g g'>8-.-> \r -16 r } >>
  
  \voices 1,3,2
  << \relative {
    \r 12 <c'' e>16( <d f> <c e>-.) r <c e>( <d f> <c e>-.) r <c e> <c e> <d f> <d f> <dis fis> r <e g>8 |
    <e g>16( <f a> <e g>-.) r <e g>( <f a> <e g>-.) r <e g> <e g> <f a> <f a> <g b> r <a c>8~ 
    \r 8 q8 \once \hs -0.5 <b, d g b>4-> \once \hs -0.5 <bes des bes'>16 <a c a'> <aes ces aes'> <g bes g'> \once \hs -0.5 <ges beses ges'> <f aes f'> <e g e'>8 \once \hs -0.5 <f d' f>8 |
    r8 \once \hs -0.5 <b d g b>4-> \once \hs -0.5 <bes des bes'>16 <a c a'> <g b g'> <fis ais fis'> \once \hs -0.5 <g b g'> <a c a'> <g b g'>8 r |
    
    \r 12 <c e>16( <d f> <c e>-.) r <c e>( <d f> <c e>-.) r <c, e c' e> <c e c' e> <c e d' f> <c e d' f> <a fis' dis' fis> r <g' e' g>8-- |
    <e' g>16( <f a> <e g>-.) r <e g>( <f a> <e g>-.) r <e, g e' g> <e g e' g> <e a f' a> <e a f' a> <g, b' g' b> r <c' aes' c>8-- |
    <d g b d>16-.-> r <g, b g'> q <fis ais fis'> r <g b g'>-. r <d' g b d>-.-> r <g, d' g>( <fis cis' fis> <g d' g>-.) r <f' aes bes d f>8->~ | \pageBreak
    q16 <e g e'> <ees ges ees'> <d f d'> <des fes des'> <c ees c'> <b d b'> <bes des bes'> <a c a'>-. \r 10 r \whiteOut Stem \whiteOut NoteHead \whiteOut Accidental <fis ais fis'>-. r <g b d g>4-- |
     } \\ \relative {
    \hs 0 \r -6 r8 \sl 13 <c e g c>_. r \sl 13 q_. r q16_. q_. q8_. q_. |
    r8 <c e g c>_. r q_. r q16_. q_. q8_. q_. |
    \r -4 r <d g b d>_. r q_. r q_. r q_. |
    r <d g b d>_. r q_. r q_. \once \r 1 r \once \hs 1 q_. |
    
    \hs 0 \stemDown \r -6 r8 <c e g c>_. r q_. r q_. r <b d g>_- |
    r8 <c e g c>_. r q_. r q_. r <c ees aes c>_- |
    
    r8 <d g b d>_. r q_. r q_. r <d f bes d>_. |
    \r -4 r8 <d f aes d>_. r <c ees ges c ees>_. \r -6 r <b d b' d>_. \rx 0.7 r \stemUp \once \hs 0.5 <d g>^. |
     } \\ \relative {
    \r -20 c,8-. r g-. r c8-.[ \once \r -14 r16 c-.] g8-. r |
    c8-. r g-. r c8-.[ \once \r -14 r16 c-.] g8-. r |
    g8-. r d-. r g-. r <a a'>16 <ais ais'> <b b'>8-- |
    g8-. r d-. r g-. r <f' a'>16 <e g'> <d f'>8-- |
    
    c8-. r g-. r c8-.[ \once \r -14 \rx 0.8 r16 c-.] g8-. r |
    c8-. r g-. r c8-.[ \once \r -14 \rx 0.8 r16 c-.] g8-. r |
    g8-. r d-. r g-. r f'-- r |
    bes8-- r aes-- r \voices 5,2 <<{ \tweak Beam.layer -2 \tweak Beam.positions #'(1.7 . 2.0) g'16 fis \once \hs 0.5 g aes } \\ { g,8-- r } >> <g, g' g'>16 <a a' a'> <b b' b'>8-- |
  } >>
  
  \voices 1,2,4,6
  << \relative {
    \r 20
    \acciaccatura { <ais'' ais'>16 <b b'> }
    <c c'>16-. r <b b'>-. r <ais ais'>-. <b b'>-. <ais ais'>-. <a a'>-. <aes aes'>8-. \once \hs 1 <g g'>-. <fis fis'>-. <g g'>-. |
    <a a'>16-. r <aes aes'>-. r <g g'>-. \once \hs -2.2 \once \override Accidental.extra-spacing-width = #'(0.2 . 0) \once \override Accidental.X-offset = -4 <aes! aes'>-. <g g'>-. <ges ges'>-. \hs 1 <f f'>8-. <e e'>-. <dis dis'>-. \hs 0.5 <e e'>-. \hs 0 |
    s1*2
    
    \acciaccatura { <ais ais'>16 <b b'> }
    <c c'>16-. r <b b'>-. r <ais ais'>-. <b b'>-. <ais ais'>-. <a a'>-. <aes aes'>8-. \once \hs 1 <g g'>-. <fis fis'>-. <g g'>-. |
    <a a'>16-. r <aes aes'>-. r <g g'>-. \once \hs -2.2 \once \override Accidental.extra-spacing-width = #'(0.2 . 0) \once \override Accidental.X-offset = -4 <aes! aes'>-. <g g'>-. <ges ges'>-. \hs 1 <f f'>8-. <e e'>-. <dis dis'>-. \hs 0.5 <e e'>-. \hs 0 |
     } \\ \relative {
    \r 6 <g' c e>16 <a d f> <g c e>-. r <g c e> <a d f> <g c e>-. r \bp 0 0 \once \override Beam.layer = -2 <g c e> <g c e> \once \hs 0 \once \override Stem.layer = -2 <g d' f> <g d' f> <g dis' fis> r \once \override Script.extra-offset = #'(-0.1 . 0) <g e' g>8^- |
    \once \hs 1 <c e g>16 <dis fis a> \once \hs 1 <c e g>-. r \bp 1.2 1.2 <c e g> \once \override Accidental.X-offset = -1.1 <dis fis a> <c e g>-. r <c e g> <c e g> <c f a> <c f a> <c g' b> r \once \override Script.extra-offset = #'(0 . 1) <c a' c>8^- |
    \r 8 \voiceOne r8 <b d g b>4-> <bes des bes'>16 <a c a'> <aes ces aes'> <g bes g'> <ges beses ges'> <f aes f'> <e fis e'>8 <f g d' f>8 |
    r8 <b d g b>4-> <bes des bes'>16 <a c a'> <g b g'> <fis ais fis'> <g b g'> <a c a'> <g b g'>8 r |
    
    \voiceTwo \r 6 <g c e>16 <a d f> <g c e>-. r <g c e> <a d f> <g c e>-. r \bp 0 0 \once \override Beam.layer = -2 <g c e> <g c e> \once \hs 0\once \override Stem.layer = -2 <g d' f> <g d' f> <g dis' fis> r \once \override Script.extra-offset = #'(-0.1 . 0) <g e' g>8^- |
    \once \hs 1 <c e g>16 <dis fis a> \once \hs 1 <c e g>-. r \bp 1.2 1.2 <c e g> \once \override Accidental.X-offset = -1.1 <dis fis a> <c e g>-. r <c e g> <c e g> <c f a> <c f a> <c g' b> r \once \override Script.extra-offset = #'(0 . 1) <c a' c>8^- |
    \voiceOne <d g b d>16-.-> r <g, b g'> q <fis ais fis'>8 <g b g'>16-. r <e' g c e>-.-> r <g, e' g> <g e' g> <fis dis' fis>8 <g e' g>16-. r |
    <f' a f'>16 <e g e'> <f a f'> <g b g'> <f a f'> <e g e'> <d f d'> <c e c'> <b d b'> <g b g'> \once \hs -0.5 <a c a'> <b d b'> \once \hs -0.5 <c e c'>4 |
     } \\ \relative {
    \r -6 r8 \hs 0.5 <c e g c>_. r q_. r \hs 0 <c e g \ledgerWhiteout c>_. r \hs 0.2 <b d g>8-- |
    r8 \once \hs -0.1 <c e g c>_. r q_. r \hs 0 q_. r \hs 0.2 q_. |
    \hs 0 r8 <d g b d>16 q \whiteOut Beam \bp -6.1 -6.1 q8-. q-. r q-. r <dis g b dis>-.
    r8 <d g b d>16 q \whiteOut Beam \bp -6.1 -6.1 q8-. q-. r q-. r <dis g b dis>-.
    
    \r -6 r8 \hs 0.5 <c e g c>_. r q_. r \hs 0 <c e g \ledgerWhiteout c>_. r \hs 0.2 <b d g>8-- |
    r8 \once \hs -0.1 <c e g c>_. r q_. r \hs 0 q_. r \hs 0.2 <c ees ges c>_. \hs 0 |
    r8 <d g b d>-. r <d f g b d>-. r <e g c e>-. r <e g c e>-. |
    \voiceThree \r -2 s4 r8 \once \hs -1 g16 fis g16-. r <b, d g b>-. r <c e g c>4 |
     } \\ \relative {
    \hs 0 \r -20 c,8-- r g-- r c8-- r g8-- r |
    c8-- r g-- r c8-- r g8-- r |
    g8-- r \once \hs 0.5 \lowerLayer Stem \lowerLayer Flag \sl 7.5 g' r d,-- r dis-- r |
    g8-- r \once \hs 0.5 \lowerLayer Stem \lowerLayer Flag \sl 7.5 g' r d,-- r dis-- r |
    
    c'8-- r g-- r c8--[ \once \r -14 \rx 0.8 r16 c] g8-- r |
    c8-- r g-- r c8--[ \once \r -14 \rx 0.8 r16 c] g8-- r |
    g-- r d'-- r c-- r g-- r |
    \r -10 <d' d'>16-. r <cis cis'>16 <d d'> <dis dis'> <e e'> <f f'> <fis fis'> <g g'>16-. r <b, b'>-. r <c c'>4 |
  } >>
 
  \voices 1,2,4
  << \relative {
    \voices 1,6 << { e'16( f <a, e'>-.) r e'( f <a, e'>-.) r } \\ { <a cis>8 s q s } >> <a d f>8-. q4-- q8-. |
    \voices 1,6 << { g'16( aes <b, d g>-.) r g'( aes <b, d g>-.) r } \\ { <b d>8 s q s } >> <c e g>8-. <c e g c>4-- q8-. |
    <g' b>16( <a c> <g b>-.) r \voices 1,6 << { <g' b>16( <a c> <dis, g b>-.) \r 10 r } \\ { dis8 s } >> <e g b>8 <b e e'>16 <bes ees ees'> <a d d'> <aes des des'> <g c c'> <fis b b'> |
    <f bes bes'>16 <e a a'> <ees aes aes'> <d g g'> <cis fis fis'>-. \r 6 r <c e e'>-. r \voices 1,6,3 << { s8. \once \omit Stem \once \omit Flag \lowerLayer Glissando \inStaffDynamicSpanner \translateHairpin 0 3 20 1 0 dis'16_\< \glissando \once \omit Stem \once \omit Flag b''\! s s \once \omit Stem \once \omit Flag \inStaffDynamicSpanner \translateHairpin 0 4 -45 -1 -1.6 fis_\> \glissando } \\
                                                                                                          { \once \hs 0 <b,,, dis fis>4 q16-. \r 2 r r8 } \\
                                                                                                          { <b' dis fis>8.\noBeam s16 \once \override Accidental.extra-spacing-width = #'(0.2 . 0) \whiteOut Accidental <b' dis fis b>-.-> \r 20 r r } >> |
    
    \once \omit Stem \once \omit Flag \once \hs -0.5 b,16\! r16 <gis b e gis>4 \once \hs -0.5 <fis b dis fis>8-. <gis b e gis>8. <fis b dis fis>16 <gis b e gis>16 r <b e gis b>8 |
    \once \hs -0.5 <a cis e a>4 r16 <b, dis b'> <cis e cis'> <dis fis dis'> <e gis e'> <fis a fis'> <g bes g'> <gis b gis'> \once \hs -0.5 <a cis a'>-. r \once \hs -0.5 <b dis fis a b>8--->~ |
    q8 \once \hs -1.2 <a b dis fis>4 \once \hs -0.5 <b e gis>8-. \hs 0 <a b dis fis>8. <cis fis cis'>16 <b eis b'>8-. \once \hs -0.5 <a dis a'>-. |
    \voices 1,3 << { \once \hs -0.5 <e' gis>4 } \\ { b8. <e, b'>16 } >> <gis e'>8 \once \hs -0.5 <e b'>16 <gis e'> <b gis'>8 \once \hs -0.5 <gis e'>16 <b gis'> <e b'>8 q |
    
    <c f a c>4~ \once \hs -0.5 q16 a' <f c'> <a f'> <g e'> <f d'> <e c'> <d b'> <c a'> <b g'> \once \hs -0.5 <a f'> <g e'> |
    <dis fis dis'>8 \once \hs -1 <dis c'>16 <fis dis'> <a fis'>8 \once \hs -1 <fis dis'>16 <a fis'> <c a'>8 \once \hs -0.5 <a fis'>16 <c a'> <ees c'>8 \once \hs -0.5 <c a'>16 <ees c'> | \pageBreak
    \r 12 \once \hs -0.5 <b dis fis b>16-.-> r r8 r4 \r 16 <fis' b dis fis>16-.-> r <d g b d>-.-> r \whiteOut Stem \whiteOut NoteHead <g b d>4---> |
     } \\ \relative {
    \r -12 r8 <a, cis e>-. r q-. \r -6 r <a d f>-. r q-. |
    \r -10 r8 <b d g>-. r q-. \r -6 r <c e g>-. r q-. |
    r8 <b dis fis b>-. r q-. r <b e g b>-. r q-. |
    s1 |
    
    \r 0 \voiceThree <gis' b>4. <dis fis b>8-. r8 <e gis>-. \r -2 r q-. |
    \r -4 <e a cis>4 r r q16_. \r -2 r <fis b dis>8_- |
    r8 <fis b dis>_. r q_. r q_. r q_. |
    r <e gis b>_. r q_. r \sl 13 <e gis b e>_. r \sl 13 q_. |
    
    r8 <f a c>16 q q8-. q-. r q_. r q_. |
    \r -4 r8 <fis a c>_. \r -2 r <a c ees>_. \r 0 r <c ees fis>_. \r 2 r <ees fis a>_. |
    <fis, b dis>16-. r b_( ais b cis b ais b-.) r \once \hide Accidental \once \hide Stem \lowerLayer Glissando \inStaffDynamicSpanner \translateHairpin 1 2 40 0 0 f'16_\< \glissando s16 s8 b''8\!
     } \\ \relative {
    \r -20 a,,8-- r e-- r d'-- r a-- r |\pageBreak
    g8-- r d'-- r c-- r g-- r |
    b8-- r fis-- r e-- r b'-- r |
    <fis fis'>8 <gis gis'>16 <a a'> <bes bes'> <c c'> <cis cis'> <d d'> \once \hs 0.5 <dis dis'>-. \r -10 r q8 \once \hs 0.7 q16 <b b'> <cis cis'> <dis dis'> |
    
   <e e'>4. <b b'>8-. <e e'>8. <b b'>16 <e, e'> q <fis fis'> <gis gis'> |
   <a a'>8. q16 <gis gis'>8. q16 <fis fis'>8. q16 <e e'>-. \r -14 r <fis fis'>8---> |
   <b b'>4. <fis fis'>8-. <a a'> q16 <b b'> <a a'> <gis gis'> <fis fis'> <f f'> |
   <e e'>4. <dis dis'>8-. <e e'> <gis gis'>16 r <b b'>8 <a a'>16 <b b'> |
   
   <c c'>4. <b b'>8-. <c c'>8. <b b'>16 <c c'> <b b'> <a a'> <g g'> |
   <fis fis'>4 <a a'> <c c'> <ees ees'>16 <d d'> <des des'> <c c'> |
   <b b'>16-.-> r r8 r4 <b b'>16-.-> r <g g'>-.-> r <g g'>4---> |
  } >>
  
  \voices 1,2,4,6
  << \relative {
    \r 20
    <c''' c'>16-. r <b b'>-. r <ais ais'>-. <b b'>-. <ais ais'>-. <a a'>-. <aes aes'>8-. \once \hs 1 <g g'>-. <fis fis'>-. <g g'>-. |
    <a a'>16-. r <aes aes'>-. r <g g'>-. \once \hs -2.2 \once \override Accidental.extra-spacing-width = #'(0.2 . 0) \once \override Accidental.X-offset = -4 <aes! aes'>-. <g g'>-. <ges ges'>-. \hs 1 <f f'>8-. <e e'>-. <dis dis'>-. \hs 0.5 <e e'>-. \hs 0 |
    s1*2
    
    \acciaccatura { <ais ais'>16 <b b'> }
    <c c'>16-. r <b b'>-. r <ais ais'>-. <b b'>-. <ais ais'>-. <a a'>-. <aes aes'>8-. \once \hs 1 <g g'>-. <fis fis'>-. <g g'>-. |
    <a a'>16-. r <aes aes'>-. r <g g'>-. \once \hs -2.2 \once \override Accidental.extra-spacing-width = #'(0.2 . 0) \once \override Accidental.X-offset = -4 <aes! aes'>-. <g g'>-. <ges ges'>-. \hs 1 <f f'>8-. <e e'>-. <dis dis'>-. \hs 0.5 <e e'>-. \hs 0 |
     } \\ \relative {
    \r 6 <g' c e>16 <a d f> <g c e>-. r <g c e> <a d f> <g c e>-. r \bp 0 0 \once \override Beam.layer = -2 <g c e> <g c e> \once \hs 0 \once \override Stem.layer = -2 <g d' f> <g d' f> <g dis' fis> r \once \override Script.extra-offset = #'(-0.1 . 0) <g e' g>8^- |
    \once \hs 1 <c e g>16 <dis fis a> \once \hs 1 <c e g>-. r \bp 1.2 1.2 <c e g> \once \override Accidental.X-offset = -1.1 <dis fis a> <c e g>-. r <c e g> <c e g> <c f a> <c f a> <c g' b> r \once \override Script.extra-offset = #'(0 . 1) <c a' c>8^- |
    \r 8 \voiceOne r8 <b d g b>4-> <bes des bes'>16 <a c a'> <aes ces aes'> <g bes g'> <ges beses ges'> <f aes f'> <e fis e'>8 <f g d' f>8 |
    r8 <b d g b>4-> <bes des bes'>16 <a c a'> <g b g'> <fis ais fis'> <g b g'> <a c a'> <g b g'>8 r |
    
    \voiceTwo \r 6 <g c e>16 <a d f> <g c e>-. r <g c e> <a d f> <g c e>-. r \bp 0 0 \once \override Beam.layer = -2 <g c e> <g c e> \once \hs 0\once \override Stem.layer = -2 <g d' f> <g d' f> <g dis' fis> r \once \override Script.extra-offset = #'(-0.1 . 0) <g e' g>8^- |
    \once \hs 1 <c e g>16 <dis fis a> \once \hs 1 <c e g>-. r \bp 1.2 1.2 <c e g> \once \override Accidental.X-offset = -1.1 <dis fis a> <c e g>-. r <c e g> <c e g> <c f a> <c f a> <c g' b> r \once \override Script.extra-offset = #'(0 . 1) <c a' c>8^- |
    \voiceOne <d g b d>16-.-> r <g, b g'> q <fis ais fis'>8 <g b g'>16-. r <e' g c e>-.-> r <g, e' g> <g e' g> <fis dis' fis>8 <g e' g>16-. r |
    <f' a f'>16 <e g e'> <f a f'> <g b g'> <f a f'> <e g e'> <d f d'> <c e c'> <b d b'> <g b g'> \once \hs -0.5 <a c a'> <b d b'> <c e c'>4 |
    
    <a f'>16 <g e'> <a f'> <b g'> <a f'> <g e'> <f d'> <e c'> \r 6 r4 <b' d g b>16-> <g e' g>-> <a f' a>-> <b g' b>-> | <c e g c>4-> \r 10 r
     } \\ \relative {
    \r -6 r8 \hs 0.5 <c e g c>_. r q_. r \hs 0 <c e g \ledgerWhiteout c>_. r \hs 0.2 <b d g>8-- |
    r8 \once \hs -0.1 <c e g c>_. r q_. r \hs 0 q_. r \hs 0.2 q_. |
    \hs 0 r8 <d g b d>16 q \whiteOut Beam \bp -6.1 -6.1 q8-. q-. r q-. r <dis g b dis>-.
    r8 <d g b d>16 q \whiteOut Beam \bp -6.1 -6.1 q8-. q-. r q-. r <dis g b dis>-.
    
    \r -6 r8 \hs 0.5 <c e g c>_. r q_. r \hs 0 <c e g \ledgerWhiteout c>_. r \hs 0.2 <b d g>8-- |
    r8 \once \hs -0.1 <c e g c>_. r q_. r \hs 0 q_. r \hs 0.2 <c ees ges c>_. \hs 0 |
    r8 <d g b d>-. r <d f g b d>-. r <e g c e>-. r <e g c e>-. |
    \voiceThree \r 0 s4 r8 \once \hs -1 g16 fis g16-. r <b, d g b>-. r r16 <e g c>-. q-. r |
    
    \r -6 \once \override Script.extra-offset = #'(0.4 . -0.5) <b d f g>8_> r r4 r g'16_> e_> f_> g_> | <c, e g>4_> r
     } \\ \relative {
    \hs 0 \r -20 c,8-- r g-- r c8-- r g8-- r |
    c8-- r g-- r c8-- r g8-- r |
    g8-- r \once \hs 0.5 \lowerLayer Stem \lowerLayer Flag \sl 7.5 g' r d,-- r dis-- r |
    g8-- r \once \hs 0.5 \lowerLayer Stem \lowerLayer Flag \sl 7.5 g' r d,-- r dis-- r |
    
    c'8-- r g-- r c8--[ \once \r -14 \rx 0.8 r16 c] g8-- r |
    c8-- r g-- r c8--[ \once \r -14 \rx 0.8 r16 c] g8-- r |
    g-- r d'-- r c-- r g-- r |
    \r -10 <d' d'>16-. r <cis cis'>16 <d d'> <dis dis'> <e e'> <f f'> <fis fis'> <g g'>16-. r <b, b'>-. r <c c'>4 |
    
    \r -18 <g g'>8-> r r4 r <g g'>16-> <f f'>-> <e e'>-> <d d'>-> | <c c'>4-> r
  } >>
  \bar "|."
}

dynamics = {
  s1\mf s2.\mp\< s4\!
  s1*7\mf s2 s\<
  s1*8\f
  s1*2\mp s1*2\cresc
  s1*3\mf s2 s\<
  s1\! s\< s\!
  s1*8\f
  s2.\mf s4\f
}

pedal = {
  s2.\sustainOn s4\sustainOn | s2. s4\sustainOff |
  s1*8
  s1*8
  s1*4
  s1*6 s2. s4\sustainOn
  s1*8\sustainOff
}

\score {
  <<
    \new PianoStaff <<
      \new PianoDynamics = "dynamics" \dynamics
      \new Staff \with {
        middleCPosition = 0
        clefPosition = 0
        \override Clef.stencil = #combined-clef-stencil
        %\override TimeSignature.stencil = #combined-time-signature-stencil
        \override StaffSymbol.line-positions = #line-positions-ggff
        \override Stem.no-stem-extend = ##t
        \override Glissando.style = #'trill
        \override NoteColumn.force-hshift = 0
        
        %{
        % For debug purpose
        \override NoteHead.color = #(lambda (grob)
                                      (let* ((parent (ly:grob-parent grob X))
                                             (hshift-prop (ly:grob-property parent 'force-hshift 0)))
                                        (cond
                                         ((>= hshift-prop 0) (rgb-color (/ hshift-prop 2) 0 0))
                                         (else (rgb-color 0 0 (/ (- 0 hshift-prop) 2))))))
        %}
      } << \global \music >>
      \new PianoPedal = "pedal" \pedal
    >>
  >>
  \layout {}
  \midi {}
}