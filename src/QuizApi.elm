module QuizApi exposing (fetchRandomQuestion, checkAnswer)

import Http
import Json.Decode as Json exposing ((:=))
import Json.Decode.Extra exposing ((|:))
import Task exposing (Task)
import Models exposing (..)


--
-- NOTE: Check http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Decode and
-- http://package.elm-lang.org/packages/elm-community/json-extra/1.1.0/Json-Decode-Extra for
-- documentation regarding Json.Decode that is being used here.
--


apiBaseUrl : String
apiBaseUrl =
    "http://infi-dojo-quizapi.azurewebsites.net/"


questionDecoder : Json.Decoder Question
questionDecoder =
    Json.succeed Question
        |: ("Id" := Json.int)
        |: ("Text" := Json.string)
        |: ("Answers" := Json.dict Json.string)


checkedAnswerDecoder : Json.Decoder CheckedAnswerResult
checkedAnswerDecoder =
    Json.succeed CheckedAnswerResult
        |: ("QuestionId" := Json.int)
        |: ("AnswerKey" := Json.string)
        |: ("IsCorrect" := Json.bool)



-- http://infi-dojo-quizapi.azurewebsites.net/question/random


fetchRandomQuestion : Cmd Msg
fetchRandomQuestion =
    Http.get questionDecoder (apiBaseUrl ++ "/question/random")
        |> Task.mapError toString
        |> Task.perform ErrorOccurred QuestionFetched



-- http://infi-dojo-quizapi.azurewebsites.net/answer/1/A


checkAnswer : Int -> String -> Cmd Msg
checkAnswer questionId answerKey =
    Http.get checkedAnswerDecoder (apiBaseUrl ++ "/answer/" ++ (toString questionId) ++ "/" ++ answerKey)
        |> Task.mapError toString
        |> Task.perform ErrorOccurred AnswerChecked
