\version "2.19.82"
\include "arbitrary-layer-whiteout.ily"

%#(display "a")
%#(newline)

\score {
  \new Staff \relative {
    %\override Hairpin.whiteout-style = #'outline
    %\override Hairpin.whiteout = ##t
    \displayMusic {
    \override Hairpin.whiteout-ex = ##t
    \override TrillSpanner.whiteout-ex = ##t
    }
    %\override Beam.whiteout-ex = 10
    \override Beam.whiteout-layer = 0
    %\override NoteHead.whiteout-ex = ##t
    %\override Hairpin.whiteout-layer = 10
    %\tweak NoteHead.whiteout-ex ##t \tweak Beam.whiteout-ex 20 c''8\<\startTrillSpan b a g f e d c \break | b a\!\stopTrillSpan
    \tweak Stem.length 10
    <\tweak whiteout-ex ##t c e g>4 
    %c'4\< d4\!
  }
}