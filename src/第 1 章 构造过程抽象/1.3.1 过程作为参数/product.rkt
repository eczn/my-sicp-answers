#lang sicp

;; f(x) = x
(define (identity x) x)
;; f(x) = x + 1
(define (inc n) (+ n 1))


;; product 迭代实现
(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter
                (next a)
                (* result (term a)))))
    (iter a 1))

(define (factorial n)
    (product identity 1 inc n))
(display "迭代 Factorial: \n")
(factorial 1)
(factorial 2)
(factorial 3)
(factorial 4)
(factorial 5)

;; product 递归实现
(define (product-recursive term a next b)
    (if (= a b)
        (term a)
        (* (term a)
            (product-recursive
                term
                (next a)
                next
                b))))

(define (factorial-2 n)
    (product-recursive identity 1 inc n))

(display "递归 Factorial: \n")
(factorial-2 1)
(factorial-2 2)
(factorial-2 3)
(factorial-2 4)
(factorial-2 5)



;; 计算近似的 Pi, n 越大月精确
(define (get-pi n)
    (define (numerator nth)
        (+ nth 1.0 (remainder (+ nth 1) 2)))
    (define (denominator nth)
        (+ nth 1.0 (remainder nth 2)))
    
    (define (one nth)
        (/ (numerator nth)
            (denominator nth)))
    
    (* 4 (product one 1 inc n)))

;; 近似的 Pi
(newline)
(display "利用题目中的数列计算的近似的 Pi: \n")
(display (get-pi 10000))
(newline)


