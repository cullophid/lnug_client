module View exposing (view)
import Model exposing(..)
import Html exposing (..)
import Html.Attributes exposing (class, for, id, action, type_, style, placeholder, value)
import Html.Events exposing (onInput)

view : Model -> Html Msg
view {title, speakers, searchQuery} =
  let
    filteredSpeakers = List.filter (searchFilter searchQuery) speakers
  in
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
        ul [class "collection"] <| List.map speaker filteredSpeakers
      ]
    ]

searchFilter : String -> Speaker -> Bool
searchFilter query speaker =
  String.contains query speaker.name

speaker : Speaker -> Html Msg
speaker {name, bio} =
  li [class "collection-item avatar"] [
    i [class "material-icons circle pink"] [text "person"],
    div [] [
      span [class "title"] [text name],
      p [] [text bio]
    ]
  ]
