#lang sicp

(define (double f)
    (lambda (i)
        (f (f i))))

(define (inc x) (+ x 1))

(((double (double double)) inc) 5)
