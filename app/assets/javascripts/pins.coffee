$ ->

    $('.ui.embed').embed()

    $('#pins').imagesLoaded ->
      $('#pins').masonry
        itemSelector: '.box'
        isFitWidth: true

    $('#pinurlbutton').bind 'click', ->
      # board.showForm()
      $('.pinform').fadeIn()
      $('.newform').hide()
      $('#pinurlbutton').hide()
      $('#owndiv').hide()


    $('#cancelpinurl').bind 'click', ->
      $('.pinform').hide()
      $('.newform').fadeIn()
      $('#pinurlbutton').show()
      $('#owndiv').fadeIn()


    $('.dropdown').dropdown
      transition: 'fade up'

        #Global binding for link_to tag ajax
    $('a[data-remote]').bind('ajax:success', (evt, data, status, xhr) ->
      ).bind 'ajax:error', (evt, data, status, xhr) ->
        toastr.error data.responseText

    #Global binding for form ajax
    $('form[data-remote]').bind('ajax:success', (evt, data, status, xhr) ->
      ).bind 'ajax:error', (evt, data, status, xhr) ->
        toastr.error data.responseText
