class Scavenge.Models.Treasure extends Backbone.Model
  markFound: ->
    @set(found: true)
    @save()
    @trigger('highlight')