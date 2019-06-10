#lang sicp

;;;; 来自书本前面几个小节的 prime?
(define (square x)
    (* x x))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
        
(define (divides? a b)
    (= (remainder b a) 0))

(define (prime? n)
    (if (= n 1)
        false
        (= n (smallest-divisor n))) )
;;;;

;;;; 来自书本前面几个小节的 gcd 最大公约数
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
;;;; 

(define (identity x) x)
(define (inc n) (+ n 1))
(define (all-true x) true)


;;; filter accumulate 

(define (accumulate combiner filter? null-value term a next b)
    (if (> a b)
        null-value
        (combiner
            (if (filter? a) (term a) null-value)
            (accumulate
                combiner filter? null-value term (next a) next b))))


;;; a) 解答

(define (sum-primes a b)
    (define (a+b a b)
        (+ a b))
    (accumulate
        a+b prime? 0 identity a inc b))

(display "1 ~ 10 内的质数有: 2,3,5,7 和为 (1 不是质数): \n")
(sum-primes 0 10)


;;; b) 解答

(define (product-co-primes n)
    (define (a*b a b) (* a b))
    ;; 判断互质
    (define (co-prime? i)
        (= (gcd n i) 1))
    (accumulate
        a*b co-prime? 1 identity 1 inc n))

(display "小于 10 的所有与其互质的数有 1 3 7 9, 它们的乘积为: \n")
(product-co-primes 10)
