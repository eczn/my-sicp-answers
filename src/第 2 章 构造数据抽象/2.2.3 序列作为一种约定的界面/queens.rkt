#lang sicp

(#%require "../../../main-lib/main.rkt")

;; 单点坐标 (皇后的坐标)
(define (position x y) (cons x y))

;; 单点坐标判断 (皇后判断)
(define (position-safe? l r)
    ;; x y 轴
    (define L? (= (car l) (car r)))
    (define R? (= (cdr l) (cdr r)))
    ;; 对角线
    (define X? (= (abs (- (car l) (car r))) (abs (- (cdr l) (cdr r)))))
    ;; 判断
    (if (and L? R?)
        true  ;; 如果是同一个点，我们认为是安全的
        (if (or X? L? R?)
            false
            true)  ))

;; 判断 positions 皇后跟其他是否都安全
(define (safe? k positions)
    ; (display k)
    ; (display positions)
    ; (display "\naaaa\n")
    ; (display "")
    (define PK (list-ref positions (- k 1)))
    (accumulate
        (lambda (l r) (and l r))
        true
        (map (lambda (p) (position-safe? p PK)) positions) ))

;; 1~8 1 nil
(define (adjoin-position new-row k rest-of-queens)
    (if (null? rest-of-queens)
        (list (position new-row k))
        (append rest-of-queens (list (position new-row k)) )))

(define (log x)
    (display x)
    (display "\n")
    x)

(define (queens board-size)
    (define empty-board nil)
    
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            
            (filter
                (lambda (positions)
                    ; log debug
                    ; (display k)
                    ; (display " ")
                    ; (display positions)
                    ; (display " ")
                    ; (display (safe? k positions))
                    ; (display "\n")
                    (safe? k positions) )
                (flatmap
                    (lambda (rest-of-queens)
                        (map (lambda (new-row)
                                (adjoin-position new-row k rest-of-queens))
                            (enumerate-interval 1 board-size))  )
                    (queen-cols (- k 1)) ))))
    (queen-cols board-size))

(define res (queens 8))

(for-each
    (lambda (r)
        (display r)
        (display "\n"))
    res)

; (list 
;     (list ...POINTS)
;     (list ...POINTS)
; )
