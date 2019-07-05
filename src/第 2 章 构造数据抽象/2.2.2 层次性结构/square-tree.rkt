#lang sicp

; (define (scale-tree tree factor)
;     (cond ((null? tree) nil) 
;           ((not (pair? tree)) (* tree factor))
;           (else (cons (scale-tree (car tree) factor)
;                       (scale-tree (cdr tree) factor))) ))


(define (square-tree tree)
    (cond ((null? tree) nil) 
          ((not (pair? tree)) (* tree tree))
          (else (cons (square-tree (car tree))
                      (square-tree (cdr tree)))) ))

(define (square-tree-map tree)
    (map (lambda (sub-tree) 
        (if (pair? sub-tree)
            (square-tree-map sub-tree)
            (* sub-tree sub-tree)))
        tree))

(define test-tree
    (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(display
    (square-tree test-tree))

(newline)

(display
    (square-tree-map test-tree))

