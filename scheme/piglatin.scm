(load "simply.scm")

(define (pigl wd)
    (if (member? (first wd) 'aeiou)
        (word wd 'ay)
        (pigl (word (butfirst wd) (first wd)))))

(define (rotate wd)
    (word (butfirst wd) (first wd)))
