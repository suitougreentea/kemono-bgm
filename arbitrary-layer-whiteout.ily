\version "2.19.82"

% This file provides a way to create a separate whiteout grob from existing grobs
% to make their layers separate, which is useful for whiting out overlapping grobs.
% To use it, simply \include this file and:
% 1. set whiteout-ex property of the grob you want to whiteout to #t (or thickness number).
% 2. set whiteout-layer property of the grob to a number you like
%    (default -1, so you might want to set the layer of the behind grob to -2)
% whiteout styles other than outline is not supported.

% helper functions

#(define true-or-positive?
   (lambda (val)
     (or (and (boolean? val) val)
         (and (number? val) (> val 0)))))

% Turned out unneccesary
%{
#(define direct-event-cause
   (lambda (grob)
     (let ((cause (ly:grob-property grob 'cause)))
       (if (ly:stream-event? cause)
           cause
           #f))))

#(define cause-tweaks
   (lambda (cause)
     (ly:prob-property cause 'tweaks)))

#(define* (grob-property-workaround grob prop-name #:optional (default '()))
   (let* ((direct-cause (direct-event-cause grob))
          (cause (event-cause grob))
          (grob-name (assoc-get 'name (assoc-get 'meta (ly:grob-basic-properties grob))))
          (direct-prop (if direct-cause (assoc-get prop-name (cause-tweaks direct-cause) '()) '()))
          (prop (if cause (assoc-get (cons grob-name prop-name) (cause-tweaks cause) '()) '())))
     (cond
      ((not (null? direct-prop)) direct-prop)
      ((not (null? prop)) prop)
      (else (ly:grob-property grob prop-name default)))))

#(define* (grob-property-workaround grob prop-name #:optional (default '()))
   (ly:grob-property grob prop-name default))
%}

% just a duplicate of one from scm/define-grobs.scm
#(define (completize-grob-entry x)
  (let* ((name-sym  (car x))
         (grob-entry (cdr x))
         (meta-entry (assoc-get 'meta grob-entry))
         (class (assoc-get 'class meta-entry))
         (ifaces-entry
          (assoc-get 'interfaces meta-entry)))

    (cond
     ((eq? 'Item class)
      (set! ifaces-entry (cons 'item-interface ifaces-entry)))
     ((eq? 'Spanner class)
      (set! ifaces-entry (cons 'spanner-interface ifaces-entry)))
     ((eq? 'Paper_column class)
      (set! ifaces-entry (cons 'item-interface
                               (cons 'paper-column-interface ifaces-entry))))
     ((eq? 'System class)
      (set! ifaces-entry (cons 'system-interface
                               (cons 'spanner-interface ifaces-entry))))
     (else
      (ly:warning "Unknown class ~a" class)))

    (set! ifaces-entry (uniq-list (sort ifaces-entry symbol<?)))
    (set! ifaces-entry (cons 'grob-interface ifaces-entry))

    (set! meta-entry (assoc-set! meta-entry 'name name-sym))
    (set! meta-entry (assoc-set! meta-entry 'interfaces
                                 ifaces-entry))
    (set! grob-entry (assoc-set! grob-entry 'meta meta-entry))
    (cons name-sym grob-entry)))

% modified from scm/stencil.scm
#(define* (stencil-whiteout-outline-without-original
                 stil #:optional (thickness 0.3) (color white)
                 (angle-increments 16) (radial-increments 1))
  (if (or (not (positive? angle-increments))
          (not (positive? radial-increments)))
      (begin
       (ly:warning "Both angle-increments and radial-increments must be positive numbers.")
       stil)
      (let* ((angle-inc (/ 360 angle-increments))
             (radial-inc (/ thickness radial-increments)))

        (define (circle-plot ang dec radius original-stil new-stil)
          ;; ang (angle) and dec (decrement) are in degrees, not radians
          (if (<= ang 0)
              new-stil
              (circle-plot (- ang dec) dec radius original-stil
                (ly:stencil-add
                 new-stil
                 (ly:stencil-translate original-stil
                   (ly:directed ang radius))))))

        (define (radial-plot radius original-stil new-stil)
          (if (<= radius 0)
              new-stil
              (ly:stencil-add new-stil
                (radial-plot
                 (- radius radial-inc)
                 original-stil
                 (circle-plot 360 angle-inc
                   radius original-stil empty-stencil)))))

        (let ((whiteout-expr
                (ly:stencil-expr
                 (stencil-with-color
                  (radial-plot thickness stil empty-stencil)
                  color))))
          (ly:make-stencil
            `(delay-stencil-evaluation ,(delay whiteout-expr)))))))

% stencil functions

#(define (whiteout-ex::print grob) 
   (let* ((grob-parent (ly:grob-parent grob X))
          (thickness-property (ly:grob-property grob-parent 'whiteout-ex)))
     (stencil-whiteout-outline-without-original
      (ly:grob-property grob-parent 'stencil)
      (* 0.1
        (if (number? thickness-property)
             thickness-property
             3)))))

% engraver

#(define whiteout-engraver
  (let ((acknowledged-items '())
        (acknowledged-start-spanners '())
        (acknowledged-end-spanners '()))
  (make-engraver
   (acknowledgers
    ((item-interface engraver grob source-engraver)
     (set! acknowledged-items (cons grob acknowledged-items)))
    ((spanner-interface engraver grob source-engraver)
     (set! acknowledged-start-spanners (cons grob acknowledged-start-spanners))))
   (end-acknowledgers
    ((spanner-interface engraver grob source-engraver)
     (set! acknowledged-end-spanners (cons grob acknowledged-end-spanners))))
  ((process-acknowledged engraver)
   (for-each (lambda (grob)
               (let ((whiteout-ex-prop (ly:grob-property grob 'whiteout-ex #f)))
                 (if (true-or-positive? whiteout-ex-prop)
                     (let ((whiteout-grob (ly:engraver-make-grob engraver 'WhiteoutEx grob)))
                       (ly:grob-set-parent! whiteout-grob X grob)
                       (ly:grob-set-parent! whiteout-grob Y grob)
                       (let ((whiteout-layer (ly:grob-property grob 'whiteout-layer)))
                         (if (not (null? whiteout-layer))
                             (ly:grob-set-property! whiteout-grob 'layer whiteout-layer)
                             #f)))
                     #f)))
     acknowledged-items)
   (for-each (lambda (grob)
               (let ((whiteout-ex-prop (ly:grob-property grob 'whiteout-ex #f)))
                 (if (true-or-positive? whiteout-ex-prop)
                     (let ((whiteout-grob (ly:engraver-make-grob engraver 'WhiteoutExSpanner grob)))
                       (ly:grob-set-parent! whiteout-grob X grob)
                       (ly:grob-set-parent! whiteout-grob Y grob)
                       (let ((whiteout-layer (ly:grob-property grob 'whiteout-layer)))
                         (if (not (null? whiteout-layer))
                             (ly:grob-set-property! whiteout-grob 'layer whiteout-layer)
                             #f))
                       (ly:grob-set-object! grob 'whiteout-grob whiteout-grob))
                     #f)))
     acknowledged-start-spanners)
   (for-each (lambda (grob)
               (let ((whiteout-grob (ly:grob-object grob 'whiteout-grob)))
                 (if (not (null? whiteout-grob))
                     (begin
                      (ly:spanner-set-bound! whiteout-grob LEFT (ly:spanner-bound grob LEFT))
                      (ly:spanner-set-bound! whiteout-grob RIGHT (ly:spanner-bound grob RIGHT))
                      (ly:engraver-announce-end-grob engraver whiteout-grob grob))
                     #f)))
     acknowledged-end-spanners)
   (set! acknowledged-items '())
   (set! acknowledged-start-spanners '())
   (set! acknowledged-end-spanners '())))))

% register grob properties

#(set-object-property! 'whiteout-ex 'backend-type? boolean-or-number?)
#(set-object-property! 'whiteout-layer 'backend-type? integer?)

% register grob descriptions

#(define whiteout-ex-item
   `(WhiteoutEx
     . (
        (layer . -1)
        (stencil . ,whiteout-ex::print)
        (meta . ((class . Item)
                 (interfaces . ()))))))

#(define whiteout-ex-spanner
   `(WhiteoutExSpanner
     . (
        (layer . -1)
        (stencil . ,whiteout-ex::print)
        (meta . ((class . Spanner)
                 (interfaces . ()))))))

#(set! all-grob-descriptions (append
                              (map completize-grob-entry (list whiteout-ex-item whiteout-ex-spanner))
                               all-grob-descriptions))

#(set-object-property! 'WhiteoutEx 'translation-type? ly:grob-properties?)
#(set-object-property! 'WhiteoutEx 'is-grob? #t)
#(set-object-property! 'WhiteoutExSpanner 'translation-type? ly:grob-properties?)
#(set-object-property! 'WhiteoutExSpanner 'is-grob? #t)

\layout {
  \context {
    \Global
    \grobdescriptions \all-grob-descriptions
  }
  \context {
    \Score
    \consists \whiteout-engraver
  }
}