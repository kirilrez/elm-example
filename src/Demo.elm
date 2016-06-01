port module Demo exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App exposing (map)



type Msg  = Click | NoOp
type Color = Red|Green|Blue

type alias State = {buttonColor: Color}

init =
    (State Red, Cmd.none)

newColor color =
    case color of
        Red   -> Green
        Green -> Blue
        Blue  -> Red

colorToString color = 
    case color of
        Red   -> "#FF0000"
        Green -> "#00FF00"
        Blue  -> "#0000FF"
    
        
update action model =
    case action of
        NoOp ->
            (model, Cmd.none)
        Click ->
            ({model | buttonColor= newColor model.buttonColor},Cmd.none)


                
view model =
    button[style [("backgroundColor", colorToString model.buttonColor)]
          ,onClick Click
          ][text "ClickMe"]
    

main : Program Never
main =
    Html.App.program
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
