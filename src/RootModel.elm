module RootModel exposing
    ( Model
    , User
    , model
    )

import Material

type alias Model =
    { isLoading: Bool
    , users: Maybe (List User)
    , mdl : Material.Model
    }

type alias User =
    { gender: String
    , name: UserName
    , location: Location
    , email: String
    , picture: UserPicture
    }

type alias UserName =
    { title: String
    , first: String
    , last: String
    }

type alias Location =
    { street: String
    , city: String
    , state: String
    , postcode: Int
    }

type alias UserPicture =
    { large: String
    , medium: String
    , thumbnail: String
    }

model : Model
model =
    { isLoading = False
    , users = Nothing
    , mdl = Material.model
    }
