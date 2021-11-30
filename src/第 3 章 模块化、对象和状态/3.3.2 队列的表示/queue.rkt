#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (front-ptr queue) (car queue))

(define (rear-ptr queue) (cdr queue))

(define (set-front-ptr! queue item) (set-car! queue item))

(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue) (null? (front-ptr queue)))

(define (make-queue) (cons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
    (error "FRONT called with an empty queue" queue)
    (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
            (set-front-ptr! queue new-pair)
            (set-rear-ptr! queue new-pair)
            queue)
          (else
            (set-cdr! (rear-ptr queue) new-pair)
            (set-rear-ptr! queue new-pair)
            queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue) (error "DELETE! called with an empty queue" queue))
        (else
          (set-front-ptr! queue (cdr (front-ptr queue)))
          queue))) ;; 书上少了一个 )

(define q1 (make-queue))

(displayln
  (insert-queue! q1 'a))

(displayln
  (insert-queue! q1 'b))

(displayln
  (delete-queue! q1))

(displayln
  (delete-queue! q1))

(displayln
  (empty-queue? q1))

(define (print-queue queue)
  (display "PRINT FOR :")
  (displayln queue)
  (foreach
    (lambda (item)
      (begin
        (display item)
        (display " ")))
    (front-ptr queue)))

(define q2 (make-queue))

(print-queue q2)
(print-queue q1)
