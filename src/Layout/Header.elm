module Layout.Header exposing (navbar)

import Html exposing (..)
import Html.Attributes exposing (..)
import RootRoutes exposing (Sitemap(HomeRoute, LoginRoute))
import Components exposing (linkTo)
import RootUpdate exposing (Msg)

navbar : Html Msg
navbar =
  nav [class "navbar navbar-default navbar-fixed-top"]
    [ div [class "container"]
      [ div [class "navbar-header"]
        [ button [type' "button", class "navbar-toggle collapsed"]
          [ span [class "sr-only"] [text "Toggle navigation"]
          , span [class "icon-bar"] []
          , span [class "icon-bar"] []
          , span [class "icon-bar"] []
          ]
        , a [class "navbar-brand", href "#"] [text "Project name"]
        ]
      , div [id "navbar", class "navbar-collapse collapse"]
        [ ul [class "nav navbar-nav"]
          [ li [class "active"] [a [linkTo HomeRoute] [text "Home"]]
          , li [] [a [linkTo LoginRoute] [text "Login"]]
          , li [] [a [href "#"] [text "Contact"]]
          ]
        ]
      ]
    ]
