module Payment exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type alias Model =
    { accountName : String
    , accountNumber : String
    , bsb : String
    }


init : Model
init =
    { accountName = ""
    , accountNumber = ""
    , bsb = ""
    }



-- update


type Msg
    = AccountName
    | AccountNumber
    | BSB


update : Msg -> Model -> Model
update msg model =
    case msg of
        _ ->
            model



-- view


view : Model -> Html Msg
view model =
    div [] []
