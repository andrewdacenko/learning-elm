module View exposing (view)

import Html exposing (..)

import Model exposing (Model, User)
import Layout.Header as Header

view : Model -> Html msg
view model =
    Header.render model
