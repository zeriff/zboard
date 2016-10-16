var board = {
    refreshMasonry: function() {
        $('#pins').imagesLoaded(function() {
            $("#pins").masonry('reload');
        });
    },
    showForm: function() {
        var form = $('.pinform');
        swal({title: "Enter Url", html: form.html(), showCancelButton: true, showLoaderOnConfirm: true}).then(function(e) {
            if (e) {
                $.blockUI({message: '<div class="ui active dimmer"><div class="ui loader"></div></div>'});
                $(".swal2-content .form").submit();
            }
        }, function(dismiss) {});
    },
    bind_masonry: function(toEl) {
        $(".pins").imagesLoaded(function() {
            $(".pins").masonry({});
        });
    }
}
