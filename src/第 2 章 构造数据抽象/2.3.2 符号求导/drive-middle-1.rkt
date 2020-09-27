#lang sicp

;
; 习题 2.58 (a)
; 需要解析中缀的情况
; 第一小题这里是假设 + 和 * 总是取两个参数并且补全了括号的情况
; 这种情况比较简单, 直接基于 './drive.rkt' 并修改其中的几个基础定义即可, deriv 根本不用改
;

; 判断是否是变量
(define (variable? x) (symbol? x))

; 判断 v1 v2 是否是同一个变量
(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

; 构造加法算式
(define (make-sum a1 a2) (list a1 '+ a2))

; 构造乘法算式
(define (make-product m1 m2) (list m1 '* m2))

; 判断是否为加法算式
(define (sum? x) (and (pair? x) (eq? (cadr x) '+)))

; 取出加数
(define (addend s) (car s))

; 取出被加數
(define (augend s) (caddr s))

; 判断是否为乘法算式
(define (product? x) (and (pair? x) (eq? (cadr x) '*)))

; 取乘数
(define (multiplier p) (car p))

; 取被乘数
(define (multiplicand p) (caddr p))

; 求导
(define (deriv exp var)
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
           (error "unkown expression type -- DERIV" exp))))

; test
(deriv '(x + 3) 'x)

; 0x + 1y
(deriv '((0 * x) + y) 'x)
