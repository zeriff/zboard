# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
     $('.ui.location.search').search
       minCharacters: 2
       fields:
         results: "items"
       apiSettings:
         onResponse: (searchresponse) ->
           res = {
             items: []
           }
           searchresponse.items.forEach (e)->
               item = {}
               item.title = e.city + ", " + e.country
               # item.description = e.state + e.country
               res.items.push(item)
           return res
         url: '/searchlocations/{query}'
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
