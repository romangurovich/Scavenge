class Scavenge.Views.Treasure extends Backbone.View

  template: JST['treasures/treasure']

  tagName: 'li'

  events:
    'submit #new_treasure_form': 'createTreasure'

  initialize: ->
    @it = 0

  render: ->
    this.$el.html(@template(treasure: @model))
    @it += 1
    console.log "rendered the item view #{@it} times"
    this
