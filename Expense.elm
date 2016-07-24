module Expense exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type alias Model =
    { description : String
    , amount : Float
    }


init : Model
init =
    { description = ""
    , amount = 0
    }



-- update


type Msg
    = Description
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
