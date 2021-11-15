#lang sicp
(#%require "../../../main-lib/main.rkt")

;; 给 f 加个调用计数
(define (make-monitored f)
  (define count 0)
  (lambda (x)
    (cond ((eq? x 'how-many-calls?) count)
          ((eq? x 'reset-count) (set! count 0))
          (else (begin 
                  (set! count (+ count 1))
                  (f x))))))

(define msqrt (make-monitored sqrt))

(displayln (msqrt 100))               ;; 10
(displayln (msqrt 'how-many-calls?))  ;; 1

(displayln (msqrt 49))                ;; 7
(displayln (msqrt 'how-many-calls?))  ;; 2

(displayln (msqrt 'reset-count))      ;; #void 具体看解释器中 set! 的实现
(displayln (msqrt 'how-many-calls?))  ;; 0
