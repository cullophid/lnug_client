module Model exposing (Model, Msg(..), RemoteData(..), Talk, Speaker, defaultModel, talkDecoder)
import Json.Decode exposing (..)
import Http
type Msg =
  NoOp
  | SearchQueryChange String
  | SearchResults (Result Http.Error (List Talk))


type RemoteData a =
  NotRequested
  | Pending
  | Success a
  | Failed String

type alias Speaker = {
  id : String,
  name : String,
  surname: String,
  title: String
  }


type alias Talk = {
  title : String,
  description : String,
  speaker : Speaker
  }


type alias Model = {
  title : String,
  searchQuery : String,
  searchResult : RemoteData (List Talk)
  }

defaultModel : Model
defaultModel = {
    title = "Lnug Search",
    searchQuery = "",
    searchResult = NotRequested
  }


talkDecoder : Decoder Talk
talkDecoder =
  map3 Talk
    (field "title" string)
    (field "description" string)
    (field "speaker" speakerDecoder)


speakerDecoder : Decoder Speaker
speakerDecoder =
  map4 Speaker
    (field "_id" string)
    (field "name" string)
    (field "surname" string)
    (field "title" string)
