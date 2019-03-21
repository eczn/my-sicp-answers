# 习题 1.34 

假定我们定义了：

``` scheme
(define (f g)
    (g 2))
```

而后就有：

``` scheme 
(f square)
;; 结果是 4

(f (lambda (z) (* z (+ z 1))))
;; 结果是 6
```

如果我们（坚持）要求解释器去求值 `(f f)`，那会发生什么情况呢？请给出解释。

------

答：代码在 [f.rkt](./f.rkt) 中，执行它会报错 

``` bash
$ racket "./f.rkt"
application: not a procedure;
 expected a procedure that can be applied to arguments
  given: 2
  arguments...:
   2
```

原因显而易见，执行 (f f) 根据代换模型可以得到： 

``` scheme 
(f f) 
;; => 这里调用 f，此时我们吧 f 绑定到 g 上，于是有下面这个
(f 2)
;; => 这里继续调用了 f，此时再把 2 绑定到内层代换的 g 上就可以得到下面这个
(2 2)
;; => 很显然，这里吧 2 当成过程来调用了，会报错 Error !
```
