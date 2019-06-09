#lang sicp





;; 平方
(define (square x)
    (* x x))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    ; log
    ; (display "fd")
    ; (display test-divisor)
    ; (display ",")
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
    (= (remainder b a) 0))


(define (prime? n)
    (= n (smallest-divisor n)))


;; 判断是不是偶数
(define (even? n)
    (= (remainder n 2) 0))



(define (timed-prime-test n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
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

(search-for-primes 100000000000 100000000057)
(display "\n")
(search-for-primes 1000000000000 1000000000063)
(display "\n")
(search-for-primes 10000000000000 10000000000099)


; (from 1000000000   1000000021   (runtime))
; (from 10000000000  10000000061  (runtime))
; (from 100000000000 100000000057 (runtime))
