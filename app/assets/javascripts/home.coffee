# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    # $('.pins').imagesLoaded ->
    #   $('.pins').masonry
    #     isAnimated: true
    #     itemSelector: '.box'
    #     isFitWidth: true

    # $('.ui.search').search
    #   minCharacters: 2
    #   fields:
    #     results: "items"
    #   apiSettings:
    #     onResponse: (searchresponse) ->
    #       res = {
    #         items: []
    #       }
    #       searchresponse.items.forEach (e)->
    #           item = {}
    #           if e.title
    #             item.title = e.title.substr(0,45) + "..."
    #             item.description = e.description.substr(0,60) + "..."
    #             item.image = e.image.thumb.url
    #             item.url = constant.API + "pins/" + e.id
    #           else
    #             item.title = e.username
    #             # item.description = e.about
    #             item.image = e.avatar.url
    #             item.url = constant.API + e.username
    #           res.items.push(item)
    #
    #       return res
    #     url: constant.API + "search/{query}"

    #For showing Edit profile Picture Modal
    $('#editavatar').bind 'click', ->
      $('.ui.avatar.modal').modal(
        closable: false
      ).modal 'show'

    $('#editcover').bind 'click', ->
      $('.ui.coverpic.modal').modal(
        closable: false
      ).modal 'show'
    # For showing Avatar Preview
    $('#user_avatar').bind 'change',(jqueryEl) ->
      $('#av_submit').attr('class', "ui basic blue button");
      imagehelper.previewImage(jqueryEl,"#img_avatar_prev")

    # For showing Cover Preview
    $('#user_cover').bind 'change',(jqueryEl) ->
      $('#co_submit').attr('class', "ui basic blue button");
      imagehelper.previewImage(jqueryEl,"#img_cover_prev")


    $('#pin_image').bind 'change',(jqueryEl) ->
      imagehelper.previewImage(jqueryEl,"#pin_image_img")
