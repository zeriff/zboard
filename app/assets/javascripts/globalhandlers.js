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
});

jQuery(window).load(function() {
    $.unblockUI();
});;
