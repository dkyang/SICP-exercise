#lang planet neil/sicp

#|
会发生错误,因为这样递归调用后会遇到(2 2)，但2并不是一个函数
|#

(define (f g)
  (g 2))

(f f)