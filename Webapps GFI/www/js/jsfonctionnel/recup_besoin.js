$(document).ready(function () {
    $.ajax({
        url: "interaction/recuperation_besoin.php",
        type: "GET",
        dataType: 'json',
        success: function (data) {
            for (var i = 0; i < data.length; i++)
            {
                
                var val = data[i];
                $('#tableau_besoin')
                        .append('<tr class="clickable-row" id="' + i + '">'
                            + '<td>' + val.title + '</td>'
                            + '<td>' + val.dateCreation + '</td>'
                            + '<td>' + val.name + '</td>'
                            + '<td>' + val.status + '</td>'
                         + '</tr>');
            }

            },
                error: function (e) {

                }
    });
});