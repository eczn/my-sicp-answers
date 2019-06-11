#lang sicp

(define (square x) (* x x))

(define (average a b) (/ (+ a b) 2))

(define TOLERANCE 0.00001)

(define (iterative-improve good-enough? improve first-guess)
    (define (iter guess)
        (if (good-enough? guess)
            guess
            (iter (improve guess))))
    
    (iter first-guess))


(define (sqrt x)
    (iterative-improve
        (lambda (guess)
            (< (abs (- (square guess) x)) TOLERANCE))
        (lambda (guess)
            (average guess (/ x guess)))
        1.0))

;; 牛顿法求平方根
(sqrt 2)


(define (fixed-point f first-guess)
    (iterative-improve 
        (lambda (guess)
            (let ((next (f guess)))
                (< (abs (- guess next)) TOLERANCE) ))
        (lambda (guess)
            (f guess))        
        first-guess))

(define (sqrt-by-fixed-point x)
    (fixed-point (lambda (y) (average y (/ x y)))
        1.0))

;; 不动点法求平方根
(sqrt-by-fixed-point 2)
