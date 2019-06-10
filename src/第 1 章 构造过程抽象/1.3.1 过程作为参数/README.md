# 习题 1.29

详见 [sum.rkt]('./sum.rkt') 中的 `integral-simpson` 结果输出：

``` scheme
(integral cube 0 1 0.01)
;; 0.24998750000000042

(integral cube 0 1 0.001)
;; 0.249999875000001

(integral-simpson cube 0 1.0 100)
;; => 0.25000000000000006

(integral-simpson cube 0 1.0 1000)
;; => 0.250333
```

n 增大之后，精度反而不准了。


# 习题 1.30 

参见 [sum-iter.rkt]('./sum-iter.rkt') : 

``` scheme
(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter 
                (inc a)
                (+ result (term a)))))
    (iter a 0))
```

# 习题 1.31 

参见 [product.rkt]('./product.rkt')


# 习题 1.32 

参见 [accumulate]('./accumulate.rkt')


# 习题 1.33 

参见 [filtered-accumulate]('./filtered-accumulate.rkt')

