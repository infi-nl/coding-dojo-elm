module QuizApi exposing (fetchRandomQuestion)

import Http
import Json.Decode as Json exposing ((:=))
import Json.Decode.Extra exposing ((|:))
import Task exposing (Task)
import Models exposing (..)


-- TODO URLs of JSON decoder tutorials


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
