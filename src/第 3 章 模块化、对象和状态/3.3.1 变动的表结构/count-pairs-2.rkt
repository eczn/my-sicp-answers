#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (count-pairs x)
  (define pairs '() )

  (define (pairs-add! x)
    (set! pairs (cons x pairs)))

  (define (pairs-exists? x)
    (define (iter n p)
      (if (not (pair? p))
        #f
        (if (eq? n (car p))
          #t
          (iter n (cdr p)))))
    (iter x pairs))

  (define (loop n)
    (cond ( (not (pair? n)) 0 )
          ( (pairs-exists? n) 0 ) ; 判断 n 有没有处理过
          (else
            (begin
              (pairs-add! n)        ; 需要加到 paris 里保存已经处理过了
              (+ (loop (car n))
                 (loop (cdr n))
                 1)))))

  (loop x)
)

(displayln
  (count-pairs (list 'a (list 'd))))
;; 3

(displayln
  (count-pairs
    (cons (cons 1 2) (cons 3 4))))
;; 3 个序对, 结果为 3

(define x1 (cons 1 2))
(displayln
  (count-pairs
    (cons 'a (cons x1 x1)) ))
;; 3 个序对, 结果为 3

(define x2 (cons x1 x1))
(displayln
  (count-pairs
    (cons x2 x2) ))
;; 3 个序对, 结果为 3
