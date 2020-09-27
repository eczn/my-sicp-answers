#lang sicp

; 加载几个 list 的常用操作 比如 map 之类
(#%require "../../../main-lib/main.rkt")


;
; 习题 2.58 (b)
;

; 判断是否是变量
(define (variable? x) (symbol? x))
(define (=number? exp var) (and (number? exp) (= exp var)))

; 判断 v1 v2 是否是同一个变量
(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

; 构造加法算式
(define (make-sum a1 a2)
    (define (make-sum-origin a1 a2) (list a1 '+ a2))
    ; 构造加法算式的时候判断一下做一下化简后再走 make-sum-origin
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2) (+ a1 a2)))
          (else (make-sum-origin a1 a2))))

; 构造乘法算式
(define (make-product m1 m2)
    ; (display m1)
    ; (display "   ")
    ; (display m2)
    ; (display "\n")

    (define (make-product-origin m1 m2) (list m1 '* m2))
    ; 构造乘法算式的时候判断一下做一下化简后再走 make-product-origin
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2) (* m1 m2)))
          (else (make-product-origin m1 m2))))

; 判断是否为加法算式
(define (sum? x) (and (pair? x) (eq? (cadr x) '+)))

; 取出加数
(define (addend s) (car s))

; 取出被加數
(define (augend s)
    (define cdddrs (cdddr s))
    (if (eq? cdddrs (list))
        (caddr s)
        (cddr s))
)

; 判断是否为乘法算式
(define (product? x) (and (pair? x) (eq? (cadr x) '*)))

; 取乘数
(define (multiplier p) (car p))

; 取被乘数
(define (multiplicand p) (augend p))

; 求导
(define (deriv exp var)
    (display "exp=")
    (display exp)
    (display "\n")

    (cond ((number? exp) 0)                                  ; 对数字求导得 0
          ((variable? exp)                                   ; 如果 exp 是单个变量的话 ...
           (if (same-variable? exp var) 1 0))                ;   如果 exp 跟 var 是一个则求导为 1 否则为 0
          ((sum? exp)                                        ; 是否为加法算式
           (make-sum (deriv (addend exp) var)                ;   是的话对其加数被加数递归求导并以此构造加法算式
                     (deriv (augend exp) var)))
          ((product? exp)                                    ; 是否为乘法算式
           (make-sum                                         ;   (这里嵌套比较多... 懒得码字了)
             (make-product (multiplier exp) 
                           (deriv (multiplicand exp) var))
             (make-product (deriv (multiplier exp) var)
                           (multiplicand exp))))
          (else                                              ; 都匹配不了抛出 error
           (error "unkown expression type -- DERIV" exp)))
)

; test
; (deriv '(x + (2 * x) + (3 * x) + (4 * x) + (5 * x)) 'x)
; (deriv '(2 * x * (3 + 4)) 'x)
(deriv '((x + 2) * 3 * x) 'x)


; (deriv '(x + 3 * (x + y + 2)) 'x)
; x + 3x + 3y + 6
; 4
