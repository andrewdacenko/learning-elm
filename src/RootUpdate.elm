module RootUpdate exposing (Msg(..), Model, init, update, urlUpdate)

import Http
import Navigation exposing (Location)
import RootRoutes exposing (Sitemap(..))
import Task


type alias Model =
    { route : Sitemap
    , ready : Bool
    , error : Maybe String
    }


type Msg
    = RouteTo Sitemap


init : Sitemap -> ( Model, Cmd Msg )
init route =
    urlUpdate route
        { route = route
        , ready = False
        , error = Nothing
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ route } as model) =
    case msg of
        RouteTo route ->
            model ! [ RootRoutes.navigateTo route ]


urlUpdate : Sitemap -> Model -> ( Model, Cmd Msg )
urlUpdate route model =
    {model | route = route} ! []

