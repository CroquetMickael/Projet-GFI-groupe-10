$(document).ready(function () {
    $("#Connexion").click(function (event) {
    event.preventDefault();
        $.ajax({
            url: "interaction/connexion_commercial.php",
            type: "POST",
            data : new FormData($('#form_connect')[0]),
            success: function (msg) { 
              if(msg == 1){
                window.location = 'Listesdesbesoins.html'  ; 
              }else{
                window.location = 'index.html'  ; 
              }
            },
            error: function (e) {
              
            },
            contentType: false,
            cache: false,
            processData: false
        });

    });
});
