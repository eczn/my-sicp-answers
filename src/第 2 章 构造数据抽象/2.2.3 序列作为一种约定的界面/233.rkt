#lang sicp

; (define (map p sequence)
;     (acc))

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

(define (append seq1 seq2)
    (accumulate cons seq2 seq1))

(define (length sequence)
    (accumulate
        (lambda (x y) (+ y 1))
        0
        sequence))


(display "(append (list 1 2 3) (list 4 5 6)) => \n  ")
(append (list 1 2 3) (list 4 5 6))

(newline)

(display "(map (lambda (a) (+ a a)) (list 1 2 3)) => \n  ")
(map (lambda (a) (+ a a)) (list 1 2 3))

(newline)

(display "(length (list 1 2 3)) => \n  ")
(length (list 1 2 3))

