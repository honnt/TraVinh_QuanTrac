/*---- Tạo biến URL ----*/
/*** Biến có dữ liệu không gian ***/
var dongthap_huyen = protocol + host + geoserver + "typeName=quantracdt:district" + format_geoJSON;

/*** Biến không có dữ liệu không gian ***/
var quantracdt_loaihinh = protocol + host + geoserver + "typeName=quantracdt:observationtype" + format_JSON;
var quantracdt_loaitram = protocol + host + geoserver + "typeName=quantracdt:category" + format_JSON;

/*---- Tạo mảng lưu trữ loại hình/loại trạm quan trắc ----*/
var list_dongthap_huyen = [];
var list_dt_loaihinh = [];
var list_dt_loaitram = [];

$(window).load(function () {
    jQuery(function ($) {
        /*** Search Advanced ***/
        $("#district option:first").attr("selected", "selected");
        $("#loaitram option:first").attr("selected", "selected");
        $("#loaihinh option:first").attr("selected", "selected");
        /*** Statistic ***/
        $("#loaitram_stat option:first").attr("selected", "selected");
        $("#loaihinh_stat option:first").attr("selected", "selected");
        $("#district_stat option:first").attr("selected", "selected");

        /*** Ajax mảng huyện ***/
        $.ajax({
            async: false,
            type: "get",
            url: dongthap_huyen,
            success: function (data) {
                var features = data.features;
                var len = features.length;
                var str_search = "", str_stats = "";
                str_search = '<option checked>Cả tỉnh</option>';
                str_stats = '<option checked>Lựa chọn quận/huyện</option>'
                for (var i = 0; i < len; i++) {
                    var properties = features[i].properties;
                    list_dongthap_huyen.push({
                        id: properties.id,
                        name: properties.name,
                    });
                    str_search += '<option>' + properties.name + "</option>";
                    str_stats += '<option>' + properties.name + "</option>";
                }
                /*** Search Advanced ***/
                $("#district").html(str_search);
                /*** Statistic ***/
                $("#district_stat").html(str_stats);
            },
            error: function (xhr, ajaxOptions, thrownError) {
            }
        });

        /*** Ajax mảng loại trạm ***/
        $.ajax({
            async: false,
            type: "get",
            url: quantracdt_loaitram,
            success: function (data) {
                var features = data.features;
                var len = features.length;
                var str_search = "", str_stats = "";
                str_search = '<option checked>Tất cả loại trạm</option>';
                str_stats = '<option checked>Lựa chọn loại trạm</option>'
                for (var i = 0; i < len; i++) {
                    var properties = features[i].properties;
                    list_dt_loaitram.push({
                        id: properties.id,
                        name: properties.name,
                    });
                    str_search += '<option>' + properties.name + "</option>";
                    str_stats += '<option>' + properties.name + "</option>";
                }
                $("#loaitram").html(str_search);
                $("#loaitram_stat").html(str_stats);
            },
            error: function (xhr, ajaxOptions, thrownError) {
            }
        });

        /*** Ajax mảng loại hình ***/
        $.ajax({
            async: false,
            type: "get",
            url: quantracdt_loaihinh,
            success: function (data) {
                var features = data.features;
                var len = features.length;
                var str_search = "", str_stats = "";
                str_search = '<option checked>Tất cả loại hình</option>';
                str_stats = '<option checked>Lựa chọn loại hình</option>'
                for (var i = 0; i < len; i++) {
                    var properties = features[i].properties;
                    list_dt_loaihinh.push({
                        id: properties.id,
                        code: properties.code,
                        name: properties.name,
                    });
                    str_search += '<option>' + properties.name + "</option>";
                    str_stats += '<option>' + properties.name + "</option>";
                }
                $("#loaihinh").html(str_search);
                $("#loaihinh_stat").html(str_stats);
            },
            error: function (xhr, ajaxOptions, thrownError) {
            }
        });
    })
})
