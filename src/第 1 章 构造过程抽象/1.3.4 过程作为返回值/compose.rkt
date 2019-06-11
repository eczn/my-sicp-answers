#lang sicp

(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (compose f g)
    (lambda (x)
        (f (g x))))

((compose square inc) 6)


(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))))

((repeated square 2) 5)


(define (smooth f)
    (lambda (x)
        (/ (f (- x dx))
           (f x)
           (f (+ x dx)))))

(define (smooth-n f n)
    (repeated smooth n))


