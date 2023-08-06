#lang sicp
(#%require "../../../main-lib/main.rkt")
(#%require "./agenda.rkt")
(#%require "./signal.rkt")

(define a1 (make-wire))
(define b1 (make-wire))

(inverter a1 b1)

(set-signal! a1 1)

(probe 'a1 a1)
(probe 'b1 b1)

; (propagate)
; 这个是正常的, 结果是
; ok
; done
; a1 0  New-value = 1
; b1 0  New-value = 0
; b1 2  New-value = 1
; b1 2  New-value = 0
; propagate-done


(propagate2)
; 这个是不正常的, 结果是
; ok
; done
; a1 0  New-value = 1
; b1 0  New-value = 0
; b1 2  New-value = 1
; done

