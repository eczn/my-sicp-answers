#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
                   (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
    (let ((p1 (* (lower-bound x) (lower-bound y)))
          (p2 (* (lower-bound x) (upper-bound y)))
          (p3 (* (upper-bound x) (lower-bound y)))
          (p4 (* (upper-bound x) (upper-bound y))))         
        (make-interval (min p1 p2 p3 p4)
                       (max p2 p2 p3 p4))))

;; 习题 2.10 
(define (div-interval x y)
    (if (< (* (upper-bound y) (lower-bound y)) 0)
        (error "区间 y 横跨 0 了，错误")
        
        (mul-interval x
            (make-interval (/ 1.0 (upper-bound y))
                        (/ 1.0 (lower-bound y))))))

(define (sub-interval x y)
    (make-interval
        (- (lower-bound x) (upper-bound y))
        (- (upper-bound x) (lower-bound y))))

(define (print-interval i)
    (display "[")
    (display (lower-bound i))
    (display ",")
    (display (upper-bound i))
    (display "]"))



; (define (calc r1 r2)
;     (add (sub r1 r2) r2) )

(define (add a b)
    (cons "+" (cons a b)) )

(define (sub a b)
    (cons "-" (cons a b)) )

(define (mul a b)
    (cons "*" (cons a b)) )

(define (div a b)
    (cons "/" (cons a b)) )


(define (par1 r1 r2)
    (div (mul r1 r2)
         (add r1 r2)))

(define (par2 r1 r2)
    (add (sub r1 r2) r2))

(define (print-exp exp)
    (define op (car exp))
    (define a (car (cdr exp)))
    (define b (cdr (cdr exp)))
    (display "(")
    (if (pair? a)
        (print-exp a)
        (display a))
    (display " ")
    (display op)
    (display " ")
    (if (pair? b)
        (print-exp b)
        (display b))
    (display ")") )

(define test (add (sub "R1" "R2") "R1"))

(print-exp test)

;; 算式复杂度计算： 每个变量只能出现一次，每多出现一次，复杂度 + 1
;; 利用树形递归得到全部可能的化简形式，然后计算每一个化简形式的复杂度
;; 最后找出复杂度最小的那个 
;; 使用复杂度最小的算式进行区间计算

; (define (reduce exp)

;     (if (string? exp)
;         exp
;         (let (
;             (op (car exp))
;             (a (car (cdr exp)))
;             (b (cdr (cdr exp)))
;         ) (cond ((= op "=") consequent1)
;             (predicate2 consequent2))))

;     ; (define op (car exp))
;     ; (define a (car (cdr exp)))
;     ; (define b (cdr (cdr exp)))
    


;     )

; (newline)


