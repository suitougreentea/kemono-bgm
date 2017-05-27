\version "2.19.57"

#(define-markup-command (jp-sans-light layout props text) (markup?)
  #:category font
  "Set font to JP Sans Light"
  (interpret-markup layout (prepend-alist-chain 'font-name "Gen Shin Gothic Light" props) text))

#(define-markup-command (jp-sans-regular layout props text) (markup?)
  #:category font
  "Set font to JP Sans Regular"
  (interpret-markup layout (prepend-alist-chain 'font-name "Gen Shin Gothic Regular" props) text))

#(define-markup-command (jp-sans-semibold layout props text) (markup?)
  #:category font
  "Set font to JP Sans Semibold"
  (interpret-markup layout (prepend-alist-chain 'font-name "Gen Shin Gothic Medium" props) text))

#(define-markup-command (jp-sans-bold layout props text) (markup?)
  #:category font
  "Set font to JP Sans Bold"
  (interpret-markup layout (prepend-alist-chain 'font-name "Gen Shin Gothic Bold" props) text))

#(define-markup-command (jp-serif-light layout props text) (markup?)
  #:category font
  "Set font to JP Serif Light"
  (interpret-markup layout (prepend-alist-chain 'font-name "Source Han Serif Light" props) text))

#(define-markup-command (jp-serif-regular layout props text) (markup?)
  #:category font
  "Set font to JP Serif Regular"
  (interpret-markup layout (prepend-alist-chain 'font-name "Source Han Serif Regular" props) text))

#(define-markup-command (jp-serif-semibold layout props text) (markup?)
  #:category font
  "Set font to JP Serif Semibold"
  (interpret-markup layout (prepend-alist-chain 'font-name "Source Han Serif Semibold" props) text))

#(define-markup-command (jp-serif-bold layout props text) (markup?)
  #:category font
  "Set font to JP Serif Bold"
  (interpret-markup layout (prepend-alist-chain 'font-name "Source Han Serif Bold" props) text))

#(define (print-all-headers layout props arg)
  (if (eq? (ly:output-def-lookup layout 'print-all-headers) #t)
   (interpret-markup layout props arg)
   empty-stencil))

\paper {
  bookTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \column {
      \fill-line { \fromproperty #'header:dedication }
      \override #'(baseline-skip . 3.5)
      \column {
        \fill-line {
          \huge \larger \larger \jp-sans-semibold
          \fromproperty #'header:title
        }
        \fill-line {
          \large \bold
          \fromproperty #'header:subtitle
        }
        \fill-line {
          \smaller \bold
          \fromproperty #'header:subsubtitle
        }
        \fill-line {
          \large \jp-sans-semibold
          \fromproperty #'header:nickname
        }
        \fill-line {
          \fromproperty #'header:poet
          { \large \bold \fromproperty #'header:instrument }
          \fromproperty #'header:composer
        }
        \fill-line {
          \fromproperty #'header:meter
          \fromproperty #'header:arranger
        }
        \hspace #1
        \fill-line { "" \fromproperty #'header:revision }
        \fill-line { "" \fromproperty #'header:date }
      }
    }
  }

  scoreTitleMarkup = \markup { \column {
    %\on-the-fly \print-all-headers { \bookTitleMarkup \hspace #1 }
    \fill-line {
      \jp-sans-semibold \fromproperty #'header:piece
      \jp-sans-semibold \fromproperty #'header:opus
    }
  }}

  tagline = \markup \fill-line \italic {
    "LilyPond - Music notation for everyone"
    \small #(string-append "Version " (lilypond-version) ", lilypond.org")
  }
}

\layout {
  \context {
    \Staff
    \override TimeSignature.style = #'numbered
  }
  \context {
    \Dynamics
    \name PianoDynamics
    \alias Dynamics
    \override VerticalAxisGroup.staff-affinity = #CENTER
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = 1
  }
  \context {
    \Dynamics
    \name PianoPedal
    \alias Dynamics
    \override UnaCordaPedal.self-alignment-X = -1
    \override VerticalAxisGroup.staff-affinity = #UP
    \override VerticalAxisGroup.nonstaff-nonstaff-spacing.padding = 1
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = 1
    \override SustainPedal.extra-offset = #'(0.5 . 0)
  }
  \context {
    \PianoStaff
    \accepts PianoDynamics
    \accepts PianoPedal
  }
}

\midi {
  \context {
    \Dynamics
    \name PianoDynamics
    \alias Dynamics
  }
  \context {
    \Dynamics
    \name PianoPedal
    \alias Dynamics
  }
  \context {
    \PianoStaff
    \accepts PianoDynamics
    \accepts PianoPedal
  }
}

handBracket = #(define-music-function
  (parser location down pos) (boolean? number?)
  #{
   \once \override ParenthesesItem.stencil =
      #(ly:make-stencil
        `(path 0.1
           `(
             moveto -1 ,,(* 1.7 (if down -1 1))
             lineto -1 0
             lineto -0.3 0
           )
           `butt
           `miter
         )
         (cons -1 0)
         (cons 0 (* 1.7 (if down -1 1)))
       )
   \once \override ParenthesesItem.X-extent = #'(-1.2 . 0)
   \once \override ParenthesesItem.Y-extent = #`(0 . ,(* 1.7 (if down -1 1)))
   \once \override ParenthesesItem.Y-offset = #pos
  #}
)