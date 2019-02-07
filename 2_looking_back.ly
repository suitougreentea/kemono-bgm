\version "2.19.81"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "26:05～26:06で流れるやつ"
  nickname = "(東京と大阪)"
  revision = "Revision 1"
  date = "2019/2/7"
}

\paper {
  %systems-per-page = 5
  %system-count = 10
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 112
}

right = << \global \relative {
  \clef treble
  g'8-.[ r16 g] fis8-. g-. a4( g8-.) r |
  e8-.[ r16 e] dis8-. e-. f4( e8-.) r |
  cis8-.[ r16 cis] bis8-. cis-. e4 cis8-. a-. |
  b8-. r c-. r cis2 |
  
  \grace { f16( fis } g8-.)[ r16 g] fis8-. g-. a4( g8-.) r |
  e8-.[ r16 e] dis8-. e-. f4( e8-.) r |
  d8-.[ r16 d] cis8-. d-. e4 f8-. fis-. |
  g8-. r d-. r g4. <g e'>8( |
 
  <a f'>4) r8 <e' c'>( <d b'>4) r8 <f, d'>8( |
  <g e'>4) r8 <d' b'>( <c a'>4) r8 <g e'>8( |
  <a f'>4) r8 <e' c'>( <d b'>4) <a' f'>8( <g e'>) |
  r8 <d b'>( <e c'>4)~ q r8 <g, e'>( |
  
  <a fis'>4) r8 <e' a>( <d gis>4) r8 <f, d'>8( |
  <g e'>4) r8 <d' b'>( <c a'>4) <c a'>8( <b g'> |
  <a fis'>4) <e' a>~ q8 <e c'>4 <c a'>8( |
  <d b'>8-.) << { <b d>4( <ais cis>8 <b d>-.) } \\ { g4. g8-. } >> r8 r4 |
   
  \grace { f'16^( fis } <g, g'>8-.)[ r16 q] <fis fis'>8-. <g g'>-. <a a'>4( \grace { c16 e } <g, g'>8-.) r |
  \grace { d'16^( dis } <e, e'>8-.)[ r16 q] <dis dis'>8-. <e e'>-. <f f'>4( \grace { g16 a c } <e, e'>8-.) r
  \grace { b'16^( bis } <cis, cis'>8-.)[ r16 q] <bis bis'>8-. <cis cis'>-. <e e'>8-.[ r16 q] <dis dis'>8-. <e e'>-. |
  << { <f f'>8.-- q16 } \\ <a cis>4 >> <e e'>8-. <cis cis'>-. <cis a'>2 |
  
  \grace { f16( fis } g8-.)[ r16 g] fis8-. g-. a4( g8-.) r |
  g'8-.[ r16 g] fis8-. g-. a4( g8-.) r |
  \grace { f16^( fis } <g, g'>8-.)[ r16 q] <fis fis'>8-. <g g'>-. <a a'>4( <g g'>8-.) <a a'>-. |
  <bes bes'>8.-- q16 <a a'>8-. <fis fis'>-. <g g'>2 |
  
  g'8-.[ r16 g] fis8-. g-. a4( g8-.) r |
  \grace { f,16( fis } g8-.)[ r16 g] fis8-. g-. a4( \grace { c16 d e } g8-.) r |
  r4 g,8-. r fis-. r g-. r |
  a4-- << { \voiceOne g'16( fis e d } \new Voice { \voiceTwo <b d>4 } >> \oneVoice <e, g c>8-.) r r4 \bar "|."
} >>

left = << \global \relative {
  \clef bass
  << <c' e>8-.-> \\ <c, g'>8-.-> >> r <g' c>-. r q-. r q-. r |
  q8-. r q-. r q-. r << c4->( \\ <c, g'>4->( >> |
  << <a' \parenthesize cis>8-.->) \\ <a, e'>8-.->) >> r <e' a>-. r q-. r q-. r |
  q8-. r q-. r q-. r << <a cis>4->( \\ <a, e'>4->( >> |
  
  << <c' e>8-.->) \\ <c, g'>8-.->) >> r <g' c>-. r q-. r q-. r |
  q8-. r q-. r q-. r << c4->( \\ <c, g'>4->( >> |
  << <f b>8-.->) \\ <g, d'>8-.->) >> r <d' g>-. r <f b d>-. r <d g>-. r |
  <g b d>8-. r <f g b>-. r <g b d f>4 g, |
  
  << { r4 <f' a c>8-. r r4 <g b d>8-. r } \\ { f,4 r8 f g4 r8 g } >> |
  << { r4 <e' g b>8-. r r4 <e a c>8-. r } \\ { e,4 r8 e a4 r8 a } >> |
  << { r4 <f' a c>8-. r r4 <g b d>8-. r } \\ { f,4 r8 f g4 r8 g } >> |
  << { r4 <g' c e>8-. r r4 <g c e>8-. r } \\ { c,4 r8 g c4 r8 c } >> |
  
  << { r8 <fis a c>-. q-. r r <f aes d>-. q-. r } \\ { fis,8 r r fis f r r f } >> |
  << { r8 <e' g b>-. q-. r r <ees fis a c>-. <fis a c>4 } \\ { e,8 r r e ees r ees'4 } >> |
  << { r8 <fis a c>-. q-. r r <fis a c>-. q4 } \\ { d8 r r a d r d4 } >> |
  r8 <g, g'>4 q8 q-. r << { \voiceTwo g4--( } \new Voice { \voiceOne <g' b>4-- } >> | \oneVoice
  
  <c, g' c>8-.->) r <g' c>-. r q-. r q-. r |
  q8-. r q-. r q-. r <c, g' c>4->( |
  <a e' a>8-.->) r <e' a>8-. r q-. r q-. r |
  << { a8-. r a-. r <e a>4 } \\ { f8.-- f16 e8-. cis-. a4 } >> <a e' a>4->( |
  
  <c g' c>8-.->) r <g' c>-. r q-. r q-.\noBeam <dis b' dis>->( |
  <e c' e>8-.->) r <c' e>-. r q-. r q-.\noBeam <fis, b fis'>->( |
  <g c \parenthesize g'>8-.->) r <g c>-. r q-. r q-.\noBeam g,-. |
  <bes f' bes>8.---> q16-> r8 q-.-> r q-.-> r q->( |
  
  <c g' c>8-.->) r <g' c>-. r q-. r q-.\noBeam <dis b' dis>->( |
  << { <e c' e>8-.->) \voiceOne r <c' e>-. r q-. r \voiceTwo c-.\noBeam <bes, f'>->( } \new Voice = "a" { s8 \voiceTwo r16 g' fis8-. g-. a4( \voiceOne \grace { c16 d e } g8-.)\noBeam <bes, d>->( } >> |
  << { <c, g'>8-.->) } \context Voice="a" { <c' e>8-.->) } >> \oneVoice r r4 r2 |
  r4 g,16( g a b c8-.) r r4 |
} >>

dynamics = {
  s1*4\mp
  s1*2 s1*2\<
  s1*3\mf s2. s8 s\mp
  s1*2 s2 s\< s1
  s1*4\mf
  s1*2 s1\< s1\f
  s1\mf s2.\mp s8 s\<
  s16 s\! s8 s2. | s4
}

pedal = {
  s1 s2. s4\sustainOn | s1\sustainOff s2. s4\sustainOn |
  s1\sustainOff s2. s4\sustainOn | s1\sustainOff s2 s4\sustainOn s\sustainOn |
  
  s4\sustainOn s\sustainOff s4\sustainOn s\sustainOff |
  s4\sustainOn s\sustainOff s4\sustainOn s\sustainOff |
  s4\sustainOn s\sustainOff s4\sustainOn s\sustainOff |
  s4\sustainOn s\sustainOff s4\sustainOn s\sustainOff |
  
  s8\sustainOn s4.\sustainOff s8\sustainOn s4.\sustainOff |
  s8\sustainOn s4.\sustainOff s8\sustainOn s\sustainOff s4\sustainOn |
  s8\sustainOn s4.\sustainOff s8\sustainOn s\sustainOff s4\sustainOn |
  s8\sustainOff s4.\sustainOn s4\sustainOff s\sustainOn |
  
  s1\sustainOff s2. s4\sustainOn | s1\sustainOff s4\sustainOn s\sustainOff s\sustainOn s\sustainOn |
  s2.\sustainOff s8 s\sustainOn | s2.\sustainOff s8 s\sustainOn |
  s1\sustainOff | s4\sustainOn s2\sustainOff s8 s\sustainOn |
  
  s2.\sustainOff s8 s\sustainOn | s2\sustainOff s8 s\sustainOn s\sustainOff s\sustainOn |
  s1\sustainOff s4\sustainOn s\sustainOn s\sustainOff
}

\score {
  <<
    \new PianoStaff <<
      \new Staff = "right" \right
      \new PianoDynamics = "dynamics" \dynamics
      \new Staff = "left" \left
      \new PianoPedal = "pedal" \pedal
    >>
  >>
  \layout {}
  \midi {}
}