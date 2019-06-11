
# 习题 1.35 

变换 x => 1+1/x 对应函数 f(x) = 1 + 1/x，根据不动点定义得到等式：
f(x) = x

化简得方程 x^2 - x - 1 = 0

此方程其中一个解为黄金分割率 (1+√5)/2

近似值计算方式见 [fixed-point.rkt](./fixed-point.rkt)


# 习题 1.36 

此处的计算需要化简一下 x^x = 1000

``` bash
     x^x = 1000
       x = logx(1000)         利用 log 定义
       x = log(1000)/log(x)   利用换底公式

    令 y = 

    平均阻尼的变换：
     y + y = (log(1000)/log(x)) + (log(1000)/log(x))
    
    最后化简为:
       y = (1/2) * ( log(1000000)/log(x) )
```



可以看到，最后结果跟题目给的 x -> log(1000)/log(x) 一样

也可以看到，这里就是一个求不动点的定义，因此可以直接用 fixed-point 求出结果。 详见 [fixed-point-2.rkt](./fixed-point-2.rkt)


# 习题 1.37

参见 [cont-frac.rkt](./cont-frac.rkt)

说一句：**黄金分割比的倒数为其自身 -  1**


# 习题 1.38 

参见 [cont-frac.rkt](./cont-frac.rkt)


# 习题 1.39 

参见 [cont-frac.rkt](./cont-frac.rkt)

不过，幂运算容易溢出，因此 k 稍微大一点就会溢出了。
