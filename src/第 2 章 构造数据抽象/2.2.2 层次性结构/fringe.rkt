#lang sicp

(define (fringe lst)
    (if (null? lst)
        lst
        (let ((item (car lst))
              (next (cdr lst)))
            (append
                (if (pair? item)
                    (fringe item)
                    (list item))
                (fringe next)))))

(define test-lst (list (list 1 2) 3 (list (list 4 5 6) 7 (list 8 (list 9)))))

(display 
    (fringe test-lst))
