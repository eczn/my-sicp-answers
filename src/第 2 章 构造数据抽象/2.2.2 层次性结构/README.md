# 习题 2.24

这表达式对应: `(1 (2 (3 4)))`

盒子：

``` bash                            
(1 (2 (3 4)))  ->  □□ -> □□ -> □□ -> □■ 
                   |     |     |     |  
                   1     2     3     4  
```

树：

``` bash
    (1 (2 (3 4)))
    /         \
   1       (2 (3 4))
           /      \
          2      (3 4)
                 /   \
                3     4
```

# 习题 2.25

``` scheme
(define the-first
    (list 1 3 (list 5 7) 9))

(car (cdr (car (cdr (cdr the-first)))))

(define the-second
    (list (list 7)))

(car (car the-second))


(define the-third
    (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 (list 7))))))))

(car 
    (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr the-third)))))))))))))
;; 嗯...
```

# 习题 2.26

``` scheme
(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y)
;; => (list 1 2 3 4 5 6)

(cons x y)
;; => (cons (list 1 2 3) (list 4 5 6))

(list x y)
;; => (list (list 1 2 3) (list 4 5 6))
```

# 习题 2.27

见 [deep-reverse.rkt](./deep-reverse.rkt) 

<s>可以比较一下 `tree-reverse` 和鄙人的 `deep-reverse`</s>

# 习题 2.28

见 [fringe.rkt](./fringe.rkt)

# 习题 2.29

见 [mobile.rkt](./mobile.rkt)

---

d) 如果采用 `cons` 取代 `list` 来构造 `mobile` 和 `branch`, 只需修改 `right-branch` 即可:

``` scheme
; (define (right-branch mobile)
;    (car (cdr mobile)))
(define (right-branch mobile)
    (cdr mobile))
```

# 习题 2.30

见 [square-tree.rkt](./square-tree.rkt)


# 习题 2.31

见 [tree-map.rkt](./tree-map.rkt)


# 习题 2.32 

见 [subsets.rkt](./subsets.rkt) 这题太仙了：

可以观察一下下面这些

``` scheme
(display
    (subsets (list 1 2 3)))
(newline)

(display
    (subsets (list 2 3)))
(newline)

(display
    (subsets (list 3)))
(newline)

(newline)

(display
    (cons 1 (list 2 3))) ;; it equals to (list 1 2 3)
(newline)
```

就不难写出 [subsets.rkt](./subsets.rkt) 里的 `lambda` 了。
