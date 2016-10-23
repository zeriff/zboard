# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".demo.menu").click ->
    $('.sidebar.menu')
      .sidebar('show')

  $('.right.menu.open').on 'click', (e) ->
    e.preventDefault()
    $('.ui.vertical.menu').toggle()
    return
