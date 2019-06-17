# 习题 2.7

参见 [interval.rkt](./interval.rkt)

# 习题 2.8 

参见 [interval.rkt](./interval.rkt)

# 习题 2.9 

``` bash
设有区间 [a1, a2] [b1, b2]

则它们的和为 sum = [a1+b1, a2+b2]
它们的差为   sub = [a1-b2, a2-b1]

根据宽度的定义可知:

sum 的宽度 sum-width = (a2 - a1 + b2 - b1) / 2
sub 的宽度 sub-width = (a2 - a1 + b2 - b1) / 2

而被加或者被减的区间 [a1, a2] 宽度为 (a2 - a1) / 2，令其为 W

设另外一个区间的宽度为 Offset, 显然 Offset = (b2 - b1) / 2


则 sum 的宽度可以表示为 sum-width = W + (b2 - b1) / 2 = W + Offset 

即有函数 sum-width(W, Offset) = W + Offset，题目得证

特别的，对于乘法和除法来说，如果相应区间有正有负，其表现形式根相应区间全为正是不一样的，不能简单的表示为函数关系。
```

# 习题 2.10 

如在 [2, 3] / [-1, 1] 中，可能会出现 2 / 0 的情况。

参见 [interval.rkt](./interval.rkt) 中 `div-interval` 的实现


# 习题 2.11 

（目前的想法是判断所有的端点可能，从而返回对应的 p1 p2 p3 p4，有点懒 这题先鸽着）

# 习题 2.12 

参见 [interval.rkt](./interval.rkt) 中 `div-interval` 的实现

# 习题 2.13 

``` bash 
假设所有的情况下区间端点都是正数,

有区间 A = [a1, a2] 和 B = [b1, b2]

那么AB乘积 C = A * B = [a1 * b1, a2 * b2]

将其换为误差表示则为

C = (a1*b1 + a2*b2) / 2,  1 - 2 * (a1*b1) / (a1*b1 + a2*b2)
A = (a1 + a2) / 2,   1 - 2 * a1 / (a1 + a2)
B = (b1 + b2) / 2,   1 - 2 * b1 / (b1 + b2)

PC = (a2b2 - a1b1) / (a1b1 + a2b2)
PA = (a2 - a1) / (a1 + a2)
PB = (b2 - b1) / (b1 + b2)

因此 PA + PB = 2(a2b2 - a1b1) / ( a1b1 + a2b2 + a1b2 + a2b1 )

因为 PA 和 PB 很小，因此可以认为 a1b1 + a2b2 = a1b2 + a2b1 

所以 PA + PB ≈ (a2b2 - a1b1) / (a1b2 + a2b2) = PC

即在误差很小的情况下，可以认为 PC = PA + PB 

```

# 习题 2.15 

她说得对。

可以思考一个简单的情况：

``` scheme
(define A (make-interval 3 4))


(print-interval A) ;; A 
;; [3,4]

(newline)

(print-interval
    (sub-interval (add-interval A A) A)) ;; A
;; [2,5] 
```

因为区间计算的特殊性导致 A + A - A 得到了 `[2,5]` 的结果，可以看出，区间计算本身会让范围变大，而次数越多，对结果影响次数越多，故使范围越来越广，因而不确定性的变量越少对于结果而言越“紧”，也即越好。



# 习题 2.16 （警告：这个问题非常难）

书里说：**警告：这个问题非常难** 。。。 

先鸽着，根据 2.15 的说辞，应该对用户输入的表达式进行化简，消去非确定性的变量。

（暂时没搞定。。好难啊）
