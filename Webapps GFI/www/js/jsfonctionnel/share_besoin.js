$(document).ready(function () {
    $("#Share").click(function (event) {
    event.preventDefault();
     return $.ajax({
            url: "https://snapat.000webhostapp.com/interaction/creation_besoin.php",
            type: "POST",
            data : new FormData($('#form_share')[0]),
            success: function (msg) { 
             alert("ok");
            },
            error: function (e) {
             alert("ok");
            },
            contentType: false,
            cache: false,
            processData: false
     });
        });
        });