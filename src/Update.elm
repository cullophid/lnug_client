module Update exposing (update)
import Model exposing (..)

update: Msg -> Model -> Model
update message state =
  case message of
    SearchQueryChange query -> { state | searchQuery = query }
    _ -> state
