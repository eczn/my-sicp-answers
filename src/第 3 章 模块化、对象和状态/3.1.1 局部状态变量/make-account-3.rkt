#lang sicp
(#%require "../../../main-lib/main.rkt")

;; 具体实现见这里
(#%require "./make-account-final.rkt")

;; test
(define acc (make-account 100 'secret-password))

(displayln
  ((acc 'secret-password 'withdraw) 40))
;; 60

(displayln
  ((acc 'xxxx 'withdraw) 40))
;; "Incorrect Password - error count: 1"

(displayln
  ((acc 'xxxx 'withdraw) 40))
;; "Incorrect Password - error count: 2"

(displayln
  ((acc 'xxxx 'withdraw) 40))
;; "Incorrect Password - error count: 3"

(displayln
  ((acc 'xxxx 'withdraw) 40))
;; "Incorrect Password - error count: 4"

(displayln
  ((acc 'xxxx 'withdraw) 40))
;; "Incorrect Password - error count: 5"

(displayln
  ((acc 'xxxx 'withdraw) 40))
;; "Incorrect Password - error count: 6"

(displayln
  ((acc 'xxxx 'withdraw) 40))
;; "Incorrect Password - error count: 7"

(displayln
  ((acc 'xxxx 'withdraw) 40))
;; !!! WARNING !!! call-the-cops :: times of inputing with incorrect password more than 7

(displayln
  ((acc 'secret-password 'withdraw) 10)) ;; 输入正确的密码可以重置内部报警计数
;; 50

(displayln
  ((acc 'xxxx 'withdraw) 40))
;; "Incorrect Password - error count: 1"
