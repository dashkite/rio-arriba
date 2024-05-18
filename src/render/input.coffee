import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import HTML from "@dashkite/html-render"

isEmail = ({ property }) ->
  ( property?.type == "string" ) &&
    ( property.subtype == "email" )

isEnumerated = ({ property }) -> 
  Type.isArray property?.enum

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

export { input }
