import * as Fn from "@dashkite/joy/function"
import * as Text from "@dashkite/joy/text"
import HTML from "@dashkite/html-render"

Attributes =

  toString: ( pairs ) ->
    result
      .map ([ key, value ]) -> "#{ key }='#{ value }'"
      .join " "

  toObject: ( pairs ) ->
    result = {}
    for key, value of pairs
      result[ key ] = value
    result

Component =

  attributes: ({ data, rest... }) ->
    result = []
    for key, value of rest
      result.push [ key, value ]
    result

  template: "${prefix}-${action}-${target}"

  tag: ( context ) ->
    Text.interpolate Component.template, context

  vdom: ({ context..., bindings }) ->
    tag = Component.tag context
    attributes = Component.attributes
      data: bindings
      exportparts: "header:header-2, header-2:header-3, header-3:header-4"
    HTML.tag tag, Attributes.toObject attributes

  html: ({ context..., bindings }) ->
    tag = Component.tag context
    attributes = Component.attributes
      data: bindings
      exportparts: "header:header-2, header-2:header-3, header-3:header-4"
    "<#{ tag } #{ Attributes.toString attributes }/>"

export default Component
