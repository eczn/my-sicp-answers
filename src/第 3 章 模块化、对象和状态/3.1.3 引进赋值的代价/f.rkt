#lang sicp
(#%require "../../../main-lib/main.rkt")


(define (make-f)
  (define prev 0)
  (define (f x)
    (define result x)
    (begin
      (set! result prev)
      (set! prev x)
      result
    ) )
  f
)


;; l to r  0
(define f1 (make-f))
(displayln
  (+ (f1 0) (f1 1)))

;; r to l  1
(define f2 (make-f))
(displayln
  (+ (f2 1) (f2 0)))
