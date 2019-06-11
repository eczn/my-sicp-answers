#lang sicp

;; 匿名函数
((lambda (x) (+ x 1)) 1)

(define inc (lambda (x) (+ x 1)))

(inc 1)


(define (f)
    (let ((PI 3.14))
        (+ PI 1)))

(f)

