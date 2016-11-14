module Update exposing (update)
import Model exposing (..)
import Http

update: Msg -> Model -> (Model, Cmd Msg)
update message state =
  case message of
    SearchQueryChange query ->
      ({
        state |
          searchQuery = query,
          searchResult = Pending
        }, getSearchResults query)
    SearchResults (Ok result) ->
      ({state | searchResult = Success result }, Cmd.none)
    SearchResults (Err err) ->
      ({state | searchResult = Failed <| errorResponseToString err }, Cmd.none)
    NoOp ->
      (state, Cmd.none)


getSearchResults : String -> Cmd Msg
getSearchResults query =
  Http.send SearchResults
  <| Http.getString
  <| "http://localhost:8080?query=" ++ query


errorResponseToString : Http.Error -> String
errorResponseToString err =
  case err of
    Http.Timeout -> "Timeout"
    Http.BadUrl err -> err
    Http.NetworkError -> "NetworkError"
    Http.BadStatus {status, body} ->
        (toString status) ++ ": " ++ body
    Http.BadPayload err {status, body} -> (toString status) ++ ": " ++ err ++ "/n" ++ body
