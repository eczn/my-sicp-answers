> 3.2.1 求值规则

本节没有习题，但说明了 “环境” “框架” 这类新概念，其实这些换个说法就是词法作用域那些东西，更深刻地说是求值过程中，对符号的约束规则，即下面代码中，x 究竟为何值的规则：

``` scheme
(define (square x) (* x x))

(define (square-sum a b)
  (+ (square a) (square b)))

(square-sum 3 4)
```

