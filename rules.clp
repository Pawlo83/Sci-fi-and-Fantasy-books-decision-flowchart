(defrule start
    ?x <- (token start)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question What genre?) (answers scifi fantasy))
    (retract ?x)
    (retract ?y)
    (retract ?b)
)

(defrule reset_question
    ?y <- (question $?x)
    ?b <- (answers $?a)
    ?d <- (token ask)
    =>
    (assert (question) (answers))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule scifi
    (WhatGenre? scifi)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Cyberpunk?) (answers yes no maybe))
    (retract ?y)
    (retract ?b)
)

(defrule scifi
    (WhatGenre? scifi)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Cyberpunk?) (answers yes no maybe))
    (retract ?y)
    (retract ?b)
)

(defrule fantasy
    (WhatGenre? fantasy)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Are going to be upset when you don't find Harry Potter?) (answers yes no maybe))
    (retract ?y)
    (retract ?b)
)
