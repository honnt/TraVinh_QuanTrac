/*----- DOM Option Loại trạm -----*/
$.getJSON("services/call_categories_option.php", function (data_category) {
    $.each(data_category, function (key, value) {
        $('#loaitram')
            .append($("<option></option>")
                .attr('value', value.id).text(value.name));
    });
})
