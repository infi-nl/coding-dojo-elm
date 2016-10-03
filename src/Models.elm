module Models exposing (..)


type Msg
    = NoOp
    | FetchRandomQuestion
    | QuestionFetched Question
    | ErrorOccurred String



-- TODO DOJO: other messages?


type alias Question =
    { id :
        Int
        -- TODO DOJO: other fields?
    }



-- TODO DOJO: other types?
