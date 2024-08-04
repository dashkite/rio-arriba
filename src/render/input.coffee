import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import HTML from "@dashkite/html-render"
import "@dashkite/vellum"
import * as Format from "#format"

isMarkdown = ({ type, subtype }) ->
  ( type == "markdown" ) && ( subtype == "prose" )

isProse = ({ type, subtype }) ->
  ( type == "text" ) && ( subtype == "prose" )

isEmail = ({ type, subtype }) ->
  ( type == "text" ) && ( subtype == "email" )

isEnumerated = ({ type, options }) -> 
  ( type == "enum" ) && ( Type.isArray options )

isCustom = ({ type, content }) -> 
  ( type == "custom" ) && content?

isBoolean = ({ type }) -> type == "boolean"

isRange= ({ type }) -> type == "range"

input = generic name: "Render.input"

generic input,
  Type.isObject,
  ({ name, value, required }) ->
    HTML.input { name, value, type: "input", required }

generic input,
  isMarkdown,
  ({ subtype, name, value, required, hints }) ->
    HTML.textarea {
      name, value, required, 
      class: "#{ subtype } #{ hints.length }"
    }

generic input,
  isProse,
  ({ subtype, name, value, required, hints }) ->
    HTML.textarea {
      name, value, required, 
      class: "#{ subtype } #{ hints.length }"
    }

generic input,
  isEnumerated,
  ({ options, name, value, required }) ->
    value ?= ""
    # TODO check if enum is dynamic
    #      we could maybe use $from
    #      (non-standard, but none of
    # the standard things work)
    if options.length > 6
      HTML.select { name, value },
        for option in options
          HTML.option value: option, option
    else
      for option in options
        HTML.label [
          HTML.input { 
            name, type: "radio", 
            value: option
            required
            checked: value == option 
          }
          HTML.span Format.title option
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

generic input,
  isBoolean,
  ({ label, name, value }) ->
    value ?= false
    HTML.label [
      HTML.input { name, type: "checkbox", checked: value }
      HTML.span label
    ]

generic input,
  isRange,
  ({ label, name, value, range }) ->
    value ?= range[0]
    HTML.div [
      HTML.datalist id: "#{ name }-list",
        for item, index in range
          HTML.option value: index, label: item
      HTML.input
        name: name
        type: "range"
        min: 0
        max: range.length - 1
        value: value
        list: "#{ name }-list"
    ]

export { input }
