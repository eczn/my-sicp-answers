#lang sicp

(define (identity x) x)
(define (inc n) (+ n 1))

(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a)
            (accumulate
                combiner null-value term (next a) next b))))


(define (sum term a next b)
    (define (a+b a b) (+ a b))
    (accumulate
        a+b 0 term a next b))


(define (product term a next b)
    (define (a*b a b) (* a b))
    (accumulate
        a*b 1 term a next b))

(display "1 + 2 + 3 + 4 + 5 = ")
(sum identity 1 inc 5)

(display "1 x 2 x 3 x 4 x 5 = ")
(product identity 1 inc 5)
