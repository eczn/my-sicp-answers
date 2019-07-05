#lang sicp

(define (count-leaves x)
    (cond ((null? x) 0)
          ((not (pair? x)) 1)
          (else (+ (count-leaves (car x))
                   (count-leaves (cdr x))))))


; (count-leaves (list (list 3 4) (list (list 3 4) 4 5 6)) )
