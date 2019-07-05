#lang sicp

;; 这个 reverse 跟 2.18 中一样
(define (reverse list)
    (define (iter items result)
        (if (null? items)
            result

            (iter
                (cdr items)
                (cons (car items) result))))
    (iter list nil))

(define (map proc items)
    (if (null? items)
        nil
        (cons (proc (car items))
              (map proc (cdr items)))))


(define (deep-reverse list)
    (map
        ;; 对子元素进行 deep-reverse 
        (lambda (sub-list)
            (if (pair? sub-list)
                (deep-reverse sub-list)
                sub-list))
        ;; 先进行 skin reverse
        (reverse list)))

;; from https://sicp.readthedocs.io/en/latest/chp2/27.html
(define (tree-reverse lst)
    (define (iter remained-items result)
        (if (null? remained-items)
            result
            (iter (cdr remained-items)
                  (cons (if (pair? (car remained-items))
                            (tree-reverse (car remained-items))
                            (car remained-items))
                        result))))
    (iter lst '()))

(display
    (deep-reverse
        (list (list 1 2) (list 3 4) (list 5 6))))

(newline)

(display
    (tree-reverse
    (list (list 1 2) (list 3 4) (list 5 6))))


