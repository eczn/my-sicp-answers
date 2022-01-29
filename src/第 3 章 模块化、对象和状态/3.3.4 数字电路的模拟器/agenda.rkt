#lang sicp
(#%require "../../../main-lib/main.rkt")

(define (make-time-segment time queue)
  (cons time queue))

(define (segment-time s) (car s))
(define (segment-queue s) (cdr s))

(define (make-agenda) (list 0))

(define (current-time agenda) (car agenda))

(define (set-current-time! agenda time)
  (set-car! agenda time))

(define (segments agenda) (cdr agenda))

(define (set-segments! agenda segments)
  (set-cdr agenda segments))

(define (first-segment agenda) (car (segments agenda)))

(define (rest-segment agenda) (cdr (segments agenda)))

(define (empty-agenda? agenda)
  (null? (segments agenda)))


