
# 2.3.2 符号求导

书上介绍了符号求导的思路:

1. 观察符号求导的数学规则, 提炼出关键的几个工具函数
2. 设计了一种基于 scheme 符号来表达算式
3. 综合 1 和 2 设计出 drive 这样的过程来做求导 (针对加法和乘法组合的多项式)
4. 进一步介绍了 `(0*x + 1*y)` 类似这样的情况要怎么做优化, 然而化简是没有固定规则的, 在文章中的情况可能是最简的, 但是在其他地方可能就不是最简的了, 有些场景 0 还是得留下的, 如在一些二维向量空间的应用中确实有 0x 的情况。
5. 习题...


# 习题 2.56

这题主要是让前文的 drive 支持对幂的求导，按照文章前面的思路，对幂的求导应该需要:

1. exponentiation?
2. base
3. exponent
4. make-exponentiation

最后利用这四个基本函数来在 drive 中加一个分支以实现对幂的求导

详情见 `./drive-exp.rkt`


# 习题 2.57

修改表示法就好了

``` scheme
; 取出被加數
(define (augend s)
    (define cdddrs (cdddr s))
    (if (eq? cdddrs (list))
        (caddr s)
        (cons '+ (cddr s))))

; 取被乘数
(define (multiplicand s)
    (define cdddrs (cdddr s))
    (if (eq? cdddrs (list))
        (caddr s)
        (cons '* (cddr s))) )
```

详情见 `./drive-more-args.rkt`

# 习题 2.58

## a)

需要解析中缀的情况, 第一小题这里是假设 + 和 * 总是取两个参数并且补全了括号的情况
这种情况比较简单, 直接基于 `./drive.rkt` 并修改其中的几个基础定义即可, deriv 根本不用改

详见 `./drive-middle-1.rkt`

## b)

这里要在 `./drive-middle-1.rkt` 基础上, 考虑 + 和 * 的优先级 & 个数了

见 `./drive-middle-2.rkt`
