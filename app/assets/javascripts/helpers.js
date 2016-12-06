// ********************************************
// ***************MASONRY**********************
// ********************************************
var masonry = {
    bind: function(classname, selector) {
        var cName = '.' + classname;
        var sel = '.' + selector
        $(cName).imagesLoaded(function() {
            $(cName).masonry('reload');
        });
        $(cName).masonry({
            isAnimated: true,
            animationOptions: {
                duration: 500,
                easing: 'linear',
                queue: false
            },
            itemSelector: sel,
            isFitWidth: true
        })
    },
    reload: function(classname) {
        var cName = "." + classname;
        $(cName).imagesLoaded(function() {
            $(cName).masonry('reload');
        });
    }
}

var board = {
    showForm: function() {
        var form = $('.pinform');
        swal({title: "Enter Url", html: form.html(), showCancelButton: true, showLoaderOnConfirm: true}).then(function(e) {
            if (e) {
                $.blockUI({message: '<div class="ui active dimmer"><div class="ui loader"></div></div>'});
                $(".swal2-content .form").submit();
            }
        }, function(dismiss) {});
    }
}

var imagehelper = {
    previewImage: function(jqueryEl, id) {
        var input = jqueryEl.currentTarget
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $(id).attr('style', 'display');
                $(id).attr('src', e.target.result);
            };
        }
        reader.readAsDataURL(input.files[0])
    }
}

var TokenMgr = {
    getCSRFToken: function() {
        return $('meta[name="csrf-token"]').attr('content');
    }
}
