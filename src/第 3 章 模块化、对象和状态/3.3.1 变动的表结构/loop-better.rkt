#lang sicp
(#%require "../../../main-lib/main.rkt")

;; 尝试给 p 调用 n 次 cdr 中途有 nil 则直接返回 nil
(define (multi-cdr p n)
  (cond ((= n 0) p)
        ((null? p) p)
        (else
          (multi-cdr (cdr p) (- n 1)))))

(define (has-loop pairs)
  ;; - p1 走一步; p2 走两步 (因为 p1 不一定是回环会经过的路径)
  ;; - 看 p2 能不能追上 p1, 能的话说明回环了
  (define (find p1 p2)
    (cond ( (null? p2) "no loop" )
          ( (null? p1) (find p2 (multi-cdr p2 2) ) )
          ( (eq? p1 p2) "has loop" )
          ( else
            (find (multi-cdr p1 1)
                  (multi-cdr p2 2)))))
  (find nil pairs))

(define x1 (list 'a 'b 'c 'd))
(set-cdr! x1 x1)

(displayln
  (has-loop x1))
;; has loop

(displayln
  (has-loop (list 'a 'b 'c)))
;; no loop
