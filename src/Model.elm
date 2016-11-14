module Model exposing (Model, Speaker, Msg(..), defaultModel)
type Msg =
  NoOp
  | SearchQueryChange String

type alias Speaker = {
  name : String,
  bio : String
  }

type alias Model = {
  title : String,
  searchQuery : String,
  speakers : List Speaker
  }

defaultModel : Model
defaultModel =
  {
    title = "Lnug Search",
    searchQuery = "",
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
