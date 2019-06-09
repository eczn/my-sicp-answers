#lang sicp

;; 平方
(define (square x)
    (* x x))

;; 判断是不是偶数
(define (even? n)
    (= (remainder n 2) 0))

;; 一个数的幂对另一个数取模
(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) m))
                      m))
          (else 
            (remainder (* base (expmod base (- exp 1) m))
                      m))))


(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
    (cond ((= times 0) true)
            ((fermat-test n) (fast-prime? n (- times 1)))
            (else false)))


(fast-prime? 10 1)

