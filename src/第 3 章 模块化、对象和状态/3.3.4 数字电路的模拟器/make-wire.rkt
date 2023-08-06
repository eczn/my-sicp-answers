; #lang sicp
; (#%require "../../../main-lib/main.rkt")

; (define (call-each procedures)
;   (if (null? procedures)
;       'done
;       (begin
;         ((car procedures))
;         (call-each (cdr procedures)))))

; (define (make-wire)
;   (let ((signal-value 0) (action-procedures '()))
;     (define (set-my-signal! new-value)
;       (if (not (= signal-value new-value))
;           (begin (set! signal-value new-value)
;                  (call-each action-procedures))
;           'done))
    
;     (define (accept-action-procedure! proc)
;       (set! action-procedures (cons proc action-procedures))
;       (proc))
    
;     (define (dispatch m)
;       (cond ( (eq? m 'get-signal) signal-value )
;             ( (eq? m 'set-signal!) set-my-signal! )
;             ( (eq? m 'add-action!) accept-action-procedure! )
;             ( else (error "unknown operation -- WIRE" m))))
;     dispatch))


