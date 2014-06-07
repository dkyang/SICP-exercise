#lang planet neil/sicp

(define (square x) (* x x))

(define (square-list-1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))
(square-list-1 (list 1 2 3 4))
; 通过如下过程来解释顺序相反的原因，以(list 1 2 3)为例
; things = (list 1 2 3)    answer = nil
; things = (list 2 3)      answer = (list 1)
; things = (list 3)        answer = (list 4 1)
; things = nil             answer = (list 9 4 1)
; 其中每个步骤new-answer = (cons 当前元素平方 old-answer)
; 可见顺序与需要相反

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))
(square-list-2 (list 1 2 3 4))
; 对于这种写法，考虑iter的第一层递归，会将answer = (cons nil 1)传入
; 第二层递归，此时结果肯定不正确

