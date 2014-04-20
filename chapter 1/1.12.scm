; 待增加迭代版本

#lang planet neil/sicp

(define (pascal a b)
  (cond ((or (= b 1) (= a b)) 1)
        (else (+ (pascal (- a 1) (- b 1))
                 (pascal (- a 1) b)))))

(pascal 4 2)
(pascal 5 1)
(pascal 5 2)
(pascal 5 3)
(pascal 5 4)
(pascal 5 5)
