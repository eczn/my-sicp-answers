#lang sicp

;; (a b) => 2^a * 2^b

(define (expt b n)
    (if (= n 0)
        1
        (* b (expt b (- n 1)))))


(define (divided-times base k)
    (define (iter base time)
        (if (= (remainder base k) 0)
            (iter (/ base k) (+ time 1))
            time))
    (iter base 0))

(define (cons a b)
    (* (expt 2 a)
       (expt 3 b)))


(define (car ab)
    (divided-times ab 2))

(define (cdr ab)
    (divided-times ab 3))


(display "序对(2,3)对应的整数: \n(cons 2 3) = ")
(cons 2 3)

(display "(car (cons 2 3)) = ")
(car (cons 2 3))

(display "(cdr (cons 2 3)) = ")
(cdr (cons 2 3))

(display "(cdr 108) = ")
(cdr 108)
