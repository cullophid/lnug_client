module Model exposing (Model, Speaker, Msg(..), RemoteData(..), defaultModel)
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

type alias Speaker = {
  name : String,
  bio : String
  }

type alias Model = {
  title : String,
  searchQuery : String,
  searchResult : RemoteData String,
  speakers : List Speaker
  }

defaultModel : Model
defaultModel =
  {
    title = "Lnug Search",
    searchQuery = "",
    searchResult = NotRequested,
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
