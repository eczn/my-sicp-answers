#lang sicp

(define (subsets s)
    (if (null? s)
        (list nil)
        (let ((rest (subsets (cdr s))))
            (append rest
                (map
                    (lambda (inner)
                        (cons (car s) inner))
                    rest)))))


(display
    (subsets (list 1 2 3)))
(newline)

(display
    (subsets (list 2 3)))
(newline)

(display
    (subsets (list 3)))
(newline)

(newline)

(display
    (cons 1 (list 2 3)))
(newline)
