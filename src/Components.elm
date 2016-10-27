module Components exposing (linkTo)

import Html exposing (Attribute)
import Html.Events exposing (onWithOptions)
import Json.Decode
import RootRoutes exposing (Sitemap)
import RootUpdate exposing (Msg(RouteTo))

linkOpts =
  { preventDefault = True
  , stopPropagation = False
  }

linkTo : Sitemap -> Attribute Msg
linkTo route =
  onWithOptions "click" linkOpts (Json.Decode.succeed <| RouteTo route)