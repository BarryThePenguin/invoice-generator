module Invoice exposing (Model, Msg, init, update, view)

import Person
import Service
import Expense
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App


-- model


type alias Model =
    { currency : String
    , date : String
    , reference : String
    , client : Person.Model
    , you : Person.Model
    , serviceId : Maybe Int
    , services : List Service.Model
    , expenseId : Maybe Int
    , expenses : List Expense.Model
    }


init : Model
init =
    { currency = ""
    , date = "Today"
    , reference = "1042753869"
    , client = Person.init
    , you = Person.init
    , serviceId = Nothing
    , services = []
    , expenseId = Nothing
    , expenses = []
    }



-- update


type Msg
    = AddService
    | SaveService
    | EditService Int
    | SelectCurrency String
    | Client Person.Msg
    | You Person.Msg
    | Service Service.Msg
    | Expense Expense.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddService ->
            addService model

        SaveService ->
            saveService model

        EditService id ->
            { model | serviceId = Just id }

        SelectCurrency currency ->
            { model | currency = currency }

        Client msg ->
            { model | client = Person.update msg model.client }

        You msg ->
            { model | you = Person.update msg model.you }

        _ ->
            model


addService : Model -> Model
addService model =
    let
        newId =
            List.length model.services

        newService =
            Service.init
    in
        case model.serviceId of
            Just id ->
                if id >= newId then
                    { model | serviceId = Just newId }
                else
                    model

            Nothing ->
                { model | serviceId = Just newId, services = model.services ++ [ { newService | id = newId } ] }


editService : Model -> Int -> Model
editService model serviceId =
    { model | serviceId = Nothing }


saveService : Model -> Model
saveService model =
    case model.serviceId of
        Just id ->
            editService model id

        Nothing ->
            addService model



-- view


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "To:" ]
        , App.map Client (Person.view model.client)
        , h2 [] [ text "From:" ]
        , App.map You (Person.view model.you)
        , p [] [ text ("Date: " ++ model.date) ]
        , p [] [ text ("Reference: " ++ model.reference) ]
        , p [] [ text "Hello, here is your invoice" ]
        , table []
            ([ tr []
                [ th []
                    [ text "Services" ]
                , th
                    []
                    [ text "Description" ]
                , th
                    []
                    [ text "Amount" ]
                , th [] []
                ]
             ]
                ++ List.map (service model.serviceId) model.services
            )
        , p [] [ text ("Total: " ++ calc .amount model.services) ]
        , button [ onClick AddService ] [ text "Add Service" ]
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


calc : (Service.Model -> number) -> List Service.Model -> String
calc func model =
    model
        |> List.map func
        |> List.sum
        |> toString


service : Maybe Int -> Service.Model -> Html Msg
service editId service =
    case editId of
        Just id ->
            if service.id == id then
                tr []
                    [ td []
                        [ input [ value service.title ] []
                        ]
                    , td []
                        [ input [ value service.description ] []
                        ]
                    , td []
                        [ input [ value (toString service.amount) ] []
                        ]
                    , td []
                        [ button [ onClick (SaveService) ] [ text "Save" ]
                        ]
                    ]
            else
                serviceRow service

        Nothing ->
            serviceRow service


serviceRow : Service.Model -> Html Msg
serviceRow service =
    tr []
        [ td [] [ text service.title ]
        , td [] [ text service.description ]
        , td [] [ text (toString service.amount) ]
        , td []
            [ button [ onClick (EditService service.id) ] [ text "Edit" ]
            ]
        ]
