#= require cable
#= require_self
#= require_tree

@App = {}
App.cable = Cable.createConsumer "ws://52.196.203.230:28080"
