#= require cable
#= require_self
#= require_tree

@App = {}
App.cable = Cable.createConsumer "ws://52.196.115.62:28080"
