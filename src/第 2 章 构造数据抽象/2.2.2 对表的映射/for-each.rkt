#lang sicp

(define (for-each fn list)   
    (if (null? list)
        nil
        (let ((__ (fn (car list))))
            (for-each fn (cdr list)))))

(for-each
    (lambda (x)
        (newline)
        (display x))
    (list 1 2 3))


