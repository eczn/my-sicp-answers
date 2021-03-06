> 因为 Racket SICP 包里的 `runtime` 函数返回的时间是以秒为更新的（在一秒内调用返回的值一样，单位是毫秒）
因此这里有坑，我用很大的数来让程序执行时间达到十几秒，以此减少误差（原题目里的基本上的出来的值是 0 和 1 秒）

# 习题 1.22

详见 [search-for-primes.rkt](./search-for-primes.rkt) 输出结果如下：

``` bash
> racket ./search-for-primes.rkt
100000000003 *** 4980
100000000019 *** 5997
100000000057 *** 4998
"三个"

1000000000039 *** 15976
1000000000061 *** 15989
1000000000063 *** 16008
"三个"

10000000000037 *** 54986
10000000000051 *** 56981
10000000000099 *** 51984
"三个"

```

各个段的素数判断所花时间并不是严格按照根号10(约等于3.1)的倍率递增的，有点出入（不过挺靠近的）。


# 习题 1.23 

好吧，这是一系列递进的题，先做着先，看看怎么说。

详见 [search-for-primes-2.rkt](./search-for-primes-2.rkt) 结果输出：

``` bash
> racket ./search-for-primes-2.rkt
100000000003 *** 1997
100000000019 *** 2998
100000000057 *** 2999
"三个"

1000000000039 *** 7978
1000000000061 *** 8012
1000000000063 *** 8008
"三个"

10000000000037 *** 26967
10000000000051 *** 30981
10000000000099 *** 25985
"三个"
```

> 跟题目里预言的一致，倍率接近 2，但有点误差，有点出入。


# 习题 1.24 

我这里做不了， fast-prime 里 random 要求整数的范围是 4294967087

看了别人的解答，跟 1.23 大同小异的结论。 


# 1-22 ~ 1-24 中关于时间复杂度的思考

程序实际执行的时间复杂度里推导出来的算法花费的时间并不一致。可以确定的是：

1. 操作系统刚好碰到进程时间分片，然后顿一下
2. 解释器可能自己有优化、或者执行环境不一样造成的速度差异 
3. 可以看到上面题目里的种种优化都在使得整体速度不断变快，时间复杂度预言了一个算法在特定输入下大致花费的时间，在输入规模较小的时候，所化时间可能差不多，但输入规模变大的时候，时间差就会越来越凸显了（对应时间复杂度函数值差）


# 习题 1.25 

expmod 里每次都很会 remainder 哦，而 fast-expt 里不会，因此如果规模较大的情况下，fast-expt 可能会溢出，速度也会慢些
而 exmod 里会产生类似这样的一条递归计算链:

``` bash 
(remainder (square (remainder (squre ....)))
```

其中的 `....` 到最简形式很可能是 (remainder (squre base) m) 这样，这样外围的 square 参数会被限制在 `[0, m)` 这个范围内，挺好的，fast-expt 这里做不到，很容易溢出哦。


# 习题 1.26 

Scheme 采用的是应用序，如果有表达式 `(+ a b)` 那么 a 和 b 都会执行一次，因此 Louis 写的代码那边会跑两次递归，会多出很多无用步骤。

