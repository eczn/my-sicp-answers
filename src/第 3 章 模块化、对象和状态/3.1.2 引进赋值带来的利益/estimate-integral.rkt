#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (random-in-range low high)
  (define range (- high low))
  (+ low (random-real range)))

;; monte carlo 测试
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0) (/ trials-passed trials))
          ((experiment)
            (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
            (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (estimate-integral P x1 x2 y1 y2)
  (define (iter)
    (P (random-in-range x1 x2) (random-in-range y1 y2)))
  (monte-carlo 100000 iter))


(define (make-circle circle-middle-x circle-middle-y r)
  (lambda (x y)
    (<= (+ (square (- x circle-middle-x) )
           (square (- y circle-middle-y)) )
        (square r))))

(define (estimate-pi x y r)
  ; (define x 5) ; 圆心 x 坐标
  ; (define y 7) ; 圆心 y 坐标
  ; (define r 3) ; 圆 半径

  (define circle (make-circle x y r))
  (define x1 (- x r))
  (define x2 (+ x r))
  (define y1 (- y r))
  (define y2 (+ y r))

  ; pi r^2 / size_of_square = probability
  ; pi = probability * size_of_square / r^2
  (/ (* (estimate-integral circle x1 x2 y1 y2)
        (* (- x2 x1) (- y2 y1)) )
     (square r))
)

;; 默认以分数展示 这里做个强制类型转换
(displayln (+ 0.0000 (estimate-pi 5 7 3)))
(displayln (+ 0.0000 (estimate-pi 0 0 10000)))
