import * as Fn from "@dashkite/joy/function"
import * as Text from "@dashkite/joy/text"

Component =

  template: "${prefix}-${action}-${target}"

  tag: ( context ) ->
    Text.interpolate Component.template, context

  vdom: ( context ) ->
    HTML.parse Component.html context

  html: ({ context..., bindings }) ->
    tag = Component.tag context
    element = document.createElement tag
    Object.assign element.dataset, bindings
    element.setAttribute "exportparts",
      "header:header-2, header-2:header-3, header-3:header-4"
    element.outerHTML

export default Component
