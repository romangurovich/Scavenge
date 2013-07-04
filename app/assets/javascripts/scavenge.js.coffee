window.Scavenge =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Scavenge.Routers.Treasures()
    Backbone.history.start()

$(document).ready ->
  Scavenge.initialize()
