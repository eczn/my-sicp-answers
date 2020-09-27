#lang sicp
; 习题 2.56

; 1. exponentiation?
; 2. base 底数
; 3. exponent 指数
; 4. make-exponentiation

; 构造幂算式 (base ** exponent)
(define (make-exponentiation base exponent)
    (cond ((=number? exponent 1) base)
          ((=number? base 1) 1)
          ((=number? exponent 0) 1)
          (else (list base '** exponent))))
(define (base exp) (car exp))
(define (exponent exp) (caddr exp))
(define (exponentiation? exp)
    (and (pair? exp) (eq? (cadr exp) '**)))




; 判断是否是变量
(define (variable? x) (symbol? x))

; 判断 v1 v2 是否是同一个变量
(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

; 直接构造加法算式
(define (make-sum a1 a2)
    (define (make-sum-origin a1 a2) (list '+ a1 a2))
    ; 构造加法算式的时候判断一下做一下化简后再走 make-sum-origin
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2) (+ a1 a2)))
          (else (make-sum-origin a1 a2))))

(define (=number? exp var)
    (and (number? exp) (= exp var)))

; 构造乘法算式
(define (make-product m1 m2)
    (define (make-product-origin m1 m2) (list '* m1 m2))
    ; 构造乘法算式的时候判断一下做一下化简后再走 make-product-origin
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2) (* m1 m2)))
          (else (make-product-origin m1 m2))))
; 构造 m1*m2*m3
(define (make-product-3 m1 m2 m3)
    (make-product (make-product m1 m2) m3))

; 判断是否为加法算式
(define (sum? x)
    (and (pair? x) (eq? (car x) '+)))

; 取出加数
(define (addend s) (cadr s))

; 取出被加數
(define (augend s)
    (define cdddrs (cdddr s))
    (if (eq? cdddrs (list))
        (caddr s)
        (cons '+ (cddr s))))

; 判断是否为乘法算式
(define (product? x) (and (pair? x) (eq? (car x) '*)))

; 取乘数
(define (multiplier p) (cadr p))

; 取被乘数
(define (multiplicand s)
    (define cdddrs (cdddr s))
    (if (eq? cdddrs (list))
        (caddr s)
        (cons '* (cddr s))) )

; 求导
(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp)
           (if (same-variable? exp var) 1 0))
          ((sum? exp)
           (make-sum (deriv (addend exp) var)
                     (deriv (augend exp) var)))
          ((product? exp)
           (make-sum
             (make-product (multiplier exp) 
                           (deriv (multiplicand exp) var))
             (make-product (deriv (multiplier exp) var)
                           (multiplicand exp))))
          
          ((exponentiation? exp)  ; 如果是乘幂
           (if (same-variable? (exponent exp) var)
            (make-product
              exp
              (list 'ln (base exp)))
            (make-product-3
              (exponent exp)
              (make-exponentiation (base exp) (make-sum (exponent exp) -1))
              (deriv (base exp) var)))
            )
        
          (else
           (error "unkown expression type -- DERIV" exp))))

; 习题 2.57
(deriv '(* x y (+ x 3)) 'x)
