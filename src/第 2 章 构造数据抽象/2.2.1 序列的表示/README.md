# 习题 2.17 

参见 [list.rkt](./list.rkt) 

# 习题 2.18

参见 [list.rkt](./list.rkt) 

# 习题 2.19 

参见 [cc.rkt](./cc.rkt) 

# 习题 2.20 

参见 [same-parity.rkt](./same-parity.rkt)

# 习题 2.21 

参见 [square-list.rkt](./square-list.rkt) 

# 习题 2.22 

因为：

> answer[k] = (cons (square (car things)) answer[k-1])

导致其每次改进后的 answer 都在前一次之前：`(answer[k] answer[k-1] ... answer[0])`

因此是相反的，如果改变代码中 `cons` 参数的顺序将会得到一个诡异的结果：

> ((((() . 1) . 4) . 9) . 16) . ...)


# 习题 2.23 

见 [for-each.rkt](./for-each.rkt) 


