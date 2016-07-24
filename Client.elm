module Client exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type alias Model =
    { name : String
    , address : String
    , city : String
    , postcode : String
    , country : String
    }


init : Model
init =
    { name = ""
    , address = ""
    , city = ""
    , postcode = ""
    , country = ""
    }



-- update


type Msg
    = Name String
    | Address String
    | City String
    | Postcode String
    | Country String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Address address ->
            { model | address = address }

        City city ->
            { model | city = city }

        Postcode postcode ->
            { model | postcode = postcode }

        Country country ->
            { model | country = country }



-- view


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "To:" ]
        , input [ value model.name, onInput Name ] []
        , input [ value model.address, onInput Address ] []
        , input [ value model.city, onInput City ] []
        , input [ value model.postcode, onInput Postcode ] []
        , input [ value model.country, onInput Country ] []
        ]
