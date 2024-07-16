import HTML from "@dashkite/html-render"
import * as Format from "#format"
import { input } from "./input"

field = ( specifier ) ->

  label = specifier.label ? Format.title specifier.name
  hint = specifier.hint ? specifier.description

  HTML.div class: "field", [

    HTML.label [

      if hint?
        HTML.details class: "hint", [
          HTML.summary label
          HTML.span hint
        ]
      else
        HTML.span label

      input specifier
      HTML.div class: "error", [
        if specifier.error?
          HTML.i class: "ri-error-warning-line"
        HTML.span specifier.error?.message
      ]
    
    ]

  ]

export { field }
