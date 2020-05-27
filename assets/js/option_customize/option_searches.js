/*----- DOM Option Loại trạm -----*/
$.getJSON("services/call_categories_option.php", function (data_category) {
    $('#loaitram')
        .append($("<option></option>")
            .attr('value', 'none').text("Lựa chọn loại trạm"));
    $.each(data_category, function (key, value) {
        $('#loaitram')
            .append($("<option></option>")
                .attr('value', value.name).text(value.name));
    });
})

/*----- DOM Option Loại hình -----*/
jQuery(document).ready(function ($) {
    $.getJSON("services/call_obstyles_option.php", function (data_obstyles) {
        $('#loaihinh').kendoTreeView({
            checkboxes: {
                checkChildren: true
            },
            dataSource: data_obstyles,
            check: onCheck
        });
        $('#quantrac')
            .append($("<option></option>")
                .attr('value', '0').text('Lựa chọn trạm quan trắc'));
    })
})

/*----- DOM Option Huyện -----*/
$.getJSON("services/call_districts_option.php", function (data_district) {
    $('#district')
        .append($("<option></option>")
            .attr('value', 'none').text("Lựa chọn quận huyện"));
    $.each(data_district, function (key, value) {
        $('#district')
            .append($("<option></option>")
                .attr('value', value.name).text(value.name));
    });
})