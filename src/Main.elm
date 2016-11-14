import Html exposing (..)
import Html.Attributes exposing (class, for, id, action, type_, style)
type Msg = NoOp

type alias Speaker = {
  name : String,
  bio : String
  }

type alias Model = {
  title : String,
  speakers : List Speaker
  }

main : Program Never Model Msg
main = Html.beginnerProgram {
  model = defaultModel,
  view = view,
  update = update
  }

defaultModel : Model
defaultModel =
  {
    title = "Lnug Search",
    speakers =
      [
        {
          name = "Andreas Moller",
          bio =
            """
            Bryan Cranston played the role of Walter in Breaking Bad. He is also known
            for playing Hal in Malcom in the Middle
            """
        },
        {
          name = "Stefano Vozza",
          bio =
            """
            Bryan Cranston played the role of Walter in Breaking Bad. He is also known
            for playing Hal in Malcom in the Middle
            """
        },
        {
          name = "James Chow",
          bio =
            """
            Bryan Cranston played the role of Walter in Breaking Bad. He is also known
            for playing Hal in Malcom in the Middle
            """
        }
      ]
  }

view : Model -> Html Msg
view {title, speakers} =
  div [] [
    header [class "mdl-layout__header"] [
      div [class "mdl-layout__header-row"] [
        span [class "mdl-layout-title"] [text title]
      ]
    ],
    div [class "mdl-grid"] [
      form [action "#", class "mdl-grid", style [("width", "80%")]] [
        span [] [text "Search..."],
        div [class "mdl-textfield mdl-js-textfield block"] [
          input [class "mdl-textfield__input", type_ "text", id "Search"] []
        ]
      ],
      ul [class "mdl-list", style [("display", "block"), ("width", "100%")]] <| List.map speaker speakers
    ]
  ]


speaker : Speaker -> Html Msg
speaker {name, bio} =
  li [class "mdl-list__item mdl-list__item--three-line"] [
    span [class "mdl-list__item-primary-content"][
      i [class "material-icons mdl-list__item-avatar"] [text "person"],
      span [] [text name],
      span [class "mdl-list__item-text-body"] [text bio]
    ]
  ]


update: Msg -> Model -> Model
update message state = state
