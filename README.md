<!-- Generated By `npm run make` -->
最近有空补一下 SICP 系统地学习一下 Scheme 以及关于计算的原理。

# MY SICP ANSWERS

SICP 全称计算机程序的构造和解释，额，名字很正，其实书上主要就是讲程序如何构造和程序如何运行的，全书分 5 章，各章有不同的主题。

<center>![SICP-COVER](images/sicp-cover.jpg)</center>

我的 SICP 习题册, 有些难的可能还没写出来 ^ ^ 还要再推敲推敲, 本册子也可能随时弃坑。。。

# 刷题 Checklist

1. 偏数学的习题可以试着解一下，实在弄不来就先跳过（数学差，我恨）
2. 尽量独立得出结果，得出结果后我会去 https://sicp.readthedocs.io/en/latest/index.html 对一下答案看看是否一致 （目前发现几处地方我写的比较简洁 233）
3. 欢迎交流 ♂ 学习

# 使用说明

> We no longer support OS/2, DOS, or Windows.

此外，MIT/Scheme 目前不再支持 windows 了，在这里我用 racket 的 sicp 包来写书上的习题。关于 racket/sicp 可以参考：https://docs.racket-lang.org/sicp-manual/index.html

安装好 Racket 以及 sicp 包之后，还得设置一下系统 path 以确保命令行工具的使用。

全部都搞好以后可以用命令行工具运行本仓库的 `1 + 1` 例子:

``` bash 
$ racket ./1+1.rkt
```


# 目录

## 第 1 章 构造过程抽象 (共 17 题)

### [1.1.6 条件表达式和谓词](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.1.6%20%E6%9D%A1%E4%BB%B6%E8%A1%A8%E8%BE%BE%E5%BC%8F%E5%92%8C%E8%B0%93%E8%AF%8D) 

> [习题 1.3](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.1.6%20%E6%9D%A1%E4%BB%B6%E8%A1%A8%E8%BE%BE%E5%BC%8F%E5%92%8C%E8%B0%93%E8%AF%8D#%E4%B9%A0%E9%A2%98-13)

### [1.2.4 求幂](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.2.4%20%E6%B1%82%E5%B9%82) 

> [习题 1.16](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.2.4%20%E6%B1%82%E5%B9%82#%E4%B9%A0%E9%A2%98-116), [习题 1.17](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.2.4%20%E6%B1%82%E5%B9%82#%E4%B9%A0%E9%A2%98-117), [习题 1.18](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.2.4%20%E6%B1%82%E5%B9%82#%E4%B9%A0%E9%A2%98-118), [习题 1.19](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.2.4%20%E6%B1%82%E5%B9%82#%E4%B9%A0%E9%A2%98-119)

### [1.2.5 最大公约数](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.2.5%20%E6%9C%80%E5%A4%A7%E5%85%AC%E7%BA%A6%E6%95%B0) 

> [习题 1.22](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.2.5%20%E6%9C%80%E5%A4%A7%E5%85%AC%E7%BA%A6%E6%95%B0#%E4%B9%A0%E9%A2%98-122), [习题 1.23](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.2.5%20%E6%9C%80%E5%A4%A7%E5%85%AC%E7%BA%A6%E6%95%B0#%E4%B9%A0%E9%A2%98-123), [习题 1.24](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.2.5%20%E6%9C%80%E5%A4%A7%E5%85%AC%E7%BA%A6%E6%95%B0#%E4%B9%A0%E9%A2%98-124), [1-22 ~ 1-24 中关于时间复杂度的思考](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.2.5%20%E6%9C%80%E5%A4%A7%E5%85%AC%E7%BA%A6%E6%95%B0#1-22-~%201-24%20%E4%B8%AD%E5%85%B3%E4%BA%8E%E6%97%B6%E9%97%B4%E5%A4%8D%E6%9D%82%E5%BA%A6%E7%9A%84%E6%80%9D%E8%80%83), [习题 1.25](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.2.5%20%E6%9C%80%E5%A4%A7%E5%85%AC%E7%BA%A6%E6%95%B0#%E4%B9%A0%E9%A2%98-125), [习题 1.26](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.2.5%20%E6%9C%80%E5%A4%A7%E5%85%AC%E7%BA%A6%E6%95%B0#%E4%B9%A0%E9%A2%98-126)

### [1.3.1 过程作为参数](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.3.1%20%E8%BF%87%E7%A8%8B%E4%BD%9C%E4%B8%BA%E5%8F%82%E6%95%B0) 

> [习题 1.29](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.3.1%20%E8%BF%87%E7%A8%8B%E4%BD%9C%E4%B8%BA%E5%8F%82%E6%95%B0#%E4%B9%A0%E9%A2%98-129), [习题 1.30](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.3.1%20%E8%BF%87%E7%A8%8B%E4%BD%9C%E4%B8%BA%E5%8F%82%E6%95%B0#%E4%B9%A0%E9%A2%98-130), [习题 1.31](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.3.1%20%E8%BF%87%E7%A8%8B%E4%BD%9C%E4%B8%BA%E5%8F%82%E6%95%B0#%E4%B9%A0%E9%A2%98-131), [习题 1.32](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.3.1%20%E8%BF%87%E7%A8%8B%E4%BD%9C%E4%B8%BA%E5%8F%82%E6%95%B0#%E4%B9%A0%E9%A2%98-132), [习题 1.33](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.3.1%20%E8%BF%87%E7%A8%8B%E4%BD%9C%E4%B8%BA%E5%8F%82%E6%95%B0#%E4%B9%A0%E9%A2%98-133)

### [1.3.2 用lambda构造过程](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.3.2%20%E7%94%A8lambda%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B) 

> [习题 1.34](./src/%E7%AC%AC%201%20%E7%AB%A0%20%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B%E6%8A%BD%E8%B1%A1/1.3.2%20%E7%94%A8lambda%E6%9E%84%E9%80%A0%E8%BF%87%E7%A8%8B#%E4%B9%A0%E9%A2%98-134)

# make README.md 

``` bash
$ npm run make 
```

# 如何参与编辑

如果你觉得你习题 x.xx 解法更好，想提 PR，请在习题 x.xx 所在的 README.md 中的 `# 习题 x.xx` 段落之后之后写： 

``` markdown
... 其他内容

# 习题 x.xx
原本的解法

# 习题 x.xx @your_name
你的解法

```

修改完之后，请运行：

``` bash
$ npm i 
$ npm run make 
```

当然，也可以直接提 issues。

# License

MIT

 