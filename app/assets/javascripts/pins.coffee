$ ->
    $('#pins').imagesLoaded ->
      $('#pins').masonry
        itemSelector: '.box'
        isFitWidth: true

    $('#pinurlbutton').bind 'click', ->
      $('.pinform').show()
      $('#newform').hide()
      $('#pinurlbutton').hide()
      $('#owndiv').hide()

    $('#cancelpinurl').bind 'click', ->
      $('.pinform').hide()
      $('#newform').show()
      $('#pinurlbutton').show()
      $('#owndiv').show()
