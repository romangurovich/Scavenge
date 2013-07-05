class Scavenge.Routers.Treasures extends Backbone.Router
  routes:
    '': 'index'
    'treasures/:id': 'show'

  initialize: ->
    @collection = new Scavenge.Collections.Treasures()
    @collection.reset(gon.treasures)

  index: ->
    view = new Scavenge.Views.TreasuresIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    if @collection.get(id)
      $('#container').text("Here's your treasure: #{@collection.get(id).get('title')}")
    else
      $('#container').text("No treasure here")