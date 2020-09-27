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

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init   (map (lambda (s) (car s)) seqs))
              (accumulate-n op init (map (lambda (s) (cdr s)) seqs)))))


(accumulate-n + 0 
    (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)) )
