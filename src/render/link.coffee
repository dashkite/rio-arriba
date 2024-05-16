import HTML from "@dashkite/html-render"
import * as Page from "@dashkite/neon-drive"

link = ( description, content ) ->
  href = await Page.link description
  HTML.a { href }, content

export { link }