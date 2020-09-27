#lang sicp 

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(define (fold-left op initial seq)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest))
                  (cdr rest))))
    (iter initial seq))


(define (reverse-1 seq)
    (fold-right
        (lambda (x y)
            (append y (cons x nil)))
        nil
        seq))

(define (reverse-2 seq)
    (fold-left 
        (lambda (x y)
            (cons y x) )
        nil
        seq))


(reverse-1 (list 1 2 3 4 5))
(reverse-2 (list 1 2 3 4 5))


