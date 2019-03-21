#lang sicp

(define (square x)
    (* x x))

(define (f g)
    (g 2))

;; error !
(f f)
