$(document).ready(function () {
    $("#Connexion").click(function (event) {
    event.preventDefault();
        $.ajax({
            url: "http://localhost:80/test/interaction/connexion_commercial.php",
            type: "POST",
            data : new FormData($('#form_connect')[0]),
            
            success: function (msg) { 
              if(msg === 1){
                  console.log(1);
                window.location = 'http://localhost:8383/Webapps%20GFI/Listedesbesoins.html'; 
              }else{
                  console.log(0);
                window.location = 'http://localhost:8383/Webapps%20GFI/index.html'; 
              }
            },
            error: function (msg) {
              console.log(msg);
            },
            contentType: false,
            cache: false,
            processData: false
        });

    });
});
