#lang sicp
(#%require "../../../main-lib/main.rkt")
(#%require "./agenda.rkt")
(#%require "./signal.rkt")

;; aaaa bbbb 是输入
;; c-in 0 位输入
;; ssss 输出
;; c-out 溢出位输出
(define (ripple-carry-adder aaaa bbbb initial-c-in ssss c-out)
  ; 短的, 比如 a 是当前处理的位
  ; 长的, 比如 aaa 是剩下的
  (let (  (a (car aaaa)) (aaa (cdr aaaa))
          (b (car bbbb)) (bbb (cdr bbbb))
          (s (car ssss)) (sss (cdr ssss))
          (c-in (make-wire)) )

    ; 这里级联展开将 initial-c-in 的信号透传到最后一个 c-in
    (if (null? aaa)
      (set-signal! c-in (get-signal initial-c-in))
      (ripple-carry-adder aaa bbb initial-c-in sss c-in) )

    ; 连接起来
    (full-adder a b c-in s c-out)
  )
  'done
)

(define A (list (make-wire) (make-wire) (make-wire) (make-wire)))
(define B (list (make-wire) (make-wire) (make-wire) (make-wire)))
(define S (list (make-wire) (make-wire) (make-wire) (make-wire)))
(define (print-all bits)
  (foreach display (map get-signal bits))
  (displayln ""))

(define c-in (make-wire))
(define c-out (make-wire))

(foreach (lambda (bit) (set-signal! bit 0)) A)
(foreach (lambda (bit) (set-signal! bit 1)) B)


(foreach (lambda (bit) (probe 'SN bit)) S)

(probe 'c-out c-out)

(ripple-carry-adder A B c-in S c-out)

(propagate)
