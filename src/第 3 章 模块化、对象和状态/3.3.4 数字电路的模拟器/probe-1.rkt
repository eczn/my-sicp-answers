#lang sicp
(#%require "../../../main-lib/main.rkt")
(#%require "./agenda.rkt")
(#%require "./signal.rkt")



(define input-1 (make-wire-with-name 'i1))
(define input-2 (make-wire-with-name 'i2))
(define sum (make-wire-with-name 'i3))
(define carry (make-wire-with-name 'i4))

(probe 'input-1 input-1)
(probe 'input-2 input-2)
(probe 'sum sum)
(probe 'carry carry)

(half-adder input-1 input-2 sum carry)
(set-signal! input-1 1)

(propagate)

