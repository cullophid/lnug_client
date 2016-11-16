module View exposing (view)
import Model exposing(..)
import Html exposing (..)
import Html.Attributes exposing (target, href, src, class, for, id, action, type_, style, placeholder, value)
import Html.Events exposing (onInput)
import Markdown

view : Model -> Html Msg
view {searchQuery, searchResult} =
  div [class ""] [
    nav [class "nav-wrapper row purple darken-3"] [
      div [class "col s12"] [
        a [ href "#", class "brand-logo"] [text "Talkfinder 2000"]
      ]
    ],
    div [class "container"] [
      div [class "col s12"] [
        div [class "search-field card"] [
          i [class "material-icons prefix text-xl grey-text text-darken-2"] [text "search"],
          input [id "search-field", type_ "text", value searchQuery, onInput SearchQueryChange, placeholder "Search..."] []
        ]
      ],
      if searchQuery == ""
        then
          emptyText
        else
          renderSearchResults searchResult
    ]
  ]

emptyText : Html Msg
emptyText = h4 [class "grey-text text-lighten-1 text-emp center-align anim-fade-in"] [ text "Type in the field above to search"]

renderSearchResults : RemoteData (List Talk) -> Html Msg
renderSearchResults result =
  case result of
    NotRequested -> emptyText
    Pending -> renderSpinner
    Success talks -> div [class "row anim-list-stagger perspective"] <| List.map renderTalk talks
    Failed err -> text err


renderTalk : Talk -> Html Msg
renderTalk {title, description, speaker, milestone, video} =
  div [class "col s12 anim-fold-in"] [
    div [class "card"] [
      div [class "card-content"] [
        span [class "card-title"] [text <| " " ++ title],
        p [] [text <| textSnippet 140 description]
      ],
      div [class "card-content"] [
        renderSpeaker speaker,
        h6 [class "right grey-text"] [text milestone]
      ],
      div [class "card-action"] [
        a [href speaker.speakerUrl, target "_blank"] [text "Github"],
        youtubeLink video,
        a [class "activator right link"] [text "more"]
      ],
      div [class "card-reveal"] [
        span [class "card-title grey-text text-darken-4"] [
          i [class "material-icons right"] [text "close"],
          text title
        ],
        p [] [ Markdown.toHtml [] description]
      ]
    ]
  ]

youtubeLink : Maybe String -> Html Msg
youtubeLink video =
  case video of
    Just url ->
      a [href url, target "_blank"] [ text "YouTube"]
    Nothing -> text ""

renderSpeaker : Speaker -> Html Msg
renderSpeaker speaker =
  span [class "chip"] [
    img [src speaker.img] [],
    text <| speaker.name ++ " " ++ speaker.surname
  ]

renderSpinner : Html Msg
renderSpinner =
  div [class "center-align"] [
    div [class "preloader-wrapper big active"] [
      div [class "spinner-layer"] [
        div [class "circle-clipper left"] [
          div [class "circle"] []
        ]
      ]
    ]
  ]

carousel : Html Msg
carousel =
  div [class "carousel"] [
    a [class "carousel-item", href "#one!"] [
      img [src "http://lorempixel.com/250/250/nature/1"][]
    ],
    a [class "carousel-item", href "#two!"] [
      img [src "http://lorempixel.com/250/250/nature/2"][]
    ],
    a [class "carousel-item", href "#three!"] [
      img [src "http://lorempixel.com/250/250/nature/3"][]
    ],
    a [class "carousel-item", href "#four!"] [
      img [src "http://lorempixel.com/250/250/nature/4"][]
    ],
    a [class "carousel-item", href "#five!"] [
      img [src "http://lorempixel.com/250/250/nature/5"][]
    ]
  ]

textSnippet : Int -> String -> String
textSnippet len text =
  let
    limit  = len + 50
    shorten = (flip String.append <| "...") << (String.slice 0 len)
  in
    if String.length text > limit then shorten text else text
