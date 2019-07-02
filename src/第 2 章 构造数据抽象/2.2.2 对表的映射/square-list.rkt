#lang sicp

(define (map proc items)
    (if (null? items)
        nil
        (cons (proc (car items))
              (map proc (cdr items)))))

(define (square x) (* x x))

(define (square-list items)
    (if (null? items)
        nil
        (cons (square (car items))
              (square-list (cdr items)))))


(define (square-list-2 items)
    (map square items))



(display
    (square-list (list 1 2 3 4)))

(newline)

(display
    (square-list-2 (list 1 2 3 4)))


(define (square-list-iter items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (cons (square (car things))
                        answer))))
    (iter items nil))

(define (square-list-iter-2 items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (cons answer
                        (square (car things))))))
    (iter items nil))

(newline)
(display
    (square-list-iter (list 1 2 3 4)))

(newline)
(display
    (square-list-iter-2 (list 1 2 3 4)))



