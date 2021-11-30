#lang sicp

;; https://docs.racket-lang.org/reference/require.html 没这个就不能作为 require 导入
(#%provide (all-defined))

;; 密码拦截认证, 如果密码正确则调用 fn x 否则调用 fallback x
(define (fn-auth fn password success fallback)
  (lambda (user-input-password x)
    (if (eq? password user-input-password)
      (begin (success x) (fn x))
      (fallback x))))

(define (make-account balance password)
  (define (call-the-cops message)
    ;; 字符串拼接 (string-append <a> <b>)
    (string-append "!!! WARNING !!! call-the-cops :: " message))

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

  (define auth-fallback-count 0)
  (define (auth-success x) (set! auth-fallback-count 0))
  (define (auth-fallback-dispatch x)
    (lambda (m)
      (if (>= auth-fallback-count 7)
        (call-the-cops "times of inputing with incorrect password more than 7")
        (begin
          (set! auth-fallback-count (+ auth-fallback-count 1))
          ;; 错误信息拼接
          (string-append "Incorrect Password - error count: " (number->string auth-fallback-count)))
      )))

  ;; 对 dispatch 做修饰
  (fn-auth dispatch password auth-success auth-fallback-dispatch))
