module Demo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App exposing (map)

type Color = Red
    | Green
    | Blue
    | Purple
    | Yellow
      
type alias Model ={
        color : Color
    }

type Msg = Click

init : ( Model, Cmd Msg )
init =
    (Model Red, Cmd.none)


nextColor color =
    case color of
        Red -> Green
        Green -> Blue
        Blue -> Purple
        Purple -> Green

                  
displayColor color =
    case color of
        Red -> "red"
        Green -> "green"
        Blue ->  "blue"
        Purple -> "purple"      
                
update action model = 
    case action of
        Click ->
            ({model | color = nextColor model.color}, Cmd.none)

view model = 
    div[style [("backgroundColor", displayColor model.color)]
        ,onClick Click]
        [text "CLICK ME"]


main : Program Never
main =
    Html.App.program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
