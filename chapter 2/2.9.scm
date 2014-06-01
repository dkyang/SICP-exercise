#lang planet neil/sicp

#|
I1 = (a,b)
I2 = (c,d)
width1 = (a+b)/2
width2 = (c+d)/2

; 两个区间和(差)的宽度是相应区间宽度的函数
I3 = add(I1, I2) = (a+c, b+d)
width3 = (a+c+b+d)/2 = width1 + width2

I4 = sub(I1, I2) = (a-d, b-c)
width4 = (a-d+b-c)/2 = (a+b)/2 - (c+d)/2 = width1 - width2

; 两个区间乘(除)的宽度与相应区间宽度没函数关系
I5 = (a, b)
width5 = (a+b)/2
I6 = (c, d)
width6 = (c+d)/2
假设a，b，c，d都大于0
I7 = multi(I5, I6) = (ac, bd)
width7 = (ac+bd)/2
从上式可见区间乘积的宽度与原区间宽度没有函数关系，
除法由于是与区间倒数相乘，所有情况类似
|#
