#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT" m))))
  dispatch)

(define acc (make-account 100))

(displayln ((acc 'withdraw) 50)) ;; 50

(displayln ((acc 'withdraw) 60)) ;; Insufficent founds

(displayln ((acc 'deposit) 40)) ;; 90

(displayln ((acc 'withdraw) 60)) ;; 30
