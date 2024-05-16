import Registry from "@dashkite/helium"

map = ( name ) ->
  ( target ) ->
    router = await Registry.get "router"
    router.link target

Router =

  link: map "link"


export default Router
export { Router }
