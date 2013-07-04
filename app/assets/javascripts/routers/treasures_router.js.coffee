class Scavenge.Routers.Treasures extends Backbone.Router
  routes:
    '': 'index'
    'treasures/:id': 'show'

  initialize: ->
    @collection = new Scavenge.Collections.Treasures()
    @collection.fetch(reset: true)

  index: ->
    view = new Scavenge.Views.TreasuresIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "boom #{id}"
