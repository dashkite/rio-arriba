import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import HTML from "@dashkite/html-render"
import * as Format from "#format"

isEmail = ({ type, subtype }) ->
  ( type == "string" ) && ( subtype == "email" )

isEnumerated = ({ type, options }) -> 
  ( type == "enum" ) && ( Type.isArray options )

isCustom = ({ type, content }) -> 
  ( type == "custom" ) && content?

input = generic name: "Render.input"

generic input,
  Type.isObject,
  ({ name, value, required }) ->
    HTML.input { name, value, type: "input", required }

generic input,
  isEnumerated,
  ({ property, name, value, required }) ->
    value ?= ""
    # TODO check if enum is dynamic
    #      we could maybe use $from
    #      (non-standard, but none of
    # the standard things work)
    if property.enum.length > 5
      HTML.select { name, value },
        for option in property.enum
          HTML.option value: option, option
    else
      for option in property.enum
        HTML.div [
          HTML.input { 
            name, type: "radio", 
            required
            checked: value == option 
          }
          HTML.label Format.title option
        ]

generic input,
  isEmail,
  ({ name, value, required }) ->
    value ?= ""
    HTML.input { name, value, type: "email", required }

generic input,
  isCustom,
  ({ name, value, required, content }) ->
    value ?= ""
    HTML.input { name, value, type: "hidden", required }
    content

export { input }
