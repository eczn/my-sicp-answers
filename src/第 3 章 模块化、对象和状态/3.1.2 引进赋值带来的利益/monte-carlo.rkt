#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (rand) (random 10000000))

;; monte carlo 测试
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0) (/ trials-passed trials))
          ((experiment)
            (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
            (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (cesaro-test)
  (= (gcd (rand) (rand)) 1))

(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trials cesaro-test))))

(displayln (estimate-pi 1000000))
;; 总是输出 3.14 附近的值 比如 3.1421759972037417
