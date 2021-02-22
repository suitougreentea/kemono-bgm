\version "2.20.0"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = ""
  nickname = ""
  revision = ""
  date = ""
}

\paper {
}

global = {
  \key f \major
  \time 4/4
  \tempo 4 = 85
  s1*18 \bar "|."
}

right = << \global \relative {
  \clef treble
  r4 c'' c' e, |
  <c e g>2.\arpeggio << \tuplet 3/2 { \once \override NoteColumn.force-hshift = -0.5 g'8\arpeggio f e } \\ { \once \override NoteColumn.force-hshift = -0.5 <c e>4\arpeggio } >> | r8 <g bes ees>4. <fis a d>4 <d' g>8 a' |
  <d, f bes>4. \voiceOne d8 cis d <a' c> <g bes> | \oneVoice r8 <c, f a>4. <bes d g>4 a'8 bes |
  r8 <c, ees c'>4 ees8 <fis, d'>4 <d' fis d'>8 c' | r8 \voiceOne <d, f bes>4 a'8 <des, f c'>4 bes' |
  << { a4. a8 g8 f e f } \\ { <c f>2 <b d> } >> | \oneVoice <bes d g>2 <c? e gis> |
  
  <c e f a>2.\arpeggio << \tuplet 3/2 { \once \override NoteColumn.force-hshift = -0.5 a'8\arpeggio g f } \\ { \once \override NoteColumn.force-hshift = -0.5 <c e>4\arpeggio } >> | r8 <g bes ees>4. <fis a d>4 <d' g>8 a' |
  <d, f bes>4. d8 cis d <a' c> <g bes> | r8 <c, f a>4. <bes d g>4 \voiceOne a'8 bes |
  \oneVoice r8 <c, ees c'>4 ees8 <fis, d'>4 <d' fis d'>8 c' | r8 \voiceOne <d, f bes>4 a'8 <des, f c'>4 bes' |
  << { a4. a8 g a bes e, } \\ { \voiceFour <c f>2 \voiceTwo <bes des> } >> | \oneVoice r4 <bes des g>2. | <a c f>2_\markup \italic "riten." \voiceOne <g' a c f>\arpeggio\fermata
  
} >>

left = << \global \relative {
  \clef bass
  R1 |
  f8_( c' \cright f g a c) \cleft << { \once \override NoteColumn.force-hshift = 0 <f,, c'>4\arpeggio } \new Voice { \cright \voiceTwo \crossStaff a'4\arpeggio } >> | ees,8( bes' ees g) d,( a' d fis) |
  g,_( d' \cright g a \voiceTwo bes a g d) \cleft \oneVoice | c,( g' c e) bes,( g' c e) |
  a,,_( ees' a ees') d,_( a' d fis) | g,_( d' \cright a' bes) \cleft bes,_( \cright f' <bes des> f') |
  \cleft c,_( \cright f a f) \cleft b,_( \cright g' b g) | \cleft bes,_( \cright g' bes g) \cleft fis,( cis' e cis) |
  
  f,8_( c' \cright f g a c) \cleft << { \once \override NoteColumn.force-hshift = 0 <f,, c'>4\arpeggio } \new Voice { \cright \voiceTwo \crossStaff a'4\arpeggio } >> | ees,8( bes' ees g) d,( a' d fis) |
  g,( d' g d) fis,( d' fis d) | f,( d' f d) e,_( bes' \cright e bes') |
  \cleft ees,,( c' ees g) d,( a' d fis) | g,_( d' \cright a' bes) \cleft bes,_( \cright f' <bes des> f') |
  \cleft <c, f a>2 <c, g' bes> | f,8_( c' f bes des \cright f bes des) | \cleft f,,_( c' \cright \voiceTwo \tuplet 3/2 { g' a c) } e2\fermata |
} >>

dynamics = {

}

pedal = {
}

\score {
  <<
    \new PianoStaff \with {
      connectArpeggios = ##t
    } <<
      \new Staff = "right" \right
      \new PianoDynamics = "dynamics" \dynamics
      \new Staff = "left" \left
      \new PianoPedal = "pedal" \pedal
    >>
  >>
  \layout {
    \context {
      \PianoStaff
      \consists #Span_stem_engraver
    }
  }
  \midi {}
}