#lang sicp

(define (no-more? list)
    (= 0 (length list)))

(define (first-denomination list)
    (car list))

(define (except-first-denomination list)
    (cdr list))


(define (cc amount coin-values)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (no-more? coin-values)) 0)
          (else 
            (+ (cc amount
                   (except-first-denomination coin-values))
               (cc (- amount
                      (first-denomination coin-values))
                   coin-values)))))


(cc 100 (list 1 5 10 25 50))
