#lang sicp


(define (tree-map mapper tree)
    (define (tree-map-iter tree)
        (map (lambda (sub-tree) 
            (if (pair? sub-tree)
                (tree-map-iter sub-tree)
                (mapper sub-tree)))
            tree))
    (tree-map-iter tree) )

(define test-tree
    (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square x) (* x x))


(define (square-tree tree)
    (tree-map square tree))

(display
    (square-tree test-tree))
    
(newline)
