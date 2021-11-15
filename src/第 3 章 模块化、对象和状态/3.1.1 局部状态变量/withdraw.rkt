#lang sicp
(#%require "../../../main-lib/main.rkt")

(define balance 100)

(define (withdraw amount)
  (if (>= balance amount)
      (begin (set! balance (- balance amount))
              balance)
      "Insufficient funds"))

;; 75
(displayln (withdraw 25))

;; 50
(displayln (withdraw 25))

;; Insufficient funds
(displayln (withdraw 60))

;; 35
(displayln (withdraw 15))
 