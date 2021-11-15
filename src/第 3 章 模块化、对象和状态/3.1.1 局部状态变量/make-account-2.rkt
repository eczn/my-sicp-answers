#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (make-account balance password)
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
          ((eq? m 'incorrect-password) (error "Incorrect Password"))
          (else (error "Unknown request -- MAKE-ACCOUNT" m))))

  (fn-auth dispatch password))

;; 密码拦截认证, 如果密码正确则调用 fn x 否则调用 fn 'incorrect-password 让 fn 内部处理错误
(define (fn-auth fn password)
  (lambda (user-input-password x)
    (if (eq? password user-input-password)
      (fn x)
      (fn 'incorrect-password))))

;; test
(define acc (make-account 100 'secret-password))

(displayln
  ((acc 'secret-password 'withdraw) 40))
;; 60

(displayln
  ((acc 'xxxx 'withdraw) 40))
;; "Incorrect Password"
