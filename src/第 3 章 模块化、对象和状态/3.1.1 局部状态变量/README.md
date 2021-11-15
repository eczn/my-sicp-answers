# 3.1.1 局部状态变量

介绍了可变的环境, 介绍了利用 set! 来做赋值

``` scheme
(set! <name> <new-value>)
```

# 习题 3.1

见 `./make-accumulator.rkt`


# 习题 3.2

见 `./make-monitored.rkt`

# 习题 3.3 

根据前题 3.2 的思想，我们可以构造一个拦截器先检查密码再去调用 account

见 `./make-account-2.rkt`

# 习题 3.4

3.3 中我们的做法不完美, 更完善的做法是提供某种 callback 参数让 fn-auth 更方便

见 `./make-account-3.rkt`
