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
    (assert (question Cyberpunk? 1) (answers "Yes: I love that Billy Idol album." "Maybe: Can I get the geek without the bleak?" "No: I get enough \"cyber punks\" on Facebook."))
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
    (assert (question Gritty Noir, Neo-Victorian or Samurai? 3) (answers "Noir" "Funny hats please" "Samurai"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule readyToBlast
    ?d <-(previousQuestion Cyberpunk?)
    (Cyberpunk? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Ready to blast into space? 1) (answers "Yes: The stars are my destination. [Can't believe they left that one off.]" "Maybe: Let's just stay close. I'm new at this." "No: I like to keep my feet on the ground."))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule warBuff
    ?d <-(previousQuestion ReadyToBlastIntoSpace?)
    (ReadyToBlastIntoSpace? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question War Buff? 1) (answers "Yes: I watch the military channel exclusively." "Maybe: But what I'm really after is exploring the galaxy." "No: But I'm interested in first contact."))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule whatKindOfAliens
    ?d <-(previousQuestion WarBuff?)
    (WarBuff? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question What kind of aliens would you like? 5) (answers "Hostile" "Absent" "Peaceful" "Fatherly" "Prodigious Breeders"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule aGalaxyFarFar
    ?d <-(previousQuestion WarBuff?)
    (WarBuff? Maybe: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question A galaxy far, far away? 1) (answers "Yes: Preferably long ago, as well." "No: I see what you did there."))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule areYouHavingALaugh
    ?d <-(previousQuestion AGalaxyFar,FarAway?)
    (AGalaxyFar,FarAway? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Are you having a laugh? 1) (answers "Yes: Comedy is in my blood." "Maybe: I don't mind a few chuckles between explosions." "No: I do not have a sense of humor that I'm aware of."))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule kindOfProfessorial
    ?d <-(previousQuestion AreYouHavingALaugh?)
    (AreYouHavingALaugh? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Kind of professorial aren't we? 1) (answers "Yes: I'm a scholarly adventurer." "No: I just like my action intense."))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule whatAreYouStudying
    ?d <-(previousQuestion KindOfProfessorialAren'tWe?)
    (KindOfProfessorialAren'tWe? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question What are you studying? 3) (answers "History" "Engineering" "Information Technology"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule whoShallWeFight
    ?d <-(previousQuestion WarBuff?)
    (WarBuff? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Who shall we fight? 6) (answers "Man vs. Bugs" "Man vs. Far Away Bugs" "Man vs. Alien" "Spiritual vs. Colonial" "Human vs. Human" "Everyone"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule dontYouMeanUnder
    ?d <-(previousQuestion ReadyToBlastIntoSpace?)
    (ReadyToBlastIntoSpace? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Don't you mean under the ground? 1) (answers "Yes: Give me some subterranean action." "No: I said on, smart guy."))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule wetOrDry
    ?d <-(previousQuestion Don'tYouMeanUnderTheGround?)
    (Don'tYouMeanUnderTheGround? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Wet or dry? 2) (answers "Underground" "Under water"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule politicsReligion
    ?d <-(previousQuestion Don'tYouMeanUnderTheGround?)
    (Don'tYouMeanUnderTheGround? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Politics, Religion, or Philosophy? 1) (answers "Read my lips..." "Tell me the good word." "I think, therefore I am." "No: These things aren't polite to talk about in company. Don't you guys write about time travel or something?"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule whatsYourInterest
    ?d <-(previousQuestion Politics,Religion,OrPhilosophy?)
    (Politics,Religion,OrPhilosophy? Read my lips...)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question What's your interest? 2) (answers "Feminism" "Communism"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule pickYourPoison
    ?d <-(previousQuestion Politics,Religion,OrPhilosophy?)
    (Politics,Religion,OrPhilosophy? Tell me the good word.)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Pick your poison? 2) (answers "Catholicism" "Humanism"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule sureDoModern
    ?d <-(previousQuestion Politics,Religion,OrPhilosophy?)
    (Politics,Religion,OrPhilosophy? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Sure do. Modern or classic? 2) (answers "Modern" "Classic" "No: All right, all right... I'm a bit out of my comfort zone. Got a nice mystery or a thriller?"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule mysteryOrThriller
    ?d <-(previousQuestion SureDo.ModernOrClassic?)
    (SureDo.ModernOrClassic? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Mystery or thriller? 2) (answers "Mystery" "Thriller"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)








;---------------------------------------------------------------------------------------------------------------------------------------------------------------

(defrule areYouGoingTo
    (WhereShouldIStart? Fantasy: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Are going to be upset when you don't find Harry Potter? 1) (answers yes no maybe))
    (retract ?y)
    (retract ?b)
)