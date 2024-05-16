import Component from "#helpers/component"

component = ({ prefix, action, target, bindings }) ->
  Component.vdom { prefix, action, target, bindings }

export { component }