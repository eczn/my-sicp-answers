#lang sicp

(define (average a b) (/ (+ a b) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    
    (define (try guess times)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                (let ((___1 (display "fixed-point 计算次数: "))
                      (___2 (display times))
                      (___3 (display "次 \n"))
                      )
                    next)
                (try next (+ times 1)))))
    (try first-guess 0))


(display "x^x = 1000 方程的根 \n\n")

(display "不用平均阻尼: \n")
(fixed-point (lambda (x) (/ (log 1000) (log x)))
    2.0)

(newline)

(display "用平均阻尼: \n")
(fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
    2.0)
