#lang sicp

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment p1 p2)
    (cons p1 p2))

(define (start-segment segment)
    (car segment))

(define (end-segment segment)
    (cdr segment))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")\n"))

(define (midpoint-segment segment)
    (let ( (start-point (start-segment segment))
           (end-point (end-segment segment)) )
                
        (make-point
            (/ (+ (x-point start-point) (x-point end-point)) 2)
            (/ (+ (y-point start-point) (y-point end-point)) 2) )))

(display "用 (1,2) 和 (3,5) 构造线段:")
(print-point
    (midpoint-segment
        (make-segment
            (make-point 1 2)
            (make-point 3 5))))
(newline)






;; 两点确定矩形
(define (make-rect left-point right-point)
    (cons left-point right-point))

(define (left-point-rect rect)
    (car rect))

(define (right-point-rect rect)
    (cdr rect))

(define (rect-width rect)
    (abs (-  (x-point (left-point-rect rect)) (x-point (right-point-rect rect)))))

(define (rect-height rect)
    (abs (-  (y-point (left-point-rect rect)) (y-point (right-point-rect rect)))))

(define (circumference rect)
    (define a (rect-width rect))
    (define b (rect-height rect))
    (+ a a b b))

(define (size rect)
    (define a (rect-width rect))
    (define b (rect-height rect))
    (* a b))

(define (make-rect-2 start-point width height)
    (cons
        start-point
        (make-point
            (+ (x-point start-point) width)
            (+ (y-point start-point) height)) ))


;;; TEST 

(display "用点 (3,4) 和 (6,2) 构造矩形 test-rect\n")
(define test-rect 
    (make-rect
        (make-point 3 4)
        (make-point 6 2)))
(display "test-rect 周长为: ")
(circumference test-rect)
(display "test-rect 面积为: ")
(size test-rect)

(newline)
(display "以起始点 (3,4) 构造长度为 3 高度为 2 的矩形 test-rect-2\n")
(define test-rect-2
    (make-rect-2
        (make-point 3 4) 3 2))

(display "test-rect-2 周长为: ")
(circumference test-rect-2)
(display "test-rect-2 面积为: ")
(size test-rect-2)
