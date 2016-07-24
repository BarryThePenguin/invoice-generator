module Invoice exposing (Model, Msg, init, update, view)

import Client
import Service
import Expense
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App


-- model


type alias Model =
    { currency : String
    , client : Client.Model
    , services : List Service.Model
    , expenses : List Expense.Model
    }


init : Model
init =
    { currency = ""
    , client = Client.init
    , services = []
    , expenses = []
    }



-- update


type Msg
    = SelectCurrency String
    | Client Client.Msg
    | Service
    | Expense


update : Msg -> Model -> Model
update msg model =
    case msg of
        SelectCurrency currency ->
            { model | currency = currency }

        Client msg ->
            { model | client = Client.update msg model.client }

        _ ->
            model



-- view


view : Model -> Html Msg
view model =
    div []
        [ App.map Client (Client.view model.client)
        , select [ onInput SelectCurrency ]
            [ option []
                [ text "AUD" ]
            , option
                []
                [ text "USD" ]
            , option
                []
                [ text "GBP" ]
            ]
        ]
