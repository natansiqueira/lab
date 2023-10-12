(load "simply.scm")

(define (real-word? wd)
    (not (member? wd '(a the an in of and for to with))))

(define (acronym phrase)
    (accumulate word (every first (keep real-word? phrase))))

(display (real-word? 'a))
(newline)
(display (real-word? 'ant))
(newline)

(display (acronym '(ruby on rails)))
(newline)
(display (acronym '(structure and interpretation of computer programs)))
(newline)
