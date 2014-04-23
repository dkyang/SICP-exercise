#lang planet neil/sicp

#|
(square n)只用计算一次n就可以得到值；而Louis显式地将代码展开，需要计算两次n才能得到结果。
这样前者f(n) = f(n/2)，而后者是f(n) = 2f(n/2)，从而可以得到题目中的时间复杂度。
|#

