#lang sicp
(#%require "../../../main-lib/main.rkt")
(#%require "./signal.rkt")
(#%require "./or-gate-1.rkt")

;; 用 and-gate 和 inverter 构造的 or-gate-2
(define (or-gate-2 a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
          (logical-not
            (logical-and
              (logical-not (get-signal a1))
              (logical-not (get-signal a2)) )) ))
      (after-delay
        (+ inverter-delay and-gate-delay inverter-delay)
        (lambda () (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)



