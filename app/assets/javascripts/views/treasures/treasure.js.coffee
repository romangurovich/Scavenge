class Scavenge.Views.Treasure extends Backbone.View

  template: JST['treasures/treasure']

  tagName: 'li'

  events:
    'click': 'showTreasure'

  initialize: ->
    @model.on("change", @render, this)
    @model.on("highlight", @highlight, this)

  render: ->
    this.$el.html(@template(treasure: @model))
    this

  showTreasure: ->
    Backbone.history.navigate("treasures/#{@model.get('id')}", true)

  highlight: ->
    $('.found').removeClass('highlight')
    this.$('.found').addClass('highlight')
