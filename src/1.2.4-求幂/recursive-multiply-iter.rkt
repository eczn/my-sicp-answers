#lang sicp

;; 练习 1.18
;; 把 1.17 改成迭代的

;; f(x) = 2x
(define (double x)
    (+ x x))

;; 判断 n 是不是偶数 
(define (even? n)
    (= (remainder n 2) 0))

;; f(x) = x / 2
(define (halve x)
    (/ x 2))

(define (better-* a b)
    (better-*-iter a b 0))

;; 写的比较复杂... 而且还错了
(define (better-*-iter-not-good a b n accumulation sum)
    (if (= n 0)
        (better-*-iter-not-good a b (+ n 1) (+ a accumulation) sum)
        (cond ((= b n) (+ accumulation sum))
            ((>= b (double n)) (better-*-iter-not-good a b (double n) (double accumulation) sum))
            (else (better-*-iter-not-good a (- b n) 0 0 (+ sum accumulation))))))

;; 别人写的 .... 没想到 a 也可以翻倍的
(define (better-*-iter a b product)
    (if (= b 0)
        product
        (if (even? b)
            (better-*-iter (double a)
                (halve b)
                product)
            (better-*-iter a
                (- b 1)
                (+ a product)))))
;;;
(better-* 3 0)
(better-* 3 1)
(better-* 3 2)
(better-* 3 3)
(better-* 3 4)
(better-* 3 5)
(better-* 3 6)
(better-* 3 7)
(better-* 3 8)
(better-* 3 9)
(better-* 3 10)


; (define (better-* a b)
;     (if (= b 1)
;         a
;         (if (even? b)
;             (double
;                 (better-* a (halve b)))
;             (+ a (better-*
;                     a (- b 1))))))

                    