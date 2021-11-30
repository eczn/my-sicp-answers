#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (make-queue)
  (define front-ptr '() )
  (define rear-ptr '() )

  (define (set-front-ptr! item) (set! front-ptr item))
  (define (set-rear-ptr! item) (set! rear-ptr item))

  (define (empty-queue?) (null? front-ptr))

  (define (front-queue)
    (if (empty-queue?)
      (error "FRONT called with an empty queue" (cons front-ptr rear-ptr))
      (car front-ptr)))

  (define (insert-queue! item)
    (let ((new-pair (cons item '())))
      (cond ((empty-queue?)
              (set-front-ptr! new-pair)
              (set-rear-ptr! new-pair)
              (cons front-ptr rear-ptr) )
            (else
              (set-cdr! rear-ptr new-pair)
              (set-rear-ptr! new-pair)
              (cons front-ptr rear-ptr)))))

  (define (delete-queue!)
    (cond ((empty-queue?) (error "DELETE! called with an empty queue" (cons front-ptr rear-ptr)))
          (else
            (set-front-ptr! (cdr front-ptr))
            (cons front-ptr rear-ptr))))

  (define (print-queue)
    (display "PRINT FOR :")
    (displayln (cons front-ptr rear-ptr))
    (foreach
      (lambda (item)
        (begin
          (display item)
          (display " ")))
      front-ptr )
    (display "\n")
  )

  (define (dispatch m)
    (cond ((eq? m 'empty-queue?)  empty-queue?)
          ((eq? m 'front-queue)   front-queue )
          ((eq? m 'insert-queue!) insert-queue!)
          ((eq? m 'delete-queue!) delete-queue!)
          ((eq? m 'print-queue)   print-queue)
          (else (error "unknown operation -- QUEUE")) ))

  dispatch
)

(define q1 (make-queue))

(displayln
  ((q1 'empty-queue?)) )

(displayln
  ((q1 'insert-queue!) 'a) )

(displayln
  ((q1 'empty-queue?)) )

(displayln
  ((q1 'insert-queue!) 'b) )

(displayln
  ((q1 'insert-queue!) 'c) )

(displayln
  ((q1 'insert-queue!) 'd) )

((q1 'print-queue))

(displayln "---")

(displayln
  ((q1 'delete-queue!)) )

(displayln
  ((q1 'delete-queue!)) )

(displayln
  ((q1 'delete-queue!)) )

(displayln
  ((q1 'delete-queue!)) )
