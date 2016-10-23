$(document).ajaxStart(function(domevent) {
    var noblock = domevent.currentTarget.activeElement.getAttribute("data-noblock");
    if (!noblock && noblock != "") {
        $.blockUI({message: '<div class="ui active dimmer"><div class="ui loader"></div></div>'});
    }
}).ajaxStop(function() {
    $.unblockUI();
});
