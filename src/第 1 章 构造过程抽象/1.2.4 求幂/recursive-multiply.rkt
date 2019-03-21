#lang sicp

;; 练习 1.17
;; 这是书上给的用递归的加法定义乘法
;; f(a, b) = a * b
(define (* a b)
    (if (= b 0)
        0
        (+ a (* a (- b 1)))))

;; f(x) = 2x
(define (double x)
    (+ x x))

;; 判断 n 是不是偶数 
(define (even? n)
    (= (remainder n 2) 0))

;; f(x) = x / 2
(define (halve x)
    (/ x 2))

;; 计算 3 * 14
;; 3 * 12 = 3 * (14 / 2) * 2
;;        = 3 * 7 * 2
;;        = (3 * (7 - 1) + 3) * 2
;;        = ((3 * (6 / 2)) * 2 + 3) * 2
;; ... 
;; 总之吧奇数换成偶数、不断应用乘 2 除 2 即可
;; 这个速度比上面那个递归的加法定义快很多 达到了题目要求的 logn 
;; (因为不停的对 b 除以 2 因此一般只要 logn 次就可以除尽)
;; 代码：
(define (better-* a b)
    (if (= b 0)
        0
        (if (even? b)
            (double
                (better-* a (halve b)))
            (+ a (better-*
                    a (- b 1))))))


(display "计算 3 * 100000000 \n")
(display "速度快很多的 * :\n")
(better-* 3 100000000)

(display "速度慢很多的 * : (计算中... 可能时间比较久哦, 可以打开任务管理器看看内存和CPU占用 ^ ^)\n")
(* 3 100000000)
