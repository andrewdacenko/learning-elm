module Main exposing (main)

import Navigation
import RootRoutes
import RootUpdate
import RootView


main : Program Never
main =
    Navigation.program (Navigation.makeParser RootRoutes.parsePath)
        { init = RootUpdate.init
        , update = RootUpdate.update
        , urlUpdate = RootUpdate.urlUpdate
        , view = RootView.view
        , subscriptions = \_ -> Sub.batch []
        }