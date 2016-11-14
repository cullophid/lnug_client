import Html exposing(Html, beginnerProgram)
import Model exposing (Model, Msg)
import View
import Update


main : Program Never Model Msg
main = beginnerProgram {
  model = Model.defaultModel,
  view = View.view,
  update = Update.update
  }
