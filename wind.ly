\version "2.19.24"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"

\header {
  title = "風を感じて"
  nickname = "（最初のやつ）"
  revision = "Revision 2 (Unfinished)"
  date = "2017/5/4"
}

global = {
  \key d \major
  \time 5/8
  \tempo 8 = 195
  \set Timing.baseMoment = #(ly:make-moment 1/16)
  \set Timing.beatStructure = #'(6 4)
  s8 * 5 * 24
  \time 6/8
  s8 * 6 * 8
  \bar "||"
  \time 5/8
  \set Timing.baseMoment = #(ly:make-moment 1/16)
  \set Timing.beatStructure = #'(6 4)
  s8 * 5 * 18
  \bar "||"
  s8 * 5 * 5
  \bar "|."
}

right = << \global \relative c {
  \clef treble
  \oneVoice <fis a d e>8.\arpeggio q q8 q | q8. q q8 q16 q |
  <g b d e>8.\arpeggio q q8 q | \voiceTwo q8. q q8 q16 q |
  \oneVoice <a cis e>8.\arpeggio q q8 q | q8. q q8 q16 q |
  <g b d>8.\arpeggio q q8 q | \voiceTwo q8. q q8 q16 q |

  << {
    \voiceTwo
    <fis a d e>8. q <a d e>8 <d e> | <e a>8. q <fis, a d e>8 q16 q |
    \oneVoice <g b d e>8. q q8 q | \voiceTwo q8. q q8 q16 q |
    <a cis e>8. q <cis e>8 q | <a cis>8. <a cis e> q8 q16 q |
    \oneVoice <g b d>8. q q8 q | \voiceTwo q8. q q8 q16 q |

    <fis a d e>8. <fis a d> <a d>8 <a d> | <a d>8. <fis a> q8 q16 q |
    \oneVoice <g b d e>8. q q8 q | \voiceTwo q8. q q8 q16 q |
    <a cis e>8. q a8 a | a8. a a8 <a cis>16 q |
    <g b>8. q q8 q | <g b d>8. q q8 q16 q |
     } \new Voice {
    \voiceOne
    r4. a'8^\mf b | d8. cis ~ cis4 | s8*10 |
    r4. b8 cis | fis,8. a ~ a4 | s8*10 |
    r4. e8 g | fis8. d ~ d4 | s8*10 |
    r4. a8 b | e8. cis ~ cis4 | d4. ~ d4 | s8 * 5 |
  }>>

  \oneVoice <fis, a d e>8.-> q16->-. r8 \voiceOne a'16 b d e fis g | fis4. \oneVoice r16 << { e,16 d8 e16 d } \\ { <fis, a>8. q8 } >> |
  <g b d e>8.-> q16->-. r8 \voiceOne d''16 e fis g a b | a4. \oneVoice r16 << { e,16 d8 e16 d } \\ { <g, b>8. q8 } >> |
  <a cis e>8.-> q16->-. r8 \voiceOne a''16 b cis d cis a | b4. << { <fis, fis'>4. } \\ { r16 e d8 e16 d } >> |
  << { \oneVoice <a' a'>2. | \voiceOne s | } \new Voice { s2. | \oneVoice <g, b d e>8.[ q16] \voiceTwo fis'( a \set stemLeftBeamCount = 0 \once \override Beam.positions = #'(-3 . -2.8) b[] \stemUp \set stemLeftBeamCount = 2 d[ e fis a b)] } >>

  \key g \major
  << {
    \oneVoice <d, g d'>8. <g d' g> <fis fis'>8 <d d'> | <b d b'>4. <g b d g>8 <d' d'> |
    <b e g b>8. <c e g c> ~ \voiceTwo q4 ~ | q4. r4 |
    \oneVoice <d g d'>8. <g d' g> <fis fis'>8 <d d'> | <b d b'>4. <b d g b>8 <c c'> |
    <d g d'>8. <e g e'> ~ \voiceTwo q4 ~ \once \override TieColumn.tie-configuration = #'((7.8 . -1) (4.0 . -1) (2.0 . -1)) | q4. r4 |
    \oneVoice <d, g d'>8. <g d' g> <fis fis'>8 <d d'> | <b d b'>4. <g d' g>8 <d' d'> |
    <b e b'>8. <c e c'> ~ \voiceTwo q4 ~ | q4. \oneVoice <g' c>8 b |
     } \new Voice {
     s8 * 5 | s8 * 5 | s8 s s \voiceOne g'16 c d e | g fis d g, fis d g, d' a' g |
     s8 * 5 | s8 * 5 | s8 s s \voiceOne g16 c d e | g fis d g, fis d g, fis d b |
     s8 * 5 | s8 * 5 | s8 s s \voiceOne g''16 c d e | g fis d g, fis d s4 |
  }>>
  <a, c e a>8. <g g'> ~ q4 | <e' fis a e'>8. <d fis d'> ~ q4 |
  <fis a fis'>8. <g b g'> ~ q4 | <fis' a fis'>8. <g b g'> ~ q4 | \ottava 1 <fis' a fis'>8. <g b g'> ~ q4 ~ | q4. ~ q4 |

  \key d \major
  \ottava 0 <e,, a d>8\arpeggio a16 fis8 a16 d8 a | <fis b>4. ~ q4 |
  <e g d'>8\arpeggio a16 e8 a16 d8 a | \override TextSpanner.bound-details.left.text = #"rit." <e b'>4.^\startTextSpan ~ q4 |
  <a, e' fis>4.\arpeggio\stopTextSpan ~ q4\fermata |
}
>>

left = << \global \relative c {
  \clef bass
  << {
    \voiceOne d8 d16 d8 d16 d8 d | d8 d16 d8 d16 d8 d16 d |
    \cleft d8 d16 d8 d16 d8 d | \cright d''8^\markup \italic "m.g." a16 fis8 a16 d8 a |
    \cleft d,,8 d16 d8 d16 d8 d | d8 d16 d8 d16 d8 d16 d |
    \cleft d8 d16 d8 d16 d8 d | \cright d''8 a16 fis8 a16 d8 a |

    \cleft d,,8 d16 d8 d16 d8 d | d8 d16 d8 d16 d8 d16 d |
    \cleft d8 d16 d8 d16 d8 d | \cright d''8 a16 fis8 a16 d8 a |
    \cleft d,,8 d16 d8 d16 d8 d | d8 d16 d8 d16 d8 d16 d |
    \cleft d8 d16 d8 d16 d8 d | \cright d''8 a16 fis8 a16 d8 a |
    \cleft d,,8 d16 d8 d16 d8 d | d8 d16 d8 d16 d8 d16 d |
    \cleft d8 d16 d8 d16 d8 d | \cright d''8 a16 fis8 a16 d8 a |
    \cleft d,,8 d16 d8 d16 d8 d | d8 d16 d8 d16 d8 d16 d |
    \cleft d8 d16 d8 d16 d8 d | \cright d''8 a16 fis8 a16 d8 a |
     } \new Voice {
    \voiceTwo d,,,4. ~ d4 ~ | d4. ~ d4 | d4. ~ d4 ~ | \oneVoice d4. ~ d4 |
    \voiceTwo d4. ~ d4 ~ | d4. ~ d4 | d4. ~ d4 ~ | \oneVoice d4. ~ d4 |

    \voiceTwo d4. ~ d4 ~ | d4. ~ d4 | d4. ~ d4 ~ | \oneVoice d4. ~ d4 |
    \voiceTwo d4. ~ d4 ~ | d4. ~ d4 | d4. ~ d4 ~ | \oneVoice d4. ~ d4 |
    \voiceTwo d4. ~ d4 ~ | d4. ~ d4 | d4. ~ d4 ~ | \oneVoice d4. ~ d4 |
    \voiceTwo d4. ~ d4 ~ | d4. ~ d4 | d4. ~ d4 ~ | \oneVoice d4. ~ d4 |
  } >>

  \oneVoice d'8.-> d16->-. r8 \cright \voiceTwo a'16 b d e fis g | fis4. \cleft \oneVoice d,4 d8 |
  d8.-> d16->-. r8 \cright \voiceTwo d'16 e fis g a b | a4. \cleft \oneVoice d,,4 d8 |
  d8.-> d16->-. r8 \cright \voiceTwo a''16 b cis d cis a | b4. \cleft \oneVoice d,,16 <a' cis>8. <d, a' cis>8 |
  <d g b d e>8. q16-. r8 q8. q16-. r16 a |
  << { <d, d'>4. ~ \voiceTwo q } \new Voice { \voiceOne s4. r8 d''8 d,8 } >> |

  \key g \major
  << {
    \voiceOne
    b8 d16 g8 d16 b'8 g | b,8 d16 g8 d16 b'8 g |
    c,8 e16 g8 e16 c'8 g | c,8 e16 g8 e16 c'8 g |
    b,8 d16 g8 d16 b'8 g | b,8 d16 g8 d16 b'8 g |
    c,8 e16 g8 e16 c'8 g | c,8 e16 g8 e16 c'8 g |
    b,8 d16 g8 d16 b'8 g | b,8 d16 g8 d16 b'8 g |
    c,8 e16 g8 e16 c'8 g | c,8 e16 g8 e16 c'8 g |
    a,8 e'16 g8 e16 c'8 g | b,8 fis'16 a8 fis16 d'8 a |
    c,8 e16 g8 e16 d'8 g, | c,8 e16 g8 e16 d'8 g, |
    c,8 e16 g8 e16 d'8 g, | <g d' e>4.\arpeggio ~ q4
     } \new Voice {
    \voiceTwo
    <b,, b'>4. ~ q4 | <b b'>4. ~ q4 | <c c'>4. ~ q4 | <c c'>4. ~ q4 |
    <b b'>4. ~ q4 | <b b'>4. ~ q4 | <c c'>4. ~ q4 | <c c'>4. ~ q4 |
    <b b'>4. ~ q4 | <b b'>4. ~ q4 | <c c'>4. ~ q4 | <c c'>4. ~ q4 |
    <a a'>4. ~ q4 | <b b'>4. ~ q4 | <c c'>4. ~ q4 ~ | q4. ~ q4 ~ |
    q4. ~ q4 ~ | q4. ~ q4 |
  } >>

  \key d \major
  << {
    \voiceOne
    d''8 d16 d8 d16 d8 d | d8 d16 d8 16 d8 d |
    d8 d16 d8 16 d8 d | d8 d16 d8 16 d8 d |
     } \new Voice {
    \voiceTwo
    <d, a'>4.\arpeggio ~ q4 ~ | q4. ~ q4 |
    b'4.\arpeggio ~ b4 ~ | b4. ~ b4 |
  } >>
  \oneVoice
  <d,, d'>4.\arpeggio ~ q4\fermata
}
>>

dynamics = {
  s8*5\mf s8*5*7
  s8*5\mp s8*5*15
  s8*6\mf s8*6*6
  s8*2 s8\< s s s
  s8*5\f s8*5*7
  s8*5-\markup { \italic "meno" \dynamic "f" } s8*5*3
  s8*5\< s s8\f s s s\dim s s8*5 s s\!
  \once \override DynamicText.extra-offset = #'(1.0 . 0.0) s8*5\mp
}

pedal = {
  \set Dynamics.pedalSustainStyle = #'mixed
  s8*10\sustainOn s8*10\sustainOff\sustainOn
  s8*10\sustainOff\sustainOn s8*10\sustainOff\sustainOn

  s8*10\sustainOff\sustainOn s8*10\sustainOff\sustainOn
  s8*10\sustainOff\sustainOn s8*10\sustainOff\sustainOn
  s8*10\sustainOff\sustainOn s8*10\sustainOff\sustainOn
  s8*10\sustainOff\sustainOn s8*9\sustainOff\sustainOn s16. s32\sustainOff

  s16*3\sustainOn s16*3\sustainOff s8*3 s8*3\sustainOn s16\sustainOff\sustainOn s s8 s16. s32\sustainOff
  s16*3\sustainOn s16*3\sustainOff s8*3 s8*3\sustainOn s16\sustainOff\sustainOn s s8 s16. s32\sustainOff
  s16*3\sustainOn s16*3\sustainOff s8*3 s8*3\sustainOn s16\sustainOff\sustainOn s s8 s16. s32\sustainOff
  s16*3\sustainOn s16*3\sustainOff s16*3\sustainOn s16*3\sustainOff \set Dynamics.pedalSustainStyle = #'mixed s8*6\sustainOn

  s8*5\sustainOff\sustainOn s8*5\sustainOff\sustainOn s8*10\sustainOff\sustainOn
  s8*5\sustainOff\sustainOn s8*5\sustainOff\sustainOn s8*10\sustainOff\sustainOn
  s8*5\sustainOff\sustainOn s8*5\sustainOff\sustainOn s8*10\sustainOff\sustainOn
  s8*5\sustainOff\sustainOn s8*5\sustainOff\sustainOn s8*10\sustainOff\sustainOn s8*10

  s8*10\sustainOff\sustainOn s8*10\sustainOff\sustainOn
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