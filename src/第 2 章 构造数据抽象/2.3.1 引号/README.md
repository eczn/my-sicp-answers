# 习题 2.53

见 [./test.rkt](./test.rkt)

# 习题 2.54

见 [./my-equal.rkt](./my-equal.rkt)

# 习题 2.55

见 [./print-quote.rkt](./print-quote.rkt)

scheme 底层将 `'a` 翻译为 `(quote a)` 因此 ''a 其实就是 `'(quote a)` 然后这样的表达式就可以得到 `quote` 了:

``` scheme
(car ''a)
; =>
(car '(quote a))
; =>
quote
```

从此题可以看到 `'xxx` 只是 `(quote xxx)` 的语法糖.
