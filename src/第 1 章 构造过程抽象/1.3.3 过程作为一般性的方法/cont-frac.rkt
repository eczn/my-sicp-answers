#lang sicp 

;; 递归的，注意 recursive-iter 里可能产生的计算轨迹
(define (cont-frac n d k)
    (define (recursive-iter i)
        (if (> i k)
            0
            (/ (n i)
                (+ (d i) (recursive-iter (+ i 1)))) ))
    (recursive-iter 1))

(display "递归计算")
(cont-frac
    (lambda (i) 1.0)
    (lambda (i) 1.0)
    11)


;; 迭代的
(define (cont-frac-2 n d k)
    (define the-very-bottom (+ (d (- k 1)) (/ (n k) (d k))))
    (define (iter bottom i)
        (define i-1 (- i 1))
        (if (= i 0)
            (/ (n 1) bottom)
            (iter
                (+ (d i-1) (/ (n i) bottom)) (- i 1))
            ))
    (iter the-very-bottom k))

(display "迭代计算")
(cont-frac-2
    (lambda (i) 1.0)
    (lambda (i) 1.0)
    11)


(define e-2
    (cont-frac
        (lambda (i) 1.0)

        ;; 该死的系数
        (lambda (i)
            (if (< i 3)
                i
                (if (= (remainder (+ i 1) 3) 0)
                    (* 2 (/ (+ i 1) 3))
                    1)))
        11))


(display "e = ")
(display (+ e-2 2))
(display "\n")

(define (square n)
    (* n n))
(define (even? n)
    (= (remainder n 2) 0))
(define (fast-expt-iter a b n)
    (if (= 0 n)
        a
        (if (even? n)
            (fast-expt-iter
                a (square b) (/ n 2))
            (fast-expt-iter
                (* a b) b (- n 1)))))

(define (fast-expt b n)
    (fast-expt-iter 1 b n))

(define (odd i) 
    (- (* i 2) 1) )

(define (tan-cf x k)
    (define val
        (cont-frac
            (lambda (i) (- 0.0 (fast-expt x i)))
            odd
            k))
    (- 0 val))

;; 
(display "tan(0.99) = ")
(tan-cf 0.99 100)

