#lang sicp
;; 实现: 求幂函数 f(x, n) = x ^ n 
;; 形式要求：迭代计算
;; 性能要求：
;;   1. 时间复杂度: O(logn)
;;   2. 空间复杂度: O(1)

;; 求平方
;; square(n) = n * n
(define (square n)
    (* n n))

;; 判断 n 是不是偶数 
(define (even? n)
    (= (remainder n 2) 0))

;; 求幂的迭代器
(define (fast-expt-iter a b n)
    (if (= 0 n)
        ;; 如果 n 到 0 返回 a
        a
        ;; 否则判断 n 是不是偶数 
        (if (even? n)
            ;; 是偶数的话，根据 (a^(n / 2)) ^ 2 = (b ^ 2)^(n / 2) 来迭代
            (fast-expt-iter
                a (square b) (/ n 2))
            ;; 否则化成偶数来处理 ^_^
            (fast-expt-iter
                (* a b) b (- n 1)))))

;; 包装一下迭代器
(define (fast-expt b n)
    (fast-expt-iter 1 b n))

;; test cases
(fast-expt 3 0) ;; 3^0 = 1
(fast-expt 3 1) ;; 3^1 = 3
(fast-expt 3 2) ;; 3^2 = 9
(fast-expt 3 3) ;; 3^3 = 27
(fast-expt 3 4) ;; 3^4 = 81
(fast-expt 3 5) ;; 3^5 = 243
(fast-expt 3 6) ;; 3^5 = 729

