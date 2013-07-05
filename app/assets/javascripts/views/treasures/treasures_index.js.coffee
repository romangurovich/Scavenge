class Scavenge.Views.TreasuresIndex extends Backbone.View

  template: JST['treasures/index']

  events:
    'submit #new_treasure_form': 'createTreasure'
    'mouseover .error': 'hideError'
    'keypress #new_treasure_title': 'countLetters'
    'focus #new_treasure_title': 'showLetterCount'
    'blur #new_treasure_title': 'removeLetterCount'
    'click #draw_found': 'drawFound'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTreasure, this)

  render: ->
    this.$el.html(@template(treasures: @collection))
    @collection.each(@appendTreasure)
    this

  appendTreasure: (treasure) =>
    view = new Scavenge.Views.Treasure(model: treasure)
    @$('#treasures').append(view.render().el)


  createTreasure: (event) ->
    event.preventDefault()
    attributes = title: $('#new_treasure_title').val()
    @collection.create attributes,
      wait: true
      success: ->
        $('#new_treasure_form')[0].reset()
      error: @handleError

  handleError: (treasure, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        for message in messages
          $errorPane = $('<div></div>').addClass('error')
          $errorPane.text("#{attribute} #{message}").insertBefore('#treasures')

  hideError: (e) ->
    e.preventDefault()
    $(e.currentTarget).slideUp()

  drawFound: (e) ->
    e.preventDefault()
    @collection.drawFound()

  countLetters: ->
    letters = $('#new_treasure_title').val().length + 1
    $('.letter-count').text("letter count: #{letters}")

  showLetterCount: ->
    letters = $('#new_treasure_title').val().length
    @letterPane = $('<div></div>').addClass('letter-count')
    @letterPane.text("letter count: #{letters}").insertBefore('#treasures')

  removeLetterCount: ->
    @letterPane.remove()

