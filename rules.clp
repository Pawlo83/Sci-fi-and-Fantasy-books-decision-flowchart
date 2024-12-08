(defrule start
    ?x <- (token start)
    ?y <- (question)
    ?b <- (answers)
    ?d <-(previousQuestion)
    =>
    (assert (question Where should I start? 1) (answers "Fantasy:" "I pretty much live in a fantasy land already." "Scifi:" "Fly me to the moon."))
    (retract ?x)
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule reset_question
    ?y <- (question $?x)
    ?b <- (answers $?a)
    ?d <- (token ask)
    =>
    (retract ?y)
    (retract ?b)
    (retract ?d)
    (assert (question) (answers))
)


(defrule cyberpunk
    ?d <-(previousQuestion WhereShouldIStart?)
    (WhereShouldIStart? Scifi: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Cyberpunk? 2) (answers "Yes:" "I love that Billy Idol album." "No:" "I get enough \"cyber punks\" on Facebook." "Maybe:" "Can I get the geek without the bleak?"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule grittyNoir
    ?d <-(previousQuestion Cyberpunk?)
    (Cyberpunk? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Gritty Noir, Neo-Victorian or Samurai? 3) (answers "Funny hats please" "Noir" "Samurai"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)







(defrule areYouGoingTo
    (WhereShouldIStart? Fantasy: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Are going to be upset when you don't find Harry Potter? 1) (answers yes no maybe))
    (retract ?y)
    (retract ?b)
)