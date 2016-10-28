module Main exposing (..)

import Html exposing (..)
import Html.App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Dict
import Models exposing (..)
import QuizApi


--
-- NOTE: Check https://guide.elm-lang.org/ for online Elm documentation and in
-- particular https://guide.elm-lang.org/architecture/ for an explanation of the Elm architecture.
--
-- Elm syntax reference can be found here: http://elm-lang.org/docs/syntax
--


main : Program Never
main =
    Html.App.program
        { init = init
        , update = update
        , view = view
        , subscriptions =
            (\_ -> Sub.none)
            -- DOJO: not relevant for dojo
        }



-- MODEL


type alias Model =
    { question : Maybe Question
    , givenAnswer : Maybe GivenAnswer
    }


type alias GivenAnswer =
    { answerKey : String
    , isCorrect : Bool
    }



-- INIT


init : ( Model, Cmd Msg )
init =
    ( { question = Nothing
      , givenAnswer = Nothing
      }
    , Cmd.none
    )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        _ =
            Debug.log "model" model
    in
        case Debug.log "msg" msg of
            NoOp ->
                ( model, Cmd.none )

            FetchRandomQuestion ->
                ( { model | givenAnswer = Nothing }, QuizApi.fetchRandomQuestion )

            QuestionFetched newQuestion ->
                ( { model | question = Just newQuestion }, Cmd.none )

            CheckAnswer questionId answerKey ->
                ( model, QuizApi.checkAnswer questionId answerKey )

            AnswerChecked checkedAnswerResult ->
                ( { model | givenAnswer = Just { answerKey = checkedAnswerResult.answerKey, isCorrect = checkedAnswerResult.isCorrect } }, Cmd.none )

            ErrorOccurred errorMessage ->
                ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    let
        showQuestionIfAvailable =
            case model.question of
                Nothing ->
                    "What's the question?"

                Just question ->
                    question.text

        showAnswersIfAvailable =
            case model.question of
                Nothing ->
                    []

                Just q ->
                    Dict.map
                        (\key answer ->
                            p
                                [ onClick (CheckAnswer q.id key)
                                , class (getAnswerClass key)
                                ]
                                [ text (key ++ ": " ++ answer) ]
                        )
                        q.answers
                        |> Dict.values

        getAnswerClass answerKey =
            case model.givenAnswer of
                Nothing ->
                    ""

                Just givenAnswer ->
                    case ( givenAnswer.answerKey == answerKey, givenAnswer.isCorrect ) of
                        ( True, True ) ->
                            "correct"

                        ( True, False ) ->
                            "incorrect"

                        _ ->
                            ""
    in
        div
            [ class "container" ]
            [ h1
                []
                [ img [ src "./img/elm.png", width 100, height 100 ] []
                , text ("Infi Elm Quiz App")
                ]
            , div
                [ class "row" ]
                [ div [ class ".col-md-4" ]
                    [ div [ class "question-container" ]
                        [ div []
                            [ span [ class "question-text" ] [ text showQuestionIfAvailable ]
                            , div [ class "answers-container" ] showAnswersIfAvailable
                            ]
                        ]
                    , div []
                        [ button
                            [ onClick FetchRandomQuestion
                            , class "btn btn-lg btn-success"
                            ]
                            [ text "Load next question" ]
                        ]
                    ]
                ]
            ]
