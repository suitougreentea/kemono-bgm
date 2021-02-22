\version "2.22.0"

\include "stylesheet.ily"

cleft = \change Staff = "left"
cright = \change Staff = "right"
mergeOn = {
  \mergeDifferentlyDottedOn
  \mergeDifferentlyHeadedOn
}

\header {
  title = "Chapter9"
  nickname = ""
  % revision = "Revision 1 (Unfinished)"
  % date = "2021/2/12"
  tagline = ""
}

\paper {
  % system-count = 5
  page-count = 1
}

global = {
  \key f \major
  \tempo 4=98
  \time 3/4
  \partial 4 { s4 }
  \bar ".|:"
  s2.*4
  s2.*4
  s2.*4
  s2.*4
  s2.*4
  s2.*4
  s2.*4
  s2.*4
  s2.*4
  \bar ":|."
  s2.*4
  \bar "|."
}

right = << \global {
  \clef treble
  <<
  \new Voice = "main" \relative {
    f'4 |
    d'2 d4 | e2 f4 | \voiceOne c2. | r4 r g8 a |
    \oneVoice bes2 bes4 | \voiceOne bes a g | g2 f4 | d'2 c4 |
    \oneVoice d2 d4 | e2 f4 | \voiceOne g2 f4 | f2 g,8 a | f2 g8 a |
    \oneVoice f2 g8 a | \voiceOne bes4 a des, | \oneVoice g2 f4 |
    
    \voiceOne d'2 d4 | e2 f4 | c2. | r4 r g8 a |
    \oneVoice bes2 bes4 | \voiceOne bes a g | \oneVoice g2 f4 | \voiceOne d'2 c4 |
    d2 d4 | e2 f4 | g2 a4 | f2 c4 |
    bes a bes | f'2 bes,4 | c b c | g'2 c,4 |
    des c des | aes'^\markup \tiny \right-align *3 g f | f2. | g2 f,4 |
    
    d'2 d4 | e2^\markup { \italic riten. } f4 | \oneVoice c2.\laissezVibrer | s2. |
  }
  \context Voice = "main" \relative {
    s4 |
    <f' a bes>2 q4 | <g bes c>2 <g bes c>4 | <e g>2. | s2. |
    <d f>2 q4 | s2. | <a c>2 q4 | <ees' g bes>2 <ees f a>4 |
    <f a bes>2 q4 | <g bes c>2 <g bes c>4 | <a c e>2 <a c>4 | <f a>2 s4 |
    <bes, d>2 s4 | <a c e>2 s4 | s2. | <c e>2 s4 |
    
    <f a bes>2 q4 | <f g a>2 <a bes c>4 | <e g a>2. | s |
    <d f g>2 q4 | s2 <cis e>4 | <a c e>2 <a c>4 | <ees' g bes>2 <ees f a>4 |
    s2. | s | s | <gis b d>2 s4 |
    s2. | <f bes>2 s4 | s2. | <bes c>2 s4 |
    s2. | <des f>4 s2 | <g, c>2. | <c e>2 s4 |
    
    f,2 s4 | g2 g4 | <e a>2.\laissezVibrer | s2. |
  }
  \new Voice = "sub" \relative {
    \voiceTwo
    s4 |
    s2. | s | r4 <c' e> <e g> | <a, c f> <a c> <c d> |
    s2. | <cis e>2 q4 | r4 <a c>2 | s2. | 
    s2. | s | r4 <c e a>2 | r4 <a c f>2 |
    s2 d4 | s2. | <des f>2. | s2. |
    
    r4 <\parenthesize bes d>2 | r4 <\parenthesize bes d>2 | r4 <\parenthesize a c e> g' | <d fis a c> <\parenthesize fis, a c d>2 |
    s2. | <cis' e g>2 s4 | s2. | r4 <g bes ees>4 s |
    <f' a>8( \once \override ParenthesesItem.X-offset = 0.5 \once \override Accidental.X-offset = -1.5 \handBracket ##t 1 \parenthesize b, q b q b) | <f' a bes>( bes, <f' bes> bes, <f' a bes> bes,) |
    <a' c>8( a, <e' g c> e <a c e> e) | r4 <gis b>2*1/2 s4 |
    <d f>2. | r8 g,( bes d f d) | <e g>2. | r8 a,( c e g e) |
    <f aes>2. | r8 des( f aes des aes) | r4 g, d' | \once \override ParenthesesItem.X-offset = 0.3 \handBracket ##t 0.7 \parenthesize c2 s4 | % TODO: f aesを入れ替えるossia
    
    c'4 f, e8 c' | c4 bes8 a bes4 | s2. | s |
  }
  >>
} >>

left = << \global {
  \clef bass
  <<
  \new Voice = "bass" \relative {
    r4
    \voiceTwo \mergeOn
    bes,2. | bes | a | d, | g | a2 e4 | d2 des4 | c2^\markup \tiny \right-align *1 f4 |
    bes2. | bes | a2 e4 | d2. | g | a | bes | \oneVoice c,4 g' b |
    
    \voiceTwo bes2. | bes | a2 e4 | d2 fis4 | g2 d4 | cis2 cis4 | d2 des4 | c g' f |
    \oneVoice b2 b4 | bes2 bes4 | a2 a4 | gis2 gis4 |
    g2 g4 | g g g | a2 a4 | a a a | bes2. | bes4 f bes, | c	2 g'4 | c2 b4 |
    
    \voiceTwo bes2. | a4 g c | f,2. | \oneVoice f,2.\fermata | 
  }
  \new Voice = "bass2" \relative {
    s4
    \voiceOne
    bes,8( f' bes f d'4) | bes,8( f' bes f d'4) |
    a,8( e' a e c'4) | d,,8( a' f' d a'4) |
    g,8( d' f d bes'4) | a,8( e' a e %{\cright \stemDown%} \parenthesize cis'4) %{\cleft \stemUp%} |
    d,,8( a' d a \handBracket ##f -0.7 \parenthesize f'4) | c,8( c' ees bes' a4) |
    bes,8( f' bes f d'4) | bes,8( f' bes f d'4) |
    a,8( e' a e r4) | d,8( a' f' d a'4) |
    g,8( d' f d bes'4) | a,8( f' a f c'4) |
    bes,8( f' bes f %{\cright \stemDown%} \parenthesize des'4) %{\cleft \stemUp%} | s2. |
    
    bes,8( f' bes f d'4) | bes,8( f' bes f d'4) |
    a,8( e' a e \handBracket ##f -0.7 \parenthesize c'4) | d,,8( a' fis' d \handBracket ##f -0.7 \parenthesize a'4) |
    g,8( d' f d \handBracket ##f -0.7 \parenthesize bes'4) | cis,,8( e' a e %{\cright \stemDown%} \parenthesize cis'4) %{\cleft \stemUp%} |
    d,,8( a' d a \handBracket ##f -0.7 \parenthesize f'4) | c,8(^\markup \tiny \right-align *2 c' \parenthesize g' bes a4) |
    s2. | s | s | s |
    s | s | s | s |
    s | s | s | s |
    bes,8( f' a f <bes d>4) | \once \override Slur.positions = #'(7 . 6) a,8( c' \handBracket ##f -1 \parenthesize f bes, des4) |
    f,,8_( c' a' \cright \voiceTwo e' g a) | \voiceOne \ottava 1 <c g' a e' c'>2.\arpeggio\fermata |
  }
  >>
} >>

% 使ってない。頁末にmarkupした
rightossia = << \global \relative {
  % SUPER DIRTY HACK: 6行目のBraceを消す
  %\alterBroken Y-offset #'(0 0 0 0 0 -5) Score.SystemStartBrace
  \alterBroken transparent #'(#f #f #f #f #f #t) Score.SystemStartBrace
  %\override Score.SystemStartBrace.stencil = #(lambda (grob) (ly:font-get-glyph (ly:grob-default-font grob) "brace180"))
  \skip 4
  \skip 2.*33
  \new Staff \with { alignAboveContext = "right" \remove Time_signature_engraver \omit KeySignature \magnifyStaff #5/7 } {
    \revert Staff.BarLine.hair-thickness
    \override Staff.Clef.full-size-change = ##t
    % TODO: SUPER DIRTY HACK: 6行目のBraceは自分で描く (Clefにstencilをひっつける)
    \override Staff.Clef.stencil = #(lambda (grob) (ly:stencil-add
                                                    (ly:clef::print grob)
                                                    (ly:stencil-translate (grob-interpret-markup grob (markup (#:left-brace 76))) '(-0.9 . -13.7))))
    \override Staff.Clef.X-extent = #'(0 . 0)
    \override Staff.Clef.Y-extent = #'(0 . 0)
    \clef treble
    \key f \major
    <<
      \new Voice { \voiceOne <des'' f aes>4 g f }
      \new Voice { \voiceTwo r8 des,( aes' f des' aes) }
    >>
  }
} >>

% 使ってない。頁末にmarkupした
leftossia = \relative {
  \skip 4
  \skip 2.*7
  \new Staff \with { \remove Time_signature_engraver \omit KeySignature \magnifyStaff #5/7 } {
    \revert Staff.BarLine.hair-thickness
    \override Staff.Clef.full-size-change = ##t
    \clef bass
    \key f \major
    <<
      \new Voice { \voiceOne c,8( c' ees bes' f, a') }
      \new Voice { \voiceTwo \mergeOn c,,2 f4 }
    >>
  }
  \skip 2.*15
  \new Staff \with { \remove Time_signature_engraver \omit KeySignature \magnifyStaff #5/7 } {
    \revert Staff.BarLine.hair-thickness
    \override Staff.Clef.full-size-change = ##t
    \clef bass
    \key f \major
    <<
      \new Voice { \voiceOne c8( c' g' bes f, a') }
      \new Voice { \voiceTwo c,,4 g' f }
    >>
  }
}

dynamics = {
  \once \override DynamicText.extra-offset = #'(0 . -2) s4\mp
  s2.*8
  s2.*8
  s2.*8
  s2.-\markup \italic { poco cresc. } s2.*7
  s2.*3 s2.\>
  s2.\! s s4. s\> s\!
}

so = #(define-music-function (offset) (number?)
        #{ \once \override SustainPedal.X-offset = $offset #})

pedal = {
  s4
  %{
  s2.\sustainOn s\sustainOn s\sustainOn \so 0.2 s\sustainOn
  s2.\sustainOn s\sustainOn s\sustainOn s\sustainOn
  s2.\sustainOn s\sustainOn s\sustainOn s\sustainOn
  s2.\sustainOn s\sustainOn s\sustainOn s\sustainOn
  
  s2.\sustainOn s\sustainOn s\sustainOn \so 0.2 s\sustainOn
  s2.\sustainOn s\sustainOn s\sustainOn s\sustainOn
  s2.\sustainOn s\sustainOn s\sustainOn s\sustainOn
  s2.\sustainOn s\sustainOn s\sustainOn s\sustainOn
  s2.\sustainOn s\sustainOn s\sustainOn s\sustainOn
  
  s2.\sustainOn s4\sustainOn s\sustainOn s\sustainOn | s2.\sustainOn s
  %}
  s2.-\tweak TextScript.X-offset 0.5 -\tweak TextScript.Y-offset 1 -\markup { \italic col \musicglyph "pedal.Ped" \hspace #-0.5 . }
}

\score {
  <<
    \new PianoStaff <<
      \new Staff = "right" << \right %{\rightossia%} >>
      \new PianoDynamics = "dynamics" \dynamics
      \new Staff = "left" << \left %{\leftossia%} >>
      \new PianoPedal = "pedal" \pedal
    >>
  >>
  \header {
  }
  \layout {
  }
  \midi {}
}

\markup { 
  \tiny ossia
  \tiny *1:
  \score {
    \new Staff \with { \remove Time_signature_engraver \magnifyStaff #5/7 } \relative {
      \clef bass
      \time 3/4
      \key f \major
      <<
        \new Voice { \voiceOne c,8( c' ees bes' f, a') }
        \new Voice { \voiceTwo \mergeOn c,,2 f4 }
      >>
    }
    \layout { indent = 0 }
  }
  \hspace #2
  \tiny *2:
  \score {
    \new Staff \with { \remove Time_signature_engraver \magnifyStaff #5/7 } \relative {
      \clef bass
      \time 3/4
      \key f \major
      <<
        \new Voice { \voiceOne c,8( c' \parenthesize g' bes f, a') }
        \new Voice { \voiceTwo c,,4 g' f }
      >>
    }
    \layout { indent = 0 }
  }
  \hspace #2
  \tiny *3:
  \score {
    \new Staff \with { \remove Time_signature_engraver \magnifyStaff #5/7 } \relative {
      \clef treble
      \time 3/4
      \key f \major
      <<
        \new Voice { \voiceOne <des'' f aes>4 g f }
        \new Voice { \voiceTwo r8 des,( aes' f des' aes) }
      >>
    }
    \layout { indent = 0 }
  }
}

%{
right = << \global \relative {
  \clef treble
  f'4 |
  d'2 d4 | e2 f4 | c2. | r2 g8 a | bes2 bes4 | bes a g | g2 f4 | d'2 c4 |
  d2 d4 | e2 f4 | g2 f4 | f2 g,8 a | f2 g8 a | f2 g8 a | bes4 a des, | g2 f4 |
  d'2 d4 | e2 f4 | c2. | r2 g8 a | bes2 bes4 | bes a g | g2 f4 | d'2 c4 |
  d2 d4 | e2 f4 | g2 a4 | f2 c4 |
  bes a bes | f'2 bes,4 | c b c | g'2 c,4 |
  des c des | aes' g f | f2. | g2 f,4 |
} >>

left = << \global \relative c {
  \clef bass
   r4 
   bes2. | bes | a | d, | g | a2 e4 | d2 des4 | c2 f4 |
   bes2. | bes | a2 e4 | d2. | g | a | bes | c,4 g' b |
   bes2. | bes | a2 e4 | d2 fis4 | g2 d4 | cis2 cis4 | d2 des4 | c g' f |
   b2 b4 | bes2 bes4 | a2 a4 | aes2 aes4 |
   g2 g4 | g g g | a2 a4 | a a a | bes2. | bes,4 f' bes | c,2 g'4 | c2 b4 |
} >>
%}