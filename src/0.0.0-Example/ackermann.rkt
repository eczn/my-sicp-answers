#lang sicp

(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (f n) (A 0 n)) ;; f(n) = 2 * n
(define (g n) (A 1 n)) ;; g(n) = 2 ^ n
(define (h n) (A 2 n)) ;; h(n) = 222222.... 

;; test 
(f 2) ;; 2 * 2 = 4
(g 4) ;; 2 ^ 4 = 16
(h 3) ;; 2^(2^2)

