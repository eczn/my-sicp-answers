#lang sicp

(define (average a b) (/ (+ a b) 2))

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

; (fixed-point cos 1.0)
; (fixed-point (lambda (y) (+ (sin y) (cos y)))
;     1.0)

(define (sqrt x)
    (fixed-point (lambda (y) (average y (/ x y)))
        1.0))

(display "√2 = ")
(sqrt 2)


(display "黄金分割率 = ")
(fixed-point (lambda (x) (+ 1 (/ 1 x)))
    1.0)
