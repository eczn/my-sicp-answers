#lang sicp

(define set list)

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set) (cons x set))

; 实现 set 去重
(define (no-repeat set)
  (cond ((null? set) set)
        ((element-of-set? (car set) (cdr set))
            (no-repeat (cdr set)))
        (else
            (cons
              (car set)
              (no-repeat (cdr set))))))

(define (intersection-set raw-set1 raw-set2)
  (define (_iter set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
          ((element-of-set? (car set1) set2)
              (cons (car set1)
                    (_iter (cdr set1) set2)))
          (else (_iter (cdr set1) set2))))
  ; 需要去重之后调用 iter 求交集
  (_iter (no-repeat raw-set1) (no-repeat raw-set2)))

(define (union-set raw-set1 raw-set2)
  (define (_iter set1 set2)
    (cond ((null? set2) set1)
          ((element-of-set? (car set2) set1)
              (_iter set1 (cdr set2)))
          (else
              (_iter
                (adjoin-set (car set2) set1)
                (cdr set2)))))
  (_iter (no-repeat raw-set1) (no-repeat raw-set2)))
