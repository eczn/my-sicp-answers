<img align="right" src="images/sicp-cover.jpg">

# MY SICP ANSWERS

SICP 全称计算机程序的构造和解释，书上主要介绍了程序如何构造，以及程序是如何运行的，全书分 5 章，各章有不同的主题。

我的 SICP 习题册, 有些难的可能还没写出来 ^ ^ ，还要再推敲推敲, 本册子也可能随时弃坑。。。

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

{{contents}}

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

 