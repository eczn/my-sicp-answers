#lang sicp

(define (cube x) (* x x x))

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (sum-cubes a b)
    (sum cube a inc b))

(define (identity x) x)

(define (sum-integers a b)
    (sum identity a inc b))


(define (pi-sum a b)
    (define (pi-term x)
        (/ 1.0 (* x (+ x 2))))
    (define (pi-next x)
        (+ x 4))
    (sum pi-term a pi-next b))


(define (integral f a b dx)
    (define (add-dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (even? n)
    (= (remainder n 2) 0))


; (y-before 0)
; (y-before 1)
; (y-before 2)
; (y-before 3)

; (display "...\n")
; (y-before 98)
; (y-before 99)
; (y-before 100)


(define (integral-simpson f a b n)
    (define h (/ (- b a) n))
    
    (define (yk k)
        (f (+ a
            (* k h))))

    (define (y-before nth)
        (cond ((= nth 0) 1)
            ((= nth 100) 1)
            ((even? nth) 2)
            (else 4) ))

    (define (sum-all-iter k accumulate)
        (if (> k n)
            accumulate
            (sum-all-iter
                (+ k 1)
                (+ accumulate
                    (* (y-before k)
                        (yk k))))))
    (* (/ h 3)
        (sum-all-iter 0 0)))


(integral cube 0 1 0.01)
;; 0.24998750000000042

(integral cube 0 1 0.001)
;; 0.249999875000001

(integral-simpson cube 0 1.0 100)
;; => 0.25000000000000006

(integral-simpson cube 0 1.0 1000)
;; => 0.250333

