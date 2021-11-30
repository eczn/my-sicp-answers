#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (has-loop input-pairs)
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

  (define (iter n)
    (cond ((null? n) "no loop")
          ((pairs-exists? n) "has loop")
          (else
            (begin
              (pairs-add! n)
              (iter (cdr n))) )))

  (iter input-pairs)
)

(define x1 (list 'a 'b 'c 'd))
(set-cdr! x1 x1)

(displayln
  (has-loop x1))
;; has loop

(displayln
  (has-loop (list 'a 'b 'c)))
;; no loop
