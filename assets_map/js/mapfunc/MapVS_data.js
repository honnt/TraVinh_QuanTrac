/*---- Tạo biến URL ----*/
/*** Biến không có dữ liệu không gian ***/
var dt_para = protocol + host + geoserver + "typeName=quantracdt:parameter" + format_JSON;
var dt_stdpara = protocol + host + geoserver + "typeName=quantracdt:standardparameter" + format_JSON;
var dt_unit = protocol + host + geoserver + "typeName=quantracdt:unit" + format_JSON;

/*** Tạo mảng Parameter và Standard Parameter***/
var list_dt_para = [];
var list_dt_stdpara = [];
var list_dt_unit = [];

/*** Theo standard Parameter ***/
var para_name = [];
var para_name_unit = [];

/*** Theo Parameter ***/
var para_unit = [];

/*---- Tạo biến DOM bảng thông số ----*/
var content_dt_para = "<table class='table table-striped table-bordered table-condensed'>" +
    "<thead>" +
        "<th style='width: 150px'>Thông số</th>" +
        "<th>Đơn vị</th>" +
    "</thead>" +
    "<tbody>" +
        "<tr>" +
            "<td colspan='2' style='text-align: center'>" +
                "<div class='pretty p-image p-plain' style='margin-top: 10px'>" +
                    "<input type='checkbox'>" +
                    "<div class='state'>" +
                        "<img class='image image-checkbox' src='assets/images/checkbox.png'>" +
                        "<label>Tất cả</label>" +
                    "</div>" +
                "</div>" +
            "</td>" +
        "</tr>";

jQuery(function($){
    /*** Ajax mảng Parameter ***/
    $.ajax({
        type: "get",
        url: dt_para,
        success: function(data) {
            var features = data.features;
            var len = features.length;

            for(var i = 0; i < len; i++) {
                var properties = features[i].properties;
                list_dt_para.push({
                    id: properties.id,
                    name: properties.name,
                });
                /*** DOM từng thông số vào từng dòng trong bảng thông số ***/
                content_dt_para +=
                    "<tr>" +
                        "<td>" +
                            "<div class='pretty p-image p-plain' style='margin-top: 10px'>" +
                                "<input type='checkbox'>" +
                                "<div class='state'>" +
                                    "<img class='image image-checkbox' src='assets/images/checkbox.png'>" +
                                    "<label>" + properties.name + "</label>" +
                                "</div>" +
                            "</div>" +
                        "</td>" +
                        "<td>" +
                            "<label style='margin-top: 6px'>Đơn vị</label>" +
                        "</td>" +
                    "</tr>";
            }
            content_dt_para = content_dt_para + "</tbody>" + "</table>";
            $("#para_tab").html(content_dt_para);

            /*** Ajax mảng Standard Parameter ***/
            $.ajax({
                type: "get",
                url: dt_stdpara,
                success: function(data) {
                    var features = data.features;
                    var len = features.length;
                    for(var i = 0; i < len; i++) {
                        var properties = features[i].properties;
                        list_dt_stdpara.push({
                            id: properties.id,
                            parameterid: properties.parameterid,
                            unitid: properties.unitid
                        });
                    }

                    /*** Push mảng Para name ***/
                    for (var dt_para_attr in list_dt_para) {
                        for (var dt_stdpara_attr in list_dt_stdpara) {
                            if (list_dt_para[dt_para_attr].id == list_dt_stdpara[dt_stdpara_attr].parameterid) {
                                para_name.push({
                                    spid: list_dt_stdpara[dt_stdpara_attr].id,
                                    name: list_dt_para[dt_para_attr].name,
                                    unitid: list_dt_stdpara[dt_stdpara_attr].unitid,
                                })
                            }
                        }
                    }

                    /*** Ajax mảng Unit ***/
                    $.ajax({
                        type: "get",
                        url: dt_unit,
                        success: function (data) {
                            var features = data.features;
                            var len = features.length;
                            for (var i = 0; i < len; i++) {
                                var properties = features[i].properties;
                                list_dt_unit.push({
                                    id: properties.id,
                                    name: properties.name,
                                });
                            }

                            /*** Push mảng Para name unit ***/
                            for (var dt_unit_attr in list_dt_unit) {
                                for (var para_name_attr in para_name) {
                                    if (list_dt_unit[dt_unit_attr].id == para_name[para_name_attr].unitid) {
                                        para_name_unit.push({
                                            spid: para_name[para_name_attr].spid,
                                            name: para_name[para_name_attr].name,
                                            unitid: para_name[para_name_attr].unitid,
                                            unit_name: list_dt_unit[dt_unit_attr].name
                                        })
                                    }
                                }
                            }

                            /*** Push mảng Para unit
                            for (var dt_para_attr in list_dt_para) {
                                for (var para_name_unit_attr in para_name_unit) {
                                    if (list_dt_para[dt_para_attr].name == para_name_unit[para_name_unit_attr].name) {
                                        para_unit.push({
                                            name: list_dt_para[dt_para_attr].name,
                                            unit_name: para_name_unit[para_name_unit_attr].unit_name
                                        })
                                    }
                                }
                            }
                            console.log(para_unit) ***/
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                        }
                    });
                },
                error: function (xhr, ajaxOptions, thrownError) {
                }
            });
        },
        error: function (xhr, ajaxOptions, thrownError) {
        }
    });
})
