#lang sicp


(define (same-parity . items)
    (define parity (remainder (car items) 2))
    (define (iter items)
        (if (null? items)
            nil
            (if (= parity (remainder (car items) 2))
                (cons (car items) (iter (cdr items)))
                (iter (cdr items)))))
    (iter items))


(display
    (same-parity 1 2 3 4 5 6 7))

(newline)

(display
    (same-parity 2 3 4 5 6 7))
