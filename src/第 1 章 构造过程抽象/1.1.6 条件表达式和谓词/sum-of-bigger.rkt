#lang sicp
;; Q1.3

;; return true when x <= y and x <= z 
(define (x-is-the-smallest? x y z)
    (and (<= x y)
        (<= x z)))

;; return the bigger one between x and y
(define (the-bigger-of x y)
    (if (< x y)
        y
        x))

;; 获取三者中较大的两者之和
(define (sum-of-bigger x y z)
    (if (x-is-the-smallest? x y z)
        (+ y z) ;; 这说明 x 是最小的，y z 是较大的两个
        (+ x (the-bigger-of y z)))) ;; 不然的话，x 是较大的两个中的一个 

;; test
(sum-of-bigger 1 2 3) ;; 5
(sum-of-bigger 2 2 3) ;; 5
(sum-of-bigger 3 3 4) ;; 7
(sum-of-bigger 2 4 4) ;; 8
(sum-of-bigger 4 4 2) ;; 8

