#lang planet neil/sicp

#|
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40)  
                                                  (remainder 40 (remainder 206 40))))
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40))  (remainder (remainder 206 40)  
                                                                                                                               (remainder 40 (remainder 206 40)))) 
应用序只有4次：
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)

正则序则有很多次（包括if，18次）:
正则代换后,则第n层的a b两个参数对应的remainder的次数分别为a(n), b(n),
则: a(n) = b(n-1);b(n)=a(n-1)+b(n-1)+1;a(0)=0,b(0)=0
总共5层,由于每层的if判断进行了计算,再加上最后一层的a是计算了的,所以最后的结果是:b(0)+b(1)+b(2)+b(3)+b(4)+a(4)=18
|#



