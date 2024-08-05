import * as Fn from "@dashkite/joy/function"
import * as Text from "@dashkite/joy/text"

title = Fn.pipe [
  Text.uncase
  Text.titleCase
]

dashed = Fn.pipe [
  Text.toLowerCase
  Text.dashed
]

label = title

export { title, dashed, label }
