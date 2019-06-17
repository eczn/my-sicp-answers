#lang sicp

(define (print-list list)
    (if (null? list)
        (newline)
        (let ( (__ (display (car list)))
               (_2 (display " ")) )
            (print-list (cdr list)))))


(define (list-ref items n)
    (if (= n 0)
        (car items)
        (list-ref (cdr items) (- n 1))))

(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))))


(define (last-pair items)
    (if (null? (cdr items))
        items
        (last-pair (cdr items))))



; (cons 1 (cons 2 (cons 3)))

; cons 2 (cons 1)

; (cons 1 (cons 2 (cons 3)))

; 1 2 3 4 5 


; (r 2 3 4 5) 1



; (cons 2 (cons 1 nil))

(define (reverse list)
    (define (iter items result)
        (if (null? items)
            result

            (iter
                (cdr items)
                (cons (car items) result))))
    (iter list nil))


(reverse (list 1 2 3))
