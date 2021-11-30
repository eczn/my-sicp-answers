#lang sicp
(#%require "../../../main-lib/main.rkt")
(#%require "./make-account-final-2.rkt")

(define (make-joint original-account original-password new-password)
  ((original-account original-password 'make-joint) new-password) )

(define peter-acc (make-account 100 'peter-password))

(define paul-acc
  (make-joint peter-acc 'peter-password 'paul-password))

(displayln
  ((paul-acc 'paul-password 'withdraw) 40))
;; 60

(displayln
  ((peter-acc 'peter-password 'withdraw) 0))
;; 60

(displayln
  ((paul-acc 'xxxx 'withdraw) 40))
;; "Incorrect Password - error count: 1"

(displayln
  ((peter-acc 'xxxx 'withdraw) 0))
;; "Incorrect Password - error count: 2"
