#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (append x y)
  (if (null? x)
    y
    (cons (car x) (append (cdr x) y))))

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (append! x y)
  (begin
    (set-cdr! (last-pair x) y)
    x))


(define x (list 'a 'b))
(define y (list 'c 'd))

(define z (append x y))

(displayln z)
;; (a b c d)

(displayln
  (cdr x))
;; (b)

(define w (append! x y))

(displayln w)
;; (a b c d)

(displayln (cdr x))
;; (b c d)
