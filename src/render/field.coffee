import HTML from "@dashkite/html-render"
import * as Format from "#format"
import { input } from "./input"

field = ( specifier ) ->

  hint = specifier.hint ? specifier.description

  HTML.div class: "field", [

    HTML.label [

      HTML.span specifier.label ? Format.title specifier.name
      input specifier
      ( HTML.span class: "hint", hint ) if hint?
      HTML.div class: "error", [
        if specifier.error?
          HTML.i class: "ri-error-warning-line"
        HTML.span specifier.error?.message
      ]
    
    ]

  ]

export { field }
