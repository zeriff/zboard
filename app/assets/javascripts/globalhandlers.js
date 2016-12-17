$(document).ajaxStart(function(domevent) {
    var activeElement = domevent.currentTarget.activeElement;
    var noblock = activeElement.getAttribute("data-noblock");
    $(activeElement).find("i").addClass("loading");
    if (!noblock && noblock != "") {
        $.blockUI({message: '<div class="ui active dimmer"><div class="ui loader"></div></div>'});
    }
}).ajaxStop(function(domevent) {
    var activeElement = domevent.currentTarget.activeElement;
    $(activeElement).find("i").removeClass("loading");
    $.unblockUI();
});

$(document).ready(function() {
    // $.blockUI({message: '<div class="ui active dimmer"><div class="ui loader"></div></div>'});
    $('form').submit(function() {
        $.blockUI({message: '<div class="ui active dimmer"><div class="ui loader"></div></div>'});
    })

    $('.image.item').bind('click', function() {
        $('.ui.modal').modal('setting', 'transition', 'scale').modal('show');
    })
    // $('.story .image').dimmer({on: 'hover'});
    $('.ui.sidebar').sidebar({context: $('.my-content'), transition: 'scaledown'}).sidebar('attach events', 'a#hamburger-link');
});

jQuery(window).load(function() {
    $.unblockUI();
});;
