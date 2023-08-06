#lang sicp
(#%require "../../../main-lib/main.rkt")
(#%require "./agenda.rkt")
(#%require "./signal.rkt")

(define c0 (make-wire))

(define a1 (make-wire))
(define a2 (make-wire))

(define b1 (make-wire))
(define b2 (make-wire))


(define o1 (make-wire))
(define o2 (make-wire))

(define c1 (make-wire))
(define c2 (make-wire))

(full-adder a1 b1 c0 o1 c1)
(full-adder a2 b2 c1 o2 c2)

; (full-adder a2 b2 c-in o2 c-out)
(set-signal! a1 1)
(set-signal! a2 1)
(set-signal! b1 1)
(set-signal! b2 1)

(probe 'o1 o1)
(probe 'o2 o2)

(propagate)
