module Types
    exposing
        ( Story
        , Comment
        , Kids(..)
        )


type alias Story =
    { id : String
    , title : String
    , score : Maybe Int
    , user : String
    , time : Int
    , commentsCount : Maybe Int
    , comments : List Comment
    , url : Maybe String
    }


type alias Comment =
    { id : String
    , text : String
    , score : Maybe Int
    , user : String
    , time : Int
    , kids : Kids
    }


type Kids
    = Kids (List Comment)
