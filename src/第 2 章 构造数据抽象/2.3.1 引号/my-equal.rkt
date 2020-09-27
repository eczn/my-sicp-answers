#lang sicp

(#%require "../../../main-lib/main.rkt")


;; 全等判断
(define (my-equal? L R)
    ;; 常量
    (define !!L (null? L))
    (define !!R (null? R))

    ;; 内部 eq
    (define (inner-eq? a b)
        ;; 如果 a b 都是 pair 的话，递归的处理
        (if (and (pair? a) (pair? b))
            (my-equal? a b)
            (eq? a b)))

    (if (and !!L !!R)
        ;; L 和 R 都为 nil 的情况返回 #t
        #t
        ;; 否则判断 L R 是不是其中有一个是 null?
        (if (XOR !!L !!R)
            ;; 说明 a 或 b 有一个已是 nil
            #f
            ;; 否则递归的判断全等
            (and
                ;; 判断当前 (car L) 和 (car R) 是否相等
                (inner-eq? (car L) (car R))
                ;; L R 之后的判断情况
                (my-equal? (cdr L) (cdr R))))))




;; 用例
(my-equal? '(this is a list) '(this is a list) )
(my-equal? '(this is a list) '(this (is a) list) )
(my-equal? '(this (is a) list) '(this (is a) list) )

(display "\n")

;; 下面是原生的实现
(equal? '(this is a list) '(this is a list) )
(equal? '(this is a list) '(this (is a) list) )
(equal? '(this (is a) list) '(this (is a) list) )

(display "\n")

