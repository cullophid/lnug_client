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
    SearchResults (Err _) ->
      ({state | searchResult = Failed "Oh No!" }, Cmd.none)
    NoOp ->
      (state, Cmd.none)


getSearchResults : String -> Cmd Msg
getSearchResults query =
  Http.send SearchResults
  <| Http.getString
  <| "http://localhost:8080?query=" ++ query
