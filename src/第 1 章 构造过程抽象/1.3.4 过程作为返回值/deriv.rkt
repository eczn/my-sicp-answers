#lang sicp

(define (average a b) (/ (+ a b) 2))

(define (cube x) (* x x x))

(define dx 0.00001)

(define (deriv g)
    (lambda (x)
        (/ (- (g (+ x dx)) (g x))
            dx)))


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

(define (newton-transform g)
    (lambda (x)
        (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
    (fixed-point (newton-transform g) guess))


(define (sqrt x)
    (newton-method (lambda (y) (- (* y y) x))
        1.0))

(sqrt 2)


(define (cubic a b c)
    (lambda (x)
        (+ (cube x)
            (* a (* x x))
            (* b x)
            c)))

(newton-method (cubic 0 0 1.0) 1.0)


