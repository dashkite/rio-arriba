import HTML from "@dashkite/html-render"
import * as Format from "#format"
import { input } from "./input"

Specifier = 
  toClasses: ( specifier ) ->
    classes = new Set [ "field", specifier.name, specifier.type ]
    if specifier.subtype?
      classes.add specifier.subtype
    Array
      .from classes
      .join " "

field = ( specifier ) ->

  label = specifier.label ? Format.title specifier.name
  hint = specifier.hint ? specifier.description
  classes = Specifier.toClasses specifier
  
  HTML.div class: classes, [

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
