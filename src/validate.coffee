import * as Fn from "@dashkite/joy/function"
import * as Rio from "@dashkite/rio"
import { Error, Form } from "@dashkite/rio-forms"

validate = ( html ) ->

  Fn.pipe [

    Rio.invalid [
      Error.capture
      Rio.form
      Form.prefill
      Rio.render html
    ]

    Rio.change "form [name]", [
      Error.dismiss
      Rio.form
      Form.prefill
      Rio.render html
    ]

  ]

export { validate }