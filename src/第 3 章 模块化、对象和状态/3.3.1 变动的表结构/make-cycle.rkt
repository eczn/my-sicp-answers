#lang sicp
(#%require "../../../main-lib/main.rkt")


(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(displayln "start run (last-pair z)")

(last-pair z)
