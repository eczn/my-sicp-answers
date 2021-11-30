#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (count-pairs x)
  (if (not (pair? x))
    0
    (+ (count-pairs (car x))
       (count-pairs (cdr x))
       1)))

(displayln
  (count-pairs (list 'a (list 'd))))
;; 3

(displayln
  (count-pairs
    (cons (cons 1 2) (cons 3 4))))
;; 3 个序对, 结果为 3

(define x1 (cons 1 2))
(displayln
  (count-pairs
    (cons 'a (cons x1 x1)) ))
;; 3 个序对, 结果为 4

(define x2 (cons x1 x1))
(displayln
  (count-pairs
    (cons x2 x2) ))
;; 3 个序对, 结果为 7
