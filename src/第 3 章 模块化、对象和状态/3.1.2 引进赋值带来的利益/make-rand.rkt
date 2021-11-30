#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (make-rand current rand-update)
  (define (generate)
    (begin
      (set! current (rand-update current))
      current))

  (define (reset x) (set! current x))

  (define (dispatch m)
    (cond ((eq? m 'generate) (generate))
          ((eq? m 'reset) reset)
          (else (error "unknown operation")) ))
  dispatch)


(define my-rand (make-rand 0 (lambda (x) (+ x 1))))

(displayln (my-rand 'generate)) ;; 1
(displayln (my-rand 'generate)) ;; 2
(displayln (my-rand 'generate)) ;; 3
(displayln (my-rand 'generate)) ;; 4
(displayln (my-rand 'generate)) ;; 5
(displayln (my-rand 'generate)) ;; 6
(displayln (my-rand 'generate)) ;; 7
(displayln (my-rand 'generate)) ;; 8

((my-rand 'reset) 5)
(displayln (my-rand 'generate)) ;; 6
