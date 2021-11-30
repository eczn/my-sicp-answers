#lang sicp

;; 本目录下放了一些工具方法

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

(define (foreach fn seq)   
    (if (null? seq)
        nil
        (let ((__ (fn (car seq))))
            (for-each fn (cdr seq)))))

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

;; 原生 racket sicp display 不会帮你加 \n 这里补一个带 \n 的 displayln
(define (displayln str)
    (display str)
    (display "\n"))

;; 求平方
(define (square x) (* x x))

;; 原生 racket sicp random 只能返回整数, 这里实现一个更好一点的
(define (random-real range)
    (/ (random (* range 100000)) 100000))
