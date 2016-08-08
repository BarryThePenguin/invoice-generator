module Main exposing (..)

import Invoice
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }



-- model


type alias Model =
    { invoice : Invoice.Model }


initModel : Model
initModel =
    { invoice = Invoice.init }



-- update


type Msg
    = Clear Invoice.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        Clear msg ->
            { model | invoice = Invoice.update msg model.invoice }



-- view


view : Model -> Html Msg
view model =
    div []
        [ App.map Clear (Invoice.view model.invoice)
        , p [] [ text (toString model) ]
        ]
