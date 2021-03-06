keyCodes = ->
  # Define values for keycodes
  @backspace = 8
  @tab = 9
  @enter = 13
  @esc = 27
  @space = 32
  @pageup = 33
  @pagedown = 34
  @end = 35
  @home = 36
  @left = 37
  @up = 38
  @right = 39
  @down = 40
  @insert = 45
  @del = 46
  @f2 = 113

AriaEvent = (element, max_row) ->
  @main_element = $(element)
  $(element).attr('tab-index', 0)
  @maxrow = max_row
  @keys = keyCodes
  this.bindhandler()

AriaEvent.prototype.bindhandler = ()->
  thisObj = this
  $row_event = $(this).find('.row[role="row"]')

  $('#game-levels').delegate 'ul', 'keypress', (e) ->
    alert 'Hello'
    thisObj.bind_grid_cell(object, e)

AriaEvent.prototype.bind_grid_cell = (id, e)->
  $curCell = $(id) #Store the current cell object to prevent repeated DOM traversals
  alert e.keyCode
  switch e.keyCode
    when @keys.left
      alert("you are moving left")
      #$newCell = $curCell.prev()

      #$newCell = $newCell.prev()
      #$newCell.attr("tabindex", "0").focus()
      e.stopPropagation
      return false
      break

#Siddhant Chothe: Just getting the basic keypress passed through to the javascript handling it not letting the screen reader's interpretation of keypress get in way.
#	For enhancing the following implementation, we can go to
#	http://test.cita.illinois.edu/aria/grid/grid1.php#lsc1

$(document).ready ->
  app = new AriaEvent('#game-levels', $("#game-levels ul[role='row']").size())
