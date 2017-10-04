function supp(id) {
    $.ajax({
        url: "https://snapat.000webhostapp.com/interaction/delete_besoin.php/?id="+id,
        type: "GET",
        success: function (e) {
        location.reload();
        },
        error: function (e) {
        location.reload();
        }
    });
}