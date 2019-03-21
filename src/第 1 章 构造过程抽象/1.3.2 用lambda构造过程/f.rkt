#lang sicp

(define (f g)
    (g 2))

;; error !
(f f)
