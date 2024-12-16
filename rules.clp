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

(defrule recommendationAuthorPath
    ?rec <- (recommendation ?r)
    ?b <- (book (title ?r) (author ?a) (image-path ?p))
    =>
    (assert (recommendation ?r ?a ?p))
    (retract ?rec)
)



;---------------------------------------------------------------------------------------------------------------------------------------------------------------



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

(defrule neuromancer
    (previousQuestion GrittyNoir,Neo-victorianOrSamurai?)
    ?a <- (GrittyNoir,Neo-victorianOrSamurai? $?p Noir $?k)
    =>
    (assert (recommendation "Neuromancer"))
    (retract ?a)
    (assert (GrittyNoir,Neo-victorianOrSamurai? $?p $?k))
)

(defrule theDiamondAge
    (previousQuestion GrittyNoir,Neo-victorianOrSamurai?)
    ?a <- (GrittyNoir,Neo-victorianOrSamurai? $?p Funny hats please $?k)
    =>
    (assert (recommendation "The Diamond Age"))
    (retract ?a)
    (assert (GrittyNoir,Neo-victorianOrSamurai? $?p $?k))
)

(defrule snowCrash
    (previousQuestion GrittyNoir,Neo-victorianOrSamurai?)
    ?a <- (GrittyNoir,Neo-victorianOrSamurai? $?p Samurai $?k)
    =>
    (assert (recommendation "Snow Crash"))
    (retract ?a)
    (assert (GrittyNoir,Neo-victorianOrSamurai? $?p $?k))
)

(defrule cryptonomicon
    ?d <-(previousQuestion Cyberpunk?)
    (Cyberpunk? Maybe: $?dop)
    =>
    (assert (recommendation "Cryptonomicon"))
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

(defrule aSpaceOdyssey
    ?d <-(previousQuestion ReadyToBlastIntoSpace?)
    (ReadyToBlastIntoSpace? Maybe: $?dop)
    =>
    (assert (recommendation "2001: A Space Odyssey"))
    (assert (token next))
    (retract ?d)
)

(defrule whatWouldYouLikeToSeeFrom
    ?d <-(previousQuestion 2001:ASpaceOdyssey?)
    (2001:ASpaceOdyssey? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question What would you like to see from the Red Planet? 3) (answers "Vigetts" "Environmentalism" "Through the looking glass"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule theMartianChronicles
    ?d <-(previousQuestion WhatWouldYouLikeToSeeFromTheRedPlanet?)
    (WhatWouldYouLikeToSeeFromTheRedPlanet? "Vigetts")
    =>
    (assert (recommendation "The Martian Chronicles"))
    (retract ?d)
)

(defrule theMarsTrilogy
    ?d <-(previousQuestion WhatWouldYouLikeToSeeFromTheRedPlanet?)
    (WhatWouldYouLikeToSeeFromTheRedPlanet? "Environmentalism")
    =>
    (assert (recommendation "The Mars Trilogy"))
    (retract ?d)
)

(defrule theSpaceTrilogy
    ?d <-(previousQuestion WhatWouldYouLikeToSeeFromTheRedPlanet?)
    (WhatWouldYouLikeToSeeFromTheRedPlanet? "Environmentalism")
    =>
    (assert (recommendation "The Space Trilogy"))
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
;---------------------------------------------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------------------------------------

(defrule areYouGoingTo
    ?d <-(previousQuestion WhereShouldIStart?)
    (WhereShouldIStart? Fantasy: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Are you going to be upset when you don't find Harry Potter? 1) (answers "Yes: Give me more precocious lads at schools of magic, please." "No: I know where to find him if I need him"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule areYouNewTo
    ?d <-(previousQuestion AreYouGoingToBeUpsetWhenYouDon'tFindHarryPotter?)
    (AreYouGoingToBeUpsetWhenYouDon'tFindHarryPotter? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Are you new to the fantasy genre? 1) (answers "Yes: I am as yet unfamiliar with your tropes. Do your worst." "Maybe: Does the wizard of Oz count?" "No: I'm what you call, experienced"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule wicked
    ?d <-(previousQuestion AreYouNewToTheFantasyGenre?)
    (AreYouNewToTheFantasyGenre? Maybe: $?dop)
    =>
    (assert (recommendation "Wicked"))
    (retract ?d)
)

(defrule likeTheArthurianLegend
    ?d <-(previousQuestion AreYouNewToTheFantasyGenre?)
    (AreYouNewToTheFantasyGenre? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Like the Arthurian Legend? 1) (answers "Yes: I own The Sword and the Stone on DVD and VHS." "No"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule theLordOfTheRings
    ?d <-(previousQuestion AreYouNewToTheFantasyGenre?)
    (AreYouNewToTheFantasyGenre? Yes: $?dop)
    =>
    (assert (recommendation "The Lord Of The Rings"))
    (assert (token next))
    (retract ?d)
)

(defrule silmarillion
    ?d <-(previousQuestion TheLordOfTheRings?)
    (TheLordOfTheRings? No: $?dop)
    ?t <- (token next)
    =>
    (assert (recommendation "The Silmarillion"))
    (retract ?d)
    (retract ?t)
)

(defrule whichCharacter
    ?d <-(previousQuestion LikeTheArthurianLegend?)
    (LikeTheArthurianLegend? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Which character do you like best? 3) (answers "Morgan Le Faye" "Merlin" "Arthur"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule theOnceAndFutureKing
    (previousQuestion WhichCharacterDoYouLikeBest?)
    ?a <- (WhichCharacterDoYouLikeBest? $?p Arthur $?k)
    =>
    (assert (recommendation "The Once and Future King"))
    (retract ?a)
    (assert (WhichCharacterDoYouLikeBest? $?p $?k))
)

(defrule theCrystalCave
    (previousQuestion WhichCharacterDoYouLikeBest?)
    ?a <- (WhichCharacterDoYouLikeBest? $?p Merlin $?k)
    =>
    (assert (recommendation "The Crystal Cave"))
    (retract ?a)
    (assert (WhichCharacterDoYouLikeBest? $?p $?k))
)

(defrule theMistsOfAvalon
    (previousQuestion WhichCharacterDoYouLikeBest?)
    ?a <- (WhichCharacterDoYouLikeBest? $?p Morgan Le Faye $?k)
    =>
    (assert (recommendation "The Mists of Avalon"))
    (retract ?a)
    (assert (WhichCharacterDoYouLikeBest? $?p $?k))
)

(defrule lookingForModern
    ?d <-(previousQuestion LikeTheArthurianLegend?)
    (LikeTheArthurianLegend? No)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Looking for modern-day settings? 1) (answers "Yes: I'm a city-person" "Maybe: I'm partial to small towns" "No: Let's find another world, this one's depressing"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule somethingWicked
    ?d <-(previousQuestion LookingForModern-daySettings?)
    (LookingForModern-daySettings? Maybe: $?dop)
    =>
    (assert (recommendation "Something Wicked This Way Comes"))
    (retract ?d)
)

(defrule godsOrPeople
    ?d <-(previousQuestion LookingForModern-daySettings?)
    (LookingForModern-daySettings? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Gods or people under the streets? 2) (answers "Modern Mythology" "A world beneath the city"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule neverwhere
    (previousQuestion GodsOrPeopleUnderTheStreets?)
    ?a <- (GodsOrPeopleUnderTheStreets? $?p A world beneath the city $?k)
    =>
    (assert (recommendation "Neverwhere"))
    (retract ?a)
    (assert (GodsOrPeopleUnderTheStreets? $?p $?k))
)

(defrule americanGods
    (previousQuestion GodsOrPeopleUnderTheStreets?)
    ?a <- (GodsOrPeopleUnderTheStreets? $?p Modern Mythology $?k)
    =>
    (assert (recommendation "American Gods"))
    (retract ?a)
    (assert (GodsOrPeopleUnderTheStreets? $?p $?k))
)

(defrule fanOfWesterns
    ?d <-(previousQuestion LookingForModern-daySettings?)
    (LookingForModern-daySettings? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Fan of Westerns? 1) (answers "Yes: I'm prone to don chaps and walk the streets at high noon." "No: Too dusty. And I'm not much of a card player."))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule theDarkTower
    ?d <-(previousQuestion FanOfWesterns?)
    (FanOfWesterns? Yes: $?dop)
    =>
    (assert (recommendation "The Dark Tower"))
    (retract ?d)
)



(defrule animalsMore
    ?d <-(previousQuestion FanOfWesterns?)
    (FanOfWesterns? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Animals more your thing? 1) (answers "Yes: I donate to the WWF. Not the wrestling one." "No: I have allergies"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule whatsYourIdealPet
    ?d <-(previousQuestion AnimalsMoreYourThing?)
    (AnimalsMoreYourThing? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question What's your ideal pet? 3) (answers "Unicorn" "Bunny" "Dragon"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule theLastUnicorn
    (previousQuestion What'sYourIdealPet?)
    ?a <- (What'sYourIdealPet? $?p Unicorn $?k)
    =>
    (assert (recommendation "The Last Unicorn"))
    (retract ?a)
    (assert (What'sYourIdealPet? $?p $?k))
)

(defrule watershipDown
    (previousQuestion What'sYourIdealPet?)
    ?a <- (What'sYourIdealPet? $?p Bunny $?k)
    =>
    (assert (recommendation "Watership Down"))
    (retract ?a)
    (assert (What'sYourIdealPet? $?p $?k))
)

(defrule dragonflight
    (previousQuestion What'sYourIdealPet?)
    ?a <- (What'sYourIdealPet? $?p Dragon $?k)
    =>
    (assert (recommendation "Dragonflight"))
    (retract ?a)
    (assert (What'sYourIdealPet? $?p $?k))
)

(defrule howAboutSomeAltermate
    ?d <-(previousQuestion AnimalsMoreYourThing?)
    (AnimalsMoreYourThing? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question How about some altermate history? 1) (answers "Yes: I'm a revisionist myself" "No: I never paid any attention in history class"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule romanceOrWarring
    ?d <-(previousQuestion HowAboutSomeAltermateHistory?)
    (HowAboutSomeAltermateHistory? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Romance or warring magicians? 2) (answers "Romance" "Magicians"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule kushielsLegacy
    (previousQuestion RomanceOrWarringMagicians?)
    ?a <- (RomanceOrWarringMagicians? $?p Romance $?k)
    =>
    (assert (recommendation "Kushiel's Legacy Series"))
    (retract ?a)
    (assert (RomanceOrWarringMagicians? $?p $?k))
)

(defrule jonathanStrange
    (previousQuestion RomanceOrWarringMagicians?)
    ?a <- (RomanceOrWarringMagicians? $?p Magicians $?k)
    =>
    (assert (recommendation "Jonathan Strange and Mr. Norrell"))
    (retract ?a)
    (assert (RomanceOrWarringMagicians? $?p $?k))
)

(defrule readyToDive
    ?d <-(previousQuestion HowAboutSomeAltermateHistory?)
    (HowAboutSomeAltermateHistory? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Ready to dive into a series? 1) (answers "Yes: The other two options ended with some strange choices" "Maybe: How about an episodic series?" "No: Let's keep this casual"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)


(defrule whatsYourPleasure
    ?d <-(previousQuestion ReadyToDiveIntoASeries?)
    (ReadyToDiveIntoASeries? Maybe: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question What's your pleasure? 3) (answers "Bureaucratic Satire" "Religious Satire" "Fun with Puns"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule goingPostal
    (previousQuestion What'sYourPleasure?)
    ?a <- (What'sYourPleasure? $?p Bureaucratic Satire $?k)
    =>
    (assert (recommendation "Going Postal"))
    (retract ?a)
    (assert (What'sYourPleasure? $?p $?k))
)

(defrule smallGods
    (previousQuestion What'sYourPleasure?)
    ?a <- (What'sYourPleasure? $?p Religious Satire $?k)
    =>
    (assert (recommendation "Small Gods"))
    (retract ?a)
    (assert (What'sYourPleasure? $?p $?k))
)

(defrule xanthSeries
    (previousQuestion What'sYourPleasure?)
    ?a <- (What'sYourPleasure? $?p Fun with Puns $?k)
    =>
    (assert (recommendation "Xanth Series"))
    (retract ?a)
    (assert (What'sYourPleasure? $?p $?k))
)

(defrule withPirates
    ?d <-(previousQuestion ReadyToDiveIntoASeries?)
    (ReadyToDiveIntoASeries? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question With pirates or without? 2) (answers "No pirates here. No siree, Bob. No pirates at all" "Pirates Please"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule stardust
    (previousQuestion WithPiratesOrWithout?)
    ?a <- (WithPiratesOrWithout? $?p No pirates here. No siree, Bob. No pirates at all $?k)
    =>
    (assert (recommendation "Stardust"))
    (retract ?a)
    (assert (WithPiratesOrWithout? $?p $?k))
)

(defrule thePrincessBride
    (previousQuestion WithPiratesOrWithout?)
    ?a <- (WithPiratesOrWithout? $?p Pirates Please $?k)
    =>
    (assert (recommendation "The Princess Bride"))
    (retract ?a)
    (assert (WithPiratesOrWithout? $?p $?k))
)

(defrule doesTheSeriesHave
    ?d <-(previousQuestion ReadyToDiveIntoASeries?)
    (ReadyToDiveIntoASeries? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Does the series have to be finished? 1) (answers "Yes" "No: I like to be held in suspense. Preferably for years at a time"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule takeTheHigh
    ?d <-(previousQuestion DoesTheSeriesHaveToBeFinished?)
    (DoesTheSeriesHaveToBeFinished? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Take the high road or the low road? 2) (answers "Low Fantasy" "High Fantasy"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule aSongOfIceAndFire
    (previousQuestion TakeTheHighRoadOrTheLowRoad?)
    ?a <- (TakeTheHighRoadOrTheLowRoad? $?p Low Fantasy $?k)
    =>
    (assert (recommendation "A Song of Ice and Fire"))
    (retract ?a)
    (assert (TakeTheHighRoadOrTheLowRoad? $?p $?k))
)

(defrule theWayOfKings
    (previousQuestion TakeTheHighRoadOrTheLowRoad?)
    ?a <- (TakeTheHighRoadOrTheLowRoad? $?p High Fantasy $?k)
    =>
    (assert (recommendation "The Way of Kings"))
    (retract ?a)
    (assert (TakeTheHighRoadOrTheLowRoad? $?p $?k))
)

(defrule doTheWords
    ?d <-(previousQuestion DoesTheSeriesHaveToBeFinished?)
    (DoesTheSeriesHaveToBeFinished? Yes)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Do the words Sword and Sorcery have a positive connotation for you? 1) (answers "Yes: Wizards and barbarians? What's not to like" "No"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule roleplayer
    ?d <-(previousQuestion DoTheWordsSwordAndSorceryHaveAPositiveConnotationForYou?)
    (DoTheWordsSwordAndSorceryHaveAPositiveConnotationForYou? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Roleplayer? 1) (answers "Yes" "No"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule theLegendOfDrizzt
    ?d <-(previousQuestion Roleplayer?)
    (Roleplayer? Yes)
    =>
    (assert (recommendation "The Legend of Drizzt"))
    (retract ?d)
)

(defrule moreWizard
    ?d <-(previousQuestion Roleplayer?)
    (Roleplayer? No)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question More wizards or barbarians? 2) (answers "Barbarians" "Wizards"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule chroniclesOfConan
    (previousQuestion MoreWizardsOrBarbarians?)
    ?a <- (MoreWizardsOrBarbarians? $?p Barbarians $?k)
    =>
    (assert (recommendation "The Chronicles of Conan the Barbarian"))
    (retract ?a)
    (assert (MoreWizardsOrBarbarians? $?p $?k))
)

(defrule theElricSaga
    (previousQuestion MoreWizardsOrBarbarians?)
    ?a <- (MoreWizardsOrBarbarians? $?p Wizards $?k)
    =>
    (assert (recommendation "The Elric Saga"))
    (retract ?a)
    (assert (MoreWizardsOrBarbarians? $?p $?k))
)

(defrule lookingForAnOld
    ?d <-(previousQuestion DoTheWordsSwordAndSorceryHaveAPositiveConnotationForYou?)
    (DoTheWordsSwordAndSorceryHaveAPositiveConnotationForYou? No)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Looking for an old-fashioned Trilogy? 1) (answers "Yes: Three is my lucky number" "Maybe: How about a trilogy of trilogies?" "No: In for a penny, in for a pound I always say"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)


(defrule theChroniclesOfThomas
    ?d <-(previousQuestion LookingForAnOld-fashionedTrilogy?)
    (LookingForAnOld-fashionedTrilogy? Maybe: $?dop)
    =>
    (assert (recommendation "The Chronicles of Thomas Covenant, The Unbeliever"))
    (retract ?d)
)

(defrule whatShallWeRead
    ?d <-(previousQuestion LookingForAnOld-fashionedTrilogy?)
    (LookingForAnOld-fashionedTrilogy? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question What shall we read about? 4) (answers "Thieves" "MacGuffins" "Assassins" "Magicians"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule theMistbornTrilogy
    (previousQuestion WhatShallWeReadAbout?)
    ?a <- (WhatShallWeReadAbout? $?p Thieves $?k)
    =>
    (assert (recommendation "The Mistborn Trilogy"))
    (retract ?a)
    (assert (WhatShallWeReadAbout? $?p $?k))
)

(defrule theSwordOfShannaraTrilogy
    (previousQuestion WhatShallWeReadAbout?)
    ?a <- (WhatShallWeReadAbout? $?p MacGuffins $?k)
    =>
    (assert (recommendation "The Sword of Shannara Trilogy"))
    (retract ?a)
    (assert (WhatShallWeReadAbout? $?p $?k))
)

(defrule theFarseerTrilogy
    (previousQuestion WhatShallWeReadAbout?)
    ?a <- (WhatShallWeReadAbout? $?p Assassins $?k)
    =>
    (assert (recommendation "The Farseer Trilogy"))
    (retract ?a)
    (assert (WhatShallWeReadAbout? $?p $?k))
)

(defrule theRiftwarSaga
    (previousQuestion WhatShallWeReadAbout?)
    ?a <- (WhatShallWeReadAbout? $?p Magicians $?k)
    =>
    (assert (recommendation "The Riftwar Saga"))
    (retract ?a)
    (assert (WhatShallWeReadAbout? $?p $?k))
)

(defrule soFiveOrSix
    ?d <-(previousQuestion LookingForAnOld-fashionedTrilogy?)
    (LookingForAnOld-fashionedTrilogy? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question So, five or six books enough for you? 1) (answers "Yes: That should keep me busy" "No: I shall require at least ten"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule enjoyStories
    ?d <-(previousQuestion So,FiveOrSixBooksEnoughForYou?)
    (So,FiveOrSixBooksEnoughForYou? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Enjoy stories about orphaned farm boys? 1) (answers "No"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule theCodexTheBelgariad
    (previousQuestion EnjoyStoriesAboutOrphanedFarmBoys?)
    ?a <- (EnjoyStoriesAboutOrphanedFarmBoys? No)
    =>
    (assert (recommendation "The Codex Alera"))
    (assert (recommendation "The Belgariad"))
    (retract ?a)
)

(defrule enjoyQuests
    ?d <-(previousQuestion So,FiveOrSixBooksEnoughForYou?)
    (So,FiveOrSixBooksEnoughForYou? No: $?odp)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Enjoy quests to prevent great evil from conquering the world? 1) (answers "Yes: Good vs. Evil on an epic scale, please" "No: I need a little more complexity"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule chooseWisely
    ?d <-(previousQuestion EnjoyQuestsToPreventGreatEvilFromConqueringTheWorld?)
    (EnjoyQuestsToPreventGreatEvilFromConqueringTheWorld? No: $?odp)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Choose wisely, this is the end? 2) (answers "Earth is the shadows" "Weaving Timeline"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule theChoniclesOfAmber
    (previousQuestion ChooseWisely,ThisIsTheEnd?)
    ?a <- (ChooseWisely,ThisIsTheEnd? $?p Earth is the shadows $?k)
    =>
    (assert (recommendation "The Chronicles of Amber"))
    (retract ?a)
    (assert (ChooseWisely,ThisIsTheEnd? $?p $?k))
)

(defrule theMalazanBook
    (previousQuestion ChooseWisely,ThisIsTheEnd?)
    ?a <- (ChooseWisely,ThisIsTheEnd? $?p Weaving Timeline $?k)
    =>
    (assert (recommendation "The Malazan Book of the Fallen Series"))
    (retract ?a)
    (assert (ChooseWisely,ThisIsTheEnd? $?p $?k))
)

(defrule whoWillSaveUs
    ?d <-(previousQuestion EnjoyQuestsToPreventGreatEvilFromConqueringTheWorld?)
    (EnjoyQuestsToPreventGreatEvilFromConqueringTheWorld? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Who will save us? 2) (answers "The Seeker of Truth" "The One Power"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule theSwordOfTruth
    (previousQuestion WhoWillSaveUs?)
    ?a <- (WhoWillSaveUs? $?p The Seeker of Truth $?k)
    =>
    (assert (recommendation "The Sword of Truth Series"))
    (retract ?a)
    (assert (WhoWillSaveUs? $?p $?k))
)

(defrule theWheelOfTime
    (previousQuestion WhoWillSaveUs?)
    ?a <- (WhoWillSaveUs? $?p The one Power $?k)
    =>
    (assert (recommendation "The Wheel of Time"))
    (retract ?a)
    (assert (WhoWillSaveUs? $?p $?k))
)

(defrule nameOfTheWind
    ?d <-(previousQuestion AreYouGoingToBeUpsetWhenYouDon'tFindHarryPotter?)
    (AreYouGoingToBeUpsetWhenYouDon'tFindHarryPotter? Yes: $?dop)
    =>
    (assert (recommendation "Name of The Wind"))
    (retract ?d)
)

;---------------------------------------------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------------------------------------
;----------------------------------------------------------------------ENJOY-STORIES----------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------------------------------------------------------------------