#lang sicp
(#%require "../../../main-lib/main.rkt")

;; 形如下面的 kv 结构
;; (*table* (cons KEY1 VALUE1) (cons KEY2 VALUE2))
;; value 自身也可以是 table

(define (loopup key table)
  (let ((record (assoc key (cdr table))))
    (if record
      (cdr record)
      #f)))

(define (assoc key records)
  (cond ((null? records) #f)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records))) ))

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
      (set-cdr! record value)
      (set-cdr! table
                (cons (cons key value) (cdr table))) ))
  'ok)

(define (make-table)
  (list '*table*))

(define t1 (make-table))

(insert! 'eczn 123 t1)
(insert! 'eczn 444 t1)
(insert! 'pi 99 t1)

(define t2 (make-table))
(insert! 'inner 123 t2)

(insert! 'sub-table t2 t1)

(displayln t1)

