\version "2.19.57"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = \markup {
      \override #'(font-name . "游ゴシック体")
      "ちょいのやつ"
  }
  tagline = \markup \fill-line \italic {
    "LilyPond - Music notation for everyone"
    \small #(string-append "Version " (lilypond-version) ", lilypond.org")
  }
}

\paper {
  % page-count = 2
}

global = {
  \numericTimeSignature
  \key c \major
  \time 4/4
  \tempo 4 = 150
  %85
  s4
  s1*4
  s1*18
  \time 6/4
  s4*6
  \bar "||"
  \time 4/4
  \tempo 4 = 85
}

right = << \global \relative c'' {
  \partial 4 { r8 g16 g }
  g8 a ais b g4 r8 <g b>16 q |
  q8 <a c> <ais cis> <b d> <g b>4 r8 d'16 d |
  d8 f e d c b a aes |
  g8 r d' r <g, b d g>2 |

  r8 <g, c e> r q r q r q |
  r8 q r q r <fis b dis>4 <g c e>8 |

  r8 g'' g a g e c g |
  <dis dis'>4 <e e'>8 r <dis dis'>4 <e e'>8 r |
  r8 g' g a g e c a |
  <ais, ais'>4 <b b'>8 r <ais ais'>4 <b b'>8 r |
  r8 b' b d f a r f |
  g r <e, e'>4 <c c'>8 r g'16 a c d |
  e8 r a,16 b c d e8 r a,16 b c e |
  d8 <g, d' g> r q r q r q |

  \ottava 1
  r8 <g' g'> q <a a'> <g g'> <e e'> <c c'> <g g'> |
  <dis' fis dis'>4 <e g e'>8 r <dis fis dis'>4 <e g e'>8 r |
  r8 <g g'> q <a a'> <g g'> <e e'> <c c'> <a a'> |
  <ais cis ais'>4 <b d b'>8 r <ais cis ais'>4 <b d b'>8 r |
  r <b b'> q <d d'> <f f'> <a a'> <g g'> <f f'> |
  <e e'> r <g g'>4 <c c'>8 r c16 d e c |
  d8 r c16 d e c d8 r c16 b bes a |
  g8 \ottava 0 <g, d' g> r q r q r q |
  \tuplet 3/2 { <g cis g'>8 r <ges c ges'> r <f b f'> r }
  \tuplet 3/2 { <e ais e'> r <ees a ees'> r <d gis d'> r }
  \tuplet 3/2 { <des g des'> r <c fis c'> r <b f' b> r }

  \key ees \major
  <bes f' bes>4 d8 f g4 f8 d | bes4 d8 bes aes2 |
  bes4 d8 f g4 f8 d | bes4 d8 bes aes2 |
  g4 b8 d e e d b | <f' b e> r <fis bes dis> r <g cis e>2 |

  r4 \ottava 1 <f'' aes>2 \tuplet 3/2 { <f aes>8 <e g> <ees ges> } |
  <d f>2 \tuplet 3/2 { <d f>8 <cis e> <c ees> } <b d>8 <g cis> |
  <aes d> r <d f>2. | R1 |
  r4 <f aes>2 \tuplet 3/2 { <f aes>8 <e g> <ees ges> } |
  <d f>2 \tuplet 3/2 { <d f>8 <cis e> <c ees> } <b d>8 <g cis> |
  <g d'>8 r <g d' g>2. | \ottava 0
  <f, b e>8 r <fis bes ees> r <g cis e>2 |
  <g cis fis>8 r <gis c f> r <a dis fis>2\fermata |
} >>

left = << \global \relative c {
  \partial 4 { r4 }
  R1 |
  r2 r4 r8 d16 d |
  d8 f e d c b a aes |
  g8 r d' r g16 g, r g g8 g' |

  c,4 g c g | c g c dis8 e |

  c8 <e g c> g, q c q g q |
  c q g q << { r <fis' b>4 <g c>8 } \\ { c,8 r dis e } >>
  c8 <e g c> g, q c q g q |
  g <d' g> d, q << { r <cis' fis>4 g'8 } \\ { g, r d' e } >>
  f8 <b d> d, q f q d q |
  e <g c e> c, <g' c> e <g c> c, q |
  d <fis c' d> a, q d q a q |
  <g' b d> <g, g'> r q r q r q |

  c8 <e g c> g, q c q g q |
  c q g q << { r <fis' b>4 <g c>8 } \\ { c,8 r dis e } >>
  c8 <e g c> g, q c q g q |
  g <d' g> d, q << { r <cis' fis ais>4 <g' b>8 } \\ { g, r d' e } >>
  f8 <b d> d, q f q d q |
  e <g c e> c, q e q c q |
  d <fis c' d> a, q d q a q |
  <g' b d> <g, g'> r q r q r q |
  \tuplet 3/2 { <g g'>8 r <ges ges'> r <f f'> r }
  \tuplet 3/2 { <e e'> r <ees ees'> r <d d'> r }
  \tuplet 3/2 { <des des'> r <c c'> r <b b'> r }

  \key ees \major
  <bes bes'>4 d'8 f g4 f8 d | bes4 d8 bes aes2 |
  bes4 d8 f g4 f8 d | bes4 d8 bes aes2 |
  g4 b8 d e e d b | <g g'> r <gis gis'> r <a a'>2 |
  bes8 r r f bes r r f | bes4 d8 bes aes2 |
  bes8 r r f bes r r f | aes4 g8 e f2 |
  bes8 r r f bes r r f | bes4 d8 bes aes2 |
  g4 b8 d e e d b | <g g'> r <gis gis'> r <a a'>2 |
  <a a'>8 r <ais ais'> r <b b'>2\fermata |

} >>

dynamics = {
}

pedal = {

}

\score {
  <<
    \new PianoStaff \with {
      % instrumentName = "Piano"
      connectArpeggios = ##t
    } <<
      \new Staff = "right" \with {
        midiInstrument = "acoustic grand"
      } \right
      \new Dynamics = "dynamics" \dynamics
      \new Staff = "left" \with {
        midiInstrument = "acoustic grand"
      } { \clef bass \left }
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