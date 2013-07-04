class Scavenge.Collections.Treasures extends Backbone.Collection
  url: '/api/treasures'
  model: Scavenge.Models.Treasure
  drawWinner: ->
    winner = @shuffle()[0]
    if winner
      winner.set(found: true)
      winner.save()
