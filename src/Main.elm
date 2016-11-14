import Html exposing(Html, program)
import Model exposing (Model, Msg)
import View
import Update


main : Program Never Model Msg
main = program {
  init = (Model.defaultModel, Cmd.none),
  view = View.view,
  update = Update.update,
  subscriptions = subscriptions
  }


subscriptions : Model -> Sub Msg
subscriptions model = Sub.none
