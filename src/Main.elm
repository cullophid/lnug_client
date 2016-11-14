import Html exposing (..)
import Html.Attributes exposing (..)
type Msg = NoOp

type alias Model = {
  title : String
  }

main : Program Never Model Msg
main = Html.beginnerProgram {
  model = defaultModel,
  view = view,
  update = update
  }

defaultModel : Model
defaultModel = {
  title = "Lnug Search"
  }

view : Model -> Html Msg
view {title} =
  div [] [
    div [class "mdl-layout__header"] [
      div [class "mdl-layout__header-row"] [
        span [class "mdl-layout-title"] [text title]
      ]
    ],
    div [class "mdl-cell--12-col"] [
      ul [class "mdl-list"] [
        li [class "mld-list__item"] [
          span [] [text "Andreas Moeller"]
        ],
        li [class "mld-list__item"] [
          span [] [text "Stefano Vozza"]
        ],
        li [class "mld-list__item"] [
          span [] [text "James Chow"]
        ]
      ]
    ]
  ]


update: Msg -> Model -> Model
update message state = state
