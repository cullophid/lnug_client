module View exposing (view)
import Model exposing(..)
import Html exposing (..)
import Html.Attributes exposing (class, for, id, action, type_, style, placeholder, value)
import Html.Events exposing (onInput)

view : Model -> Html Msg
view {title, searchQuery, searchResult} =
  div [] [
    nav [class "nav-wrapper row purple darken-3"] [
      div [class "col s12"] [
        span [class "brand-logo"] [text title]
      ]
    ],
    div [class "container"] [
      form [action "#", class "col s12"] [
        div [class "input-field col s12"] [
          i [class "material-icons prefix"] [text "search"],
          input [id "search-field", type_ "text", value searchQuery, onInput SearchQueryChange ] [],
          label [for "search-field"][text "Search..."]
        ]
      ],
      pre [] [renderSearchResults searchResult]
    ]
  ]

renderSearchResults : RemoteData (List Talk) -> Html Msg
renderSearchResults result =
  case result of
    NotRequested -> text "Type in the field above to search"
    Pending -> text "Loading"
    Success talks -> ul [class "collection"] <| List.map renderTalk talks
    Failed err -> text err


renderTalk : Talk -> Html Msg
renderTalk {title, description} =
  li [class "collection-item avatar"] [
    i [class "material-icons circle pink"] [text "picture_in_picture"],
    div [] [
      span [class "title"] [text title],
      p [] [text description]
    ]
  ]
