#lang sicp

(define (expt b n)
    (if (= n 0)
        1
        (* b (expt b (- n 1)))))

(define (compose f g)
    (lambda (x)
        (f (g x))))

(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))))

(define (average a b) (/ (+ a b) 2))

(define (average-damp f)
    (lambda (x) (average x (f x))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (nth-root x n)
    (fixed-point ((repeated average-damp (- n 1)) (lambda (y) (/ x (expt y (- n 1)))))
        1.0))

(nth-root 2 2)
(nth-root 2 3)
(nth-root 2 4)
