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
    ?d <-(previousQuestion WhereShouldIstart?)
    (WhereShouldIStart? Fantasy: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Are going to be upset when you don't find Harry Potter? 1) (answers "Yes: Give me more precocious lads at schools of magic, please." "No: I know where to find him if I need him"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule areYouNewTo
    ?d <-(previousQuestion AreYouGoingTo?)
    (AreYouGoingTo? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Are you going to the fantasy genre? 1) (answers "Yes: I am as yet unfamiliar with your tropes. Do your worst." "No: I'm what you call, experienced" "Maybe: Does the wizard of Oz count?"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule likeTheArthurianLegend
    ?d <-(previousQuestion AreYouNewTo?)
    (AreYouNewTo? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Like the Arthurian Legend? 1) (answers "Yes: I own The Sword and the Stone on DVD and VHS." "No:"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
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

(defrule lookingForModern
    ?d <-(previousQuestion LikeTheArthurianLegend?)
    (LikeTheArthurianLegend? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Looking for modern-day settings? 1) (answers "Yes: I'm a city-person" "No: Let's find another world, this one's depressing" "Maybe: I'm partial to small towns"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule godsOrPeople
    ?d <-(previousQuestion LookingForModern?)
    (LookingForModern? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Gods or people under the streets? 2) (answers "Modern Mythology" "A world beneath the city"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule fanOfWesterns
    ?d <-(previousQuestion LookingForModern?)
    (LookingForModern? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Fan of Westerns? 1) (answers "Yes: I'm prone to don chaps and walk the streets at high noon." "No: Too dusty. And I'm not much of a card player."))
    (retract ?y)
    (retract ?b)
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
    ?d <-(previousQuestion AnimalsMore?)
    (AnimalsMore? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question What's your ideal pet? 3) (answers "Unicorn" "Bunny" "Dragon"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule howAboutSomeAltermate
    ?d <-(previousQuestion AnimalsMore?)
    (AnimalsMore? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question How about some altermate history? 1) (answers "Yes: I'm a revisionist myself" "No: I never paid any attention in history class"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule romanceOrWarring
    ?d <-(previousQuestion HowAboutSomeAltermate?)
    (HowAboutSomeAltermate? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Romance or warring magicians? 2) (answers "Romance" "Magicians"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule readyToDive
    ?d <-(previousQuestion HowAboutSomeAltermate?)
    (HowAboutSomeAltermate? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Ready to dive into a series? 1) (answers "Yes: The other two options ended with some strange choices" "No: Let's keep this casual" "Maybe: How about an episodic series?"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule whatsYourPleasure
    ?d <-(previousQuestion ReadyToDive?)
    (ReadyToDive? Maybe: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question What's your pleasure? 3) (answers "Bureaucratic Satire" "Religious Satire" "Fun with Puns"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule withPirates
    ?d <-(previousQuestion ReadyToDive?)
    (ReadyToDive? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question With pirates or without? 2) (answers "No pirates here. No siree, Bob. No pirates at all" "Pirates Please"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule doesTheSeriesHave
    ?d <-(previousQuestion ReadyToDive?)
    (ReadyToDive? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Does the series have to be finished? 1) (answers "Yes:" "No: I like to be held in suspense. Preferably for years at a time"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule takeTheHigh
    ?d <-(previousQuestion DoesTheSeriesHave?)
    (DoesTheSeriesHave? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Take the high road or the low road? 2) (answers "Low Fantasy" "High Fantasy"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule doTheWords
    ?d <-(previousQuestion DoesTheSeriesHave?)
    (DoesTheSeriesHave? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Do the words Sword and Sorcery have a positive connotation for you? 1) (answers "Yes: Wizards and barbarians? What's not to like" "No:"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule roleplayer
    ?d <-(previousQuestion DoTheWords?)
    (DoTheWords? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Roleplayer? 1) (answers "Yes:" "No:"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule moreWizard
    ?d <-(previousQuestion Roleplayer?)
    (Roleplayer? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question More wizards or barbarians? 2) (answers "Barbarians" "Wizards"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule lookingForAnOld
    ?d <-(previousQuestion DoTheWords?)
    (DoTheWords? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Looking for an old-fashioned Trilogy? 1) (answers "Yes: Three is my lucky number" "No: In for a penny, in for a pound I always say" "Maybe: How about a trilogy of trilogies?"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule whatShallWeRead
    ?d <-(previousQuestion LookingForAnOld?)
    (LookingForAnOld? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question What shall we read about? 4) (answers "Thieves" "MacGuffins" "Assassins" "Magicians"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule soFiveOrSix
    ?d <-(previousQuestion LookingForAnOld?)
    (LookingForAnOld? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question So, five or six books enough for you? 1) (answers "Yes: That should keep me busy" "No: I shall require at least ten"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule enjoyStories
    ?d <-(previousQuestion SoFiveOrSix?)
    (SoFiveOrSix? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Enjoy stories about orphaned farm boys? 1) (answers "No:"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule enjoyQuests
    ?d <-(previousQuestion SoFiveOrSix?)
    (SoFiveOrSix? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Enjoy quests to prevent great evil from conquering the world? 1) (answers "Yes: Good vs. Evil on an epic scale, please" "No: I need a little more complexity"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule chooseWisely
    ?d <-(previousQuestion EnjoyQuests?)
    (EnjoyQuests? No: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Choose wisely, this is the end? 2) (answers "Earth is the shadows" "Weaving Timeline"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)

(defrule whoWillSaveUs
    ?d <-(previousQuestion EnjoyQuests?)
    (EnjoyQuests? Yes: $?dop)
    ?y <- (question)
    ?b <- (answers)
    =>
    (assert (question Who will save us? 2) (answers "The Seeker of Truth" "The one Power"))
    (retract ?y)
    (retract ?b)
    (retract ?d)
)
