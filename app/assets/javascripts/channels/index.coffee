#= require cable
#= require_self
#= require_tree

@App = {}
App.cable = Cable.createConsumer "ws://52.193.153.0/:28080"
