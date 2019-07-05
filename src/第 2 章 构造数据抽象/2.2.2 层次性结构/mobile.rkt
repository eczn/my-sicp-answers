#lang sicp

;; 建 mobile
(define (make-mobile left right)
    (list left right))

;; 建 branch 
(define (make-branch length structure)
    (list length structure))

;; 选择左分支
(define (left-branch mobile)
    (car mobile))

;; 选择右分支
(define (right-branch mobile)
    (car (cdr mobile)))

;; 选择 length
(define (branch-length branch)
    (left-branch branch))

;; 选择 structure
(define (branch-structure branch)
    (right-branch branch))

;; 判断是否是分支
(define (branch? mobile)
    (and (pair? mobile)
        (number? (left-branch mobile))
        (number? (right-branch mobile))))

;; 计算总重
(define (total-weight mobile)
    (if (branch? mobile)
        (branch-structure mobile)

        (+
            (total-weight (left-branch mobile))
            (total-weight (right-branch mobile))
        )))

;; 计算力矩
(define (calc-torque mobile)
    (cond ((null? mobile) 0)
        ((branch? mobile)
            (* (branch-length mobile)
               (branch-structure mobile)))
        (else (+ (calc-torque (left-branch  mobile))
                 (calc-torque (right-branch mobile)) ))))

;; 检查平衡
(define (balance? mobile)
    (if (branch? mobile)
        true
        (and
            (= (calc-torque (left-branch  mobile))
               (calc-torque (right-branch mobile)))
            
            (balance? (left-branch  mobile))
            (balance? (right-branch mobile))) ))


(define test-mobile
    (make-mobile
        (make-branch 2 4)
        (make-mobile
            (make-branch 2 2)
            (make-branch 2 2))))


(total-weight test-mobile)

(balance? test-mobile)
