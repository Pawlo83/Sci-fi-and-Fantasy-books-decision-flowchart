(deftemplate book
   (slot title)
   (slot author)
   (slot image-path)
)

(deffacts start
    (token start)
    (question)
    (answers)
    (previousQuestion)


    ;Right
    (book (title "Cryptonomicon") (author "Neal Stephenson") (image-path "books/RightSide/Cryptonomicon.png"))
    (book (title "Neuromancer") (author "") (image-path "books/RightSide/Neuromancer.png"))
    (book (title "The Diamond Age") (author "") (image-path "books/RightSide/TheDiamondAge.png"))
    (book (title "Snow Crash") (author "") (image-path "books/RightSide/SnowCrash.png"))

    ;Left
    (book (title "Name Of The Wind") (author "Patrick Rothfuss") (image-path "books/LeftSide/NameOfTheWind.png"))
    (book (title "The Lord Of The Rings") (author "") (image-path "books/LeftSide/NameOfTheWind.png"))
    (book (title "The Silmarillion") (author "") (image-path "books/LeftSide/TheSilmarillion.png"))

)