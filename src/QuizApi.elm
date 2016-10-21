module QuizApi exposing (fetchRandomQuestion)

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



-- http://infi-dojo-quizapi.azurewebsites.net/question/random


fetchRandomQuestion : Cmd Msg
fetchRandomQuestion =
    Http.get questionDecoder (apiBaseUrl ++ "/question/random")
        |> Task.mapError toString
        |> Task.perform ErrorOccurred QuestionFetched



-- TODO DOJO: answer checking endpoint (http://infi-dojo-quizapi.azurewebsites.net/answer/1/A)
