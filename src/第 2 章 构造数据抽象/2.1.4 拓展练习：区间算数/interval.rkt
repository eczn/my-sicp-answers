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

(define 1_2 (make-interval 1 2))
(define 3_4 (make-interval 3 4))

(print-interval 1_2)
(display " + ")
(print-interval 3_4)
(display " = ")
(print-interval (add-interval 1_2 3_4))

(newline)

(print-interval 1_2)
(display " - ")
(print-interval 3_4)
(display " = ")
(print-interval (sub-interval 1_2 3_4))




;; 
(define (make-center-width c w)
    (make-interval (- c w) (+ c w)))

(define (center i)
    (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
    (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
    (make-interval
        (- c (* c p))
        (+ c (* c p))))

(define (percent i)
    (- 1
        (/ (lower-bound i) (center i))))


(define (par1 r1 r2)
    (div-interval (mul-interval r1 r2)
                  (add-interval r1 r2)))

(define (par2 r1 r2)
    (let ((one (make-interval 1 1)))
        (div-interval one 
            (add-interval (div-interval one r1)
                          (div-interval one r2)))))


(newline)

(define my-r1 (make-interval 3 4))
(define my-r2 (make-interval 3 4))

(print-interval (par1 my-r1 my-r2))

(newline)

(print-interval (par2 my-r1 my-r2))

(newline)


(define my-r3 (make-interval 3 4))
(define my-r4 (make-interval 3 4))

(print-interval my-r3)

(newline)

(print-interval (sub-interval (add-interval my-r3 my-r4) my-r4))

