/*----- DOM Option Loại trạm -----*/
$.getJSON("services/call_categories_option.php", function (data_category) {
    $('#loaitram')
        .append($("<option></option>")
            .attr('value', 0).text("Lựa chọn loại trạm"));
    $.each(data_category, function (key, value) {
        $('#loaitram')
            .append($("<option></option>")
                .attr('value', value.id).text(value.name));
    });
})

/*----- DOM Option Loại hình -----*/
jQuery(document).ready(function ($) {
    $.getJSON("services/call_obstyles_option.php", function (data_obstyles) {
        $('#loaihinh').comboTree({
            source: data_obstyles,
            isMultiple: true,
            cascadeSelect: true,
            collapse: false
        });
    })
})

/*----- DOM Option Huyện -----*/
$.getJSON("services/call_districts_option.php", function (data_district) {
    $('#district')
        .append($("<option></option>")
            .attr('value', 0).text("Lựa chọn quận huyện"));
    $.each(data_district, function (key, value) {
        $('#district')
            .append($("<option></option>")
                .attr('value', value.id).text(value.name));
    });
})