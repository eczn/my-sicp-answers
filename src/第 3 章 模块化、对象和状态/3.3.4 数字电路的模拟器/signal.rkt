;;
;; 书中的代码定义
;;

#lang sicp
(#%provide (all-defined))
(#%require "./agenda.rkt")


(define inverter-delay 2)
(define and-gate-delay 3)
(define or-gate-delay 5)

;; 非逻辑
(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal -- logical-not" s))))

;; 非门
(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay
        inverter-delay
        (lambda () (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)

;; 与逻辑
(define (logical-and s1 s2)
  (cond ( (= s1 0) (if (= s2 0) 0 0) )
        ( (= s1 1) (if (= s2 0) 0 1) )
        ( else (error "Invalid signal -- logical-and" s1 s2) )
  ))

;; 与门
(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) (get-signal a2))))

      (after-delay
        and-gate-delay
        (lambda () (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)

;; 或逻辑
(define (logical-or s1 s2)
  (cond ( (= s1 0) (if (= s2 0) 0 1) )
        ( (= s1 1) (if (= s2 0) 1 1) )
        ( else (error "Invalid signal -- logical-or" s1 s2) )
  ))

;; 或门
(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
           (logical-or (get-signal a1) (get-signal a2))))
      (after-delay
        or-gate-delay
        (lambda () (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)


;; 半加器
(define (half-adder a b s c)
  (let ((d (make-wire)) (e (make-wire)) )
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok
  )
)

;; 全加器
(define (full-adder a b c-in sum c-out)
  (let ( (s (make-wire))
         (c1 (make-wire))
         (c2 (make-wire)) )
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok
  )
)

(define (make-wire)
  (make-wire-with-name 'UNKNOWN))

;; 构造 wire, 底下是返回了一个 dispatch
(define (make-wire-with-name wire-name)
  (let ( (signal-value 0)
         (action-procedures '()) )
    (define (set-my-signal! new-value)
      ; for debug
      ; (display " GGG ")
      ; (display wire-name)
      ; (display " ")
      ; (display new-value)
      ; (newline)
      (if (not (= signal-value new-value))
          (begin (set! signal-value new-value)
                 (call-each action-procedures))
          'done))
    (define (accept-action-procedure! proc)
      (set! action-procedures (cons proc action-procedures))
      (proc))

    (define (dispatch m)
      (cond ((eq? m 'get-signal) signal-value)
            ((eq? m 'set-signal!) set-my-signal!)
            ((eq? m 'add-action!) accept-action-procedure!)
            (else (error "Unknown operation -- WIRE" m))))

    dispatch
  )
)

;; procedures 是一个列表, call-each 会调用其中的每一个函数
(define (call-each procedures)
  (if (null? procedures)
    'done
    (begin
      ((car procedures))
      (call-each (cdr procedures)))))

;; 获取 wire
(define (get-signal wire)
  (wire 'get-signal))
;; 写入 wire
(define (set-signal! wire new-value)
  ((wire 'set-signal!) new-value))
;; 监听 wire
(define (add-action! wire new-procedure)
  ((wire 'add-action!) new-procedure))


;; 监听 wire 并用 display 打印东西
(define (probe name wire)
  (add-action! wire
              (lambda ()
                (display name)
                (display " ")
                (display (current-time the-agenda))
                (display "  New-value = ")
                (display (get-signal wire))
                (newline) ;; \n
              )))

