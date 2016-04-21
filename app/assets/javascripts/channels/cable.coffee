#= require cable
#= require_self
#= require_tree
@App ||= {}
App.cable = ActionCable.createConsumer()
