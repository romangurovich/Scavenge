class Scavenge.Views.TreasuresIndex extends Backbone.View

  template: JST['treasures/index']

  events:
    'submit #new_treasure_form': 'createTreasure'
    'mouseover .error': 'hideError'
    'keypress #new_treasure_title': 'countLetters'
    'focus #new_treasure_title': 'showLetterCount'
    'blur #new_treasure_title': 'removeLetterCount'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTreasure, this)
    @it = 0

  render: ->
    this.$el.html(@template(treasures: @collection))
    @collection.each(@appendTreasure)
    @it += 1
    console.log "rendered #{@it} times"
    this

  appendTreasure: (treasure) ->
    view = new Scavenge.Views.Treasure(model: treasure)
    $('#treasures').append(view.render().el)


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

  drawWinner: (e) ->
    e.preventDefault()
    @collection.drawWinner()

  countLetters: ->
    letters = $('#new_treasure_title').val().length + 1
    $('.letter-count').text("letter count #{letters}")

  showLetterCount: ->
    letters = $('#new_treasure_title').val().length
    @letterPane = $('<div></div>').addClass('letter-count')
    @letterPane.text("letter count: #{letters}").insertBefore('#treasures')

  removeLetterCount: ->
    @letterPane.remove()

