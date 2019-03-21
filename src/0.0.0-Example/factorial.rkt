#lang sicp

(define (factorial n)
    (if (= n 1)
        n
        (* n (factorial
                (- n 1)))))

(factorial 2)
(factorial 3)
