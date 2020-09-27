#lang sicp

;; 判断 n 是不是偶数 
(define (even? n)
    (= (remainder n 2) 0))

;; 递推关系
(define (A n)
    ;; 如果 n = 1
    (if (= n 1)
        2
        (if (even? n)
            ;; 对应规则 A
            (- (A (/ n 2)) 1) 
            ;; 对应规则 B
            (+ 1 (* 2 (A (/ (- n 1) 2)))))))

;; 计算 a[1] + ... + a[END]
(define (sum_for_A START END)
    (define NOW_VAL (A START))
    (if (= START END)
        NOW_VAL
        (+ NOW_VAL
            (sum_for_A (+ START 1) END))))

;; 结果
(sum_for_A 1 63)
