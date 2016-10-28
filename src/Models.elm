module Models exposing (..)

import Dict


type Msg
    = NoOp
    | FetchRandomQuestion
    | QuestionFetched Question
    | CheckAnswer Int String
    | AnswerChecked CheckedAnswerResult
    | ErrorOccurred String


type alias CheckedAnswerResult =
    { questionId : Int
    , answerKey : String
    , isCorrect : Bool
    }


type alias Question =
    { id : Int
    , text : String
    , answers : Dict.Dict String String
    }
