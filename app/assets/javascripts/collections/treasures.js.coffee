class Scavenge.Collections.Treasures extends Backbone.Collection
  url: '/api/treasures'
  model: Scavenge.Models.Treasure
  drawFound: ->
    found = @shuffle()[0]
    if found
      found.markFound()
