module Service exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type alias Model =
    { id : Int
    , title : String
    , description : String
    , amount : Float
    }


init : Model
init =
    { id = 0
    , title = ""
    , description = ""
    , amount = 0
    }



-- update


type Msg
    = Title
    | Description
    | Amount


update : Msg -> Model -> Model
update msg model =
    case msg of
        _ ->
            model



-- view


view : Model -> Html Msg
view model =
    div [] []
