import * as Fn from "@dashkite/joy/function"
import * as Text from "@dashkite/joy/text"
import HTML from "@dashkite/html-render"

Attributes =

  toString: ( dictionary ) ->
    Object.entries dictionary
      .map ([ key, value ]) -> "#{ key }='#{ value }'"
      .join " "

Component =

  attributes: ({ data, rest... }) ->
    result = {}
    for key, value of data
      result[ "data-#{ key }" ] = value
    for key, value of rest
      result[ key ] = value
    result

  template: "${prefix}-${action}-${target}"

  tag: ( context ) ->
    Text.interpolate Component.template, context

  vdom: ({ context..., bindings }) ->
    tag = Component.tag context
    attributes = Component.attributes {
      context.attributes...
      data: bindings
      # exportparts: "header:header-2, header-2:header-3, header-3:header-4"      
    }
    HTML.tag tag, attributes

  html: ({ context..., bindings }) ->
    tag = Component.tag context
    attributes = Component.attributes
      data: bindings
      # exportparts: "header:header-2, header-2:header-3, header-3:header-4"
    "<#{ tag } #{ Attributes.toString attributes }/>"

export default Component
