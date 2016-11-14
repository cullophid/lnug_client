module Model exposing (Model, Msg(..), RemoteData(..), defaultModel)
import Http
type Msg =
  NoOp
  | SearchQueryChange String
  | SearchResults (Result Http.Error String)


type RemoteData a =
  NotRequested
  | Pending
  | Success a
  | Failed String

type alias Model = {
  title : String,
  searchQuery : String,
  searchResult : RemoteData String
  }

defaultModel : Model
defaultModel =
  {
    title = "Lnug Search",
    searchQuery = "",
    searchResult = NotRequested
  }
