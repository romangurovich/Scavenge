window.Scavenge =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Scavenge.Routers.Treasures()
    Backbone.history.start(pushState: true)

$(document).ready ->
  Scavenge.initialize()
