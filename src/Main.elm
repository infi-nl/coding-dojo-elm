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
    { question :
        Maybe Question
        -- TODO DOJO: other fields you want to use?
    }



-- INIT


init : ( Model, Cmd Msg )
init =
    ( { question = Nothing
      }
    , Cmd.none
    )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        FetchRandomQuestion ->
            ( model, QuizApi.fetchRandomQuestion )

        QuestionFetched newQuestion ->
            ( { model | question = Just newQuestion }, Cmd.none )

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

                Just q ->
                    "Question " ++ (toString q.id)

        -- TODO DOJO: show question text and answers?
    in
        div
            [ class "container" ]
            [ h1
                []
                [ img [ src "./img/elm.png", width 100, height 100 ] []
                , text "Infi Elm Quiz App"
                ]
            , div
                [ class "row" ]
                [ div [ class ".col-md-4" ]
                    [ div [ class "question-container" ]
                        [ div []
                            [ span [ class "question-text" ] [ text showQuestionIfAvailable ]
                            ]
                        ]
                    , div []
                        [ button
                            [ onClick FetchRandomQuestion, class "btn btn-lg btn-success" ]
                            [ text "Load next question" ]
                        ]
                    ]
                ]
            ]
