module RootRoutes exposing (Sitemap(..), parsePath, navigateTo, toString)

import Html exposing (Attribute)
import Html.Events exposing (onWithOptions)
import Json.Decode
import Navigation exposing (Location)
import Route exposing (..)


type Sitemap
    = HomeRoute
    | LoginRoute
    | NotFoundRoute


homeRoute =
    HomeRoute := static ""


loginRoute =
    LoginRoute := static "login"


sitemap =
    router [ homeRoute, loginRoute]


match : String -> Sitemap
match =
    Route.match sitemap
        >> Maybe.withDefault NotFoundRoute


toString : Sitemap -> String
toString r =
    case r of
        HomeRoute ->
            reverse homeRoute []

        LoginRoute ->
            reverse loginRoute []

        NotFoundRoute ->
            Debug.crash "cannot render NotFound"


parsePath : Location -> Sitemap
parsePath =
    .pathname >> match


navigateTo : Sitemap -> Cmd msg
navigateTo =
    toString >> Navigation.newUrl
