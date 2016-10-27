module RootView exposing (view)

import Json.Decode as Json
import Html exposing (..)
import Html.Attributes exposing (href)
import Html.Events exposing (onWithOptions)
import RootRoutes exposing (Sitemap(..))
import RootUpdate exposing (Msg(..), Model)

import Layout.Header exposing (navbar)

notFound : Html Msg
notFound =
    h1 [] [ text "Page not found" ]


home : Html Msg
home =
    div []
        [ h1 [] [ text "Home Page" ]
        ]


login : Html Msg
login =
    div []
        [ h1 [] [ text "Login Page" ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ navbar, ul []
            [ li [] [ link HomeRoute "Home" ]
            , li [] [ link LoginRoute "Log In"]
            ]
        , case model.route of
            HomeRoute ->
                home

            LoginRoute ->
                login

            NotFoundRoute ->
                notFound
        ]


link : Sitemap -> String -> Html Msg
link route label =
    let
        opts =
            { preventDefault = True
            , stopPropagation = False
            }
    in
        a
            [ href (RootRoutes.toString route)
            , onWithOptions "click" opts (Json.succeed <| RouteTo route)
            ]
            [ text label ]
