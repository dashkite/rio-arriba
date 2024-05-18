import HTML from "@dashkite/html-render"
import Format from "#helpers/format"
import { input } from "./input"

field = ( specifier ) ->

  hint = specifier.hint ? specifier.description

  HTML.div class: "field", [

    HTML.label [

      HTML.span specifier.label ? Format.title specifier.name
      input specifier
      ( HTML.span class: "hint", hint ) if hint?
      HTML.span class: "error", specifier.error?.message
    
    ]

  ]

export { field }
