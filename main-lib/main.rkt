#lang sicp

;; 千万别忘了这一句
(#%provide (all-defined))

;; 列表 accumulate
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

;; 列表 flatmap (压平)
(define (flatmap proc seq)
    (accumulate append nil (map proc seq)) )

(define (!= l r)
    (not (= l r)))

;; 列表 filter
(define (filter proc seq)
    (cond ((null? seq) nil)
          ((proc (car seq))
           (cons (car seq)
                 (filter proc (cdr seq))) )
          (else (filter proc (cdr seq)))))


(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons
            low
            (enumerate-interval
                (inc low)
                high))))


;; 异或操作逻辑 XOR
(define (XOR a b)
    (define !a (not a))
    (define !b (not b))
    (cond ((and  a  b) #f)
          ((and !a !b) #f)
          (else #t)
            ))
