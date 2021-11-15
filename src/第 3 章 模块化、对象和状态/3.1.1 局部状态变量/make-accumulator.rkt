#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (make-accumulator initial)
  (define sum initial)
  (lambda (x)
    (begin
      (set! sum (+ sum x))
      sum)))

;; test
(define A (make-accumulator 5))
(displayln (A 10)) ;; 15
(displayln (A 10)) ;; 25
