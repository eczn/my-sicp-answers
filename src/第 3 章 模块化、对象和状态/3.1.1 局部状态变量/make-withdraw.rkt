#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (create-withdraw balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
                balance)
        "Insufficient funds"))
  withdraw
)


(define w1 (create-withdraw 99))


(displayln (w1 10))

(displayln (w1 10))

(displayln (w1 10))

(displayln (w1 100))
