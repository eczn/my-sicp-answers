#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal -- logical-not" s))))

(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay
        inverter-delay
        (lambda () (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)


(define (logical-and s1 s2)
  (cond ( (= s1 0) (if (= s2 0) 0) )
        ( (= s1 0) (if (= s2 1) 0) )
        ( (= s1 1) (if (= s2 0) 0) )
        ( (= s1 1) (if (= s2 1) 1) )
        ( else (error "Invalid signal -- logical-and" s1 s2) )
  ))

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

(define (logical-or s1 s2)
  (cond ( (= s1 0) (if (= s2 0) 0) )
        ( (= s1 0) (if (= s2 1) 1) )
        ( (= s1 1) (if (= s2 0) 1) )
        ( (= s1 1) (if (= s2 1) 1) )
        ( else (error "Invalid signal -- logical-or" s1 s2) )
  ))


;; 用 and-gate 和 inverter 构造的 or-gate-2
(define (or-gate-2 a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
          (logical-not
            (logical-and
              (logical-not (get-signal a1))
              (logical-not (get-signal a2)) )) ))
      (after-delay
        (+ inverter-delay and-gate-delay inverter-delay)
        (lambda () (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)



