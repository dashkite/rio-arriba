import * as Fn from "@dashkite/joy/function"
import * as Text from "@dashkite/joy/text"

Format =
  title: Fn.pipe [
    Text.uncase
    Text.titleCase
  ]

export { Format }
export default Format