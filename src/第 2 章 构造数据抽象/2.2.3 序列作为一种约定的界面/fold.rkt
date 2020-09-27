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


(fold-right / 1 (list 1 2 3))

(fold-left  / 1 (list 1 2 3))

(fold-right list nil (list 1 2 3))

(fold-left  list nil (list 1 2 3))
