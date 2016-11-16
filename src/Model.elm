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
  handle : String,
  name : String,
  surname: String,
  title: String,
  apiSpeakerUrl : String,
  speakerUrl : String,
  img : String
  }


type alias Talk = {
  title : String,
  description : String,
  milestone : Maybe String,
  speaker : Speaker,
  video: Maybe String
  }

type alias Model = {
  searchQuery : String,
  searchResult : RemoteData (List Talk)
  }

defaultModel : Model
defaultModel = {
    searchQuery = "",
    searchResult = NotRequested
  }

talkDecoder : Decoder Talk
talkDecoder =
  map5 Talk
    (field "title" string)
    (field "description" string)
    (maybe (field "milestone" string))
    (field "speaker" speakerDecoder)
    (maybe (field "video" string))


speakerDecoder : Decoder Speaker
speakerDecoder =
  map8 Speaker
    (field "_id" string)
    (field "handle" string)
    (field "name" string)
    (field "surname" string)
    (field "title" string)
    (field "apiSpeakerUrl" string)
    (field "speakerUrl" string)
    (field "img" string)
