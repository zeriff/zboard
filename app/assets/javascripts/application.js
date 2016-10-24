// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require masonry/jquery.masonry
//= require jquery_ujs
//= require semantic-ui
//= require toastr.min
//= require promise
//= require sweetalert.min
//= require jquery.blockUI
//= require jquery.inview
//= require_tree .

// var constant = {
//     API: "http://localhost:3000/"
// }
var constant = {
    API: "https://calm-stream-27400.herokuapp.com/"
}

$.rails.allowAction = function(link) {
    if (link.data("confirm") == undefined) {
        return true;
    }
    $.rails.showConfirmationDialog(link);
    return false;
}
//User click confirm button
$.rails.confirmed = function(link) {
    link.data("confirm", null);
    link.trigger("click.rails");
}

$.rails.showConfirmationDialog = function(link) {
    var message;
    message = link.data('confirm');

    swal({title: message, type: 'warning', confirmButtonText: 'Sure', confirmButtonColor: '#2acbb3', showCancelButton: true}).then(function(e) {
        if (e) {
            $.rails.confirmed(link);
        }
    }, function() {});
};

toastr.options = {
    "closeButton": true,
    "debug": false,
    "newestOnTop": true,
    "progressBar": true,
    "positionClass": "toast-top-center",
    "preventDuplicates": true,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "4000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
}

$.blockUI.defaults.css = {
    padding: 0,
    margin: 0,
    width: '30%',
    top: '40%',
    left: '35%',
    textAlign: 'center',
    backgroundColor: '#fff',
    cursor: 'wait'
};;
