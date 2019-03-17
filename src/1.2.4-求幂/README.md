
# 习题 1.16

按照迭代方式来实现前文所写的 fast-expt, 我的实现：[fast-expt-iter.rkt](./fast-expt-iter.rkt)

# 习题 1.17

题目给出了用递归的加法定义的乘法：

``` scheme
(define (* a b)
    (if (= b 0)
        0
        (+ a (* a (- b 1)))))
```

毫无疑问，这样速度会很慢的，因为上述过程的时间复杂度是 O(b) 也就是说计算 3 * 4 需要做 4 次加法才能算出。。。 

就很慢。

题目还给了两个函数 double halve 的定义，并让你做一下优化，也就是你来写个乘法，并且要求乘法能在对数次数内计算完。

``` scheme
(define (double x)
    (+ x x))

(define (halve x)
    (/ x 2))
```

很有意思 233，可以参考我的实现 [recursive-multiply.rkt](./recursive-multiply.rkt)

# 习题 1.18

把 1.17 优化成迭代的写法，减少空间复杂度。[recursive-multiply-iter.rkt](./recursive-multiply-iter.rkt)


# 习题 1.19 

看着好复杂 QAQ 。。。。 有空再看看 

