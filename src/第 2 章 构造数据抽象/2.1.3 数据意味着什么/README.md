# 习题 2.4 

`cdr` 定义如下：

``` scheme
(define (cdr z)
    (z (lambda (p q) q)))
```

代换模型证明 (car cons (x y)) 总是等于 x： 

``` bash
   (car cons (x y))
=> (car (lambda (m) (m x y)))
=> ((lambda (m) (m x y)) (lambda (p q) p))
=> ((lambda (p q) p) x y)
=> x
```

# 习题 2.5

见 [cons-2.rkt](./cons-2.rkt)


# 习题 2.6 

利用代换模型计算 `(add-1 zero)` 和 `(add-1 (add-1 zero))` 得出 `one` 和 `two` 的定义: 

``` scheme
(define one
    (lambda (f) (lambda (x) (f x))))

(define two
    (lambda (f) (lambda (x) (f (f x) ))))
```

见 [church.rkt](./church.rkt)


**（有趣的设定）**


``` scheme 
(define (add a b)
    (lambda (f)
        (lambda (x)
            ((a f) ((b f) x)) )))

;; 利用 inc 将 Church 退化为数学上的正整数，比如以下表达式结果是 1 
((one inc) 0)

;; 验证 add 是否正确 （如果正确，则结果应该是 3）
(define three (add one two))
((three inc) 0)
```

# 对 Church Number 的定义的思考

Church Number 这种计数的手段是利用函数的调用次数来定义非负整数：

1. 将 0 定义为 f => x
2. 将 1 定义为 f => f(x)
3. 将 2 定义为 f => f(f(x)) 
4. .... 以此类推

在 [church.rkt](./church.rkt) 种中 `add-1` 是该计数方式从 k-1 到 k 的递推公式。
而 `add` 完成了这种计数方式的加法，比如 `(add one one)` 应该为 `two` (one 和 two 是 Church 数的 1 和 2)

