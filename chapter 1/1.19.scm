#lang planet neil/sicp

; O(log n)复杂度计算fibonacci数列

#| 通过代换可以得到：
a2 = b(2pq + q^2) + a(q^2 + 2pq) + a(p^2 + a^2)
b2 = b(p^2 + q^2) + a(q^2 + 2pq)
因此p' = p^2 +ｑ^２，　ｑ' = q^2 + 2pq
这实际上是一种变换T，所以fib(n)实际上就是T^n，类比指数的计算，
可得到题目中的迭代算法，可以看到形式上与指数迭代计算的程序很相似。
|#

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* q q) (* p p))
                   (+ (* q q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q)
                           (* a q)
                           (* a p))
                        (+ (* b p) 
                           (* a q))
                        p
                        q
                        (- count 1)))))

(fib 6)