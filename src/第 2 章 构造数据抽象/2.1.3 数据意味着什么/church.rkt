#lang sicp

(define zero
    (lambda (f) (lambda (x) x)) )

(define (add-1 n)
    (lambda (f)
        (lambda (x)
            (f ((n f) x)))))

(define one
    (lambda (f) (lambda (x) (f x))))

(define two
    (lambda (f) (lambda (x) (f (f x) ))))


(define (add a b)
    (lambda (f)
        (lambda (x)
            ((a f) ((b f) x)) )))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; 利用 inc 将 Church 退化为数学上的正整数 ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (inc x) (+ x 1))

;; 结果是整数 1
((one inc) 0)
;; 结果是整数 2
((two inc) 0)


;; 验证 add 是否正确 （如果正确，则结果应该是 3）
(define three (add one two))
((three inc) 0)

