import Component from "#helpers/component"

component = ({ prefix, action, target, attributes, bindings }) ->
  Component.vdom { prefix, action, target, attributes, bindings }

export { component }