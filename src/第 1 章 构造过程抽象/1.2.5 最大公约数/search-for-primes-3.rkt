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




(define (timed-prime-test n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (fast-prime? n 10)
        (report-prime (- (runtime) start-time) n)))

(define (report-prime elapsed-time n)
    (display n)
    (display " *** ")
    (display elapsed-time)
    (newline))

(define (do-nothing a b) "三个")

;; 
(define (search-for-primes a b)
    (if (<= a b)
        (if (even? a)
            (search-for-primes (+ a 1) b)
            
            (do-nothing
                (timed-prime-test a)
                (search-for-primes (+ a 1) b)) )))

; (search-for-primes (+ a 1) b)

(search-for-primes 1000 1019)
(display "\n")
; (search-for-primes 1000000000000 1000000000063)
; (display "\n")
; (search-for-primes 10000000000000 10000000000099)


; (from 1000000000   1000000021   (runtime))
; (from 10000000000  10000000061  (runtime))
; (from 100000000000 100000000057 (runtime))

