module Layout.Header exposing (..)

import Model exposing (Model)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)

render : Model -> Html msg
render model =
    div [class "flex"] [
        div [class "col col-3"] []
        , div [class "col col-6"] [
            h1 [] [text "Header"]
        ]
    ]
