module Utils exposing (..)

import Date
import Time
import Date.Distance
import Html
import Html.Attributes
import Json.Encode
import Types


formatTime : Time.Time -> Int -> String
formatTime nowMs ms =
    let
        now =
            Date.fromTime nowMs

        date =
            Date.fromTime <| toFloat ms * 1000
    in
        (Date.Distance.inWords date now) ++ " ago"


innerHtml : String -> Html.Attribute Types.Msg
innerHtml content =
    Html.Attributes.property "innerHTML" <| Json.Encode.string content


maybeRender : (a -> Html.Html b) -> Maybe a -> Html.Html b
maybeRender fn maybeValue =
    Maybe.map fn maybeValue
        |> Maybe.withDefault (Html.text "")
