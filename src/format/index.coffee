import * as Fn from "@dashkite/joy/function"
import * as Text from "@dashkite/joy/text"

title = Fn.pipe [
  Text.uncase
  Text.titleCase
]

label = title

export { title, label }
