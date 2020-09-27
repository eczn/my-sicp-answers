#lang sicp

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (map p sequence)
    (accumulate
        (lambda (x y)
            (cons (p x) y))
        nil
        sequence))


(define (count-leaves tree)
    (accumulate
        +
        0
        (map
            (lambda (cur)
                (if (pair? cur)
                    (count-leaves cur)
                    1))
            tree)))


(define my-tree
    (list 1 2 (list 3 4) (list 5 6 (list 7 (list 8) 9))) )


(count-leaves my-tree)
(count-leaves (list 1 2))
(count-leaves (list 1))
(count-leaves (list))
(count-leaves (list (list 3 (list 2) (list 1))))
