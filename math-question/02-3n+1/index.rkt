#lang sicp

(define (loop n)
  (cond ((= n 1) (cons 1 nil))
        ((even? n) (cons n (loop (/ n 2))))
        (else (cons n (loop (+ 1 (* 3 n)))))))

(loop 5)
(loop 6)
(loop 32)
(loop 1024)
