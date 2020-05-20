/*---- Search Basic ----*/
$(document).one("ajaxStop", function () {
    $("#loading").hide();
    sizeLayerControl();

    /*** Search tên điểm quan trắc ***/
    var quantracBH = new Bloodhound({
        name: "quantrac_search",
        datumTokenizer: function (d) {
            return Bloodhound.tokenizers.whitespace(d.name);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        local: quantrac_search,
        limit: 10
    });

    /*** Search loại trạm quan trắc ***/
    var quantrac_loaitramBH = new Bloodhound({
        name: "quantrac_search",
        datumTokenizer: function (d) {
            return Bloodhound.tokenizers.whitespace(d.loaitram);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        local: quantrac_search,
        limit: 10
    });

    /*** Search loại hình quan trắc ***/
    var quantrac_loaihinhBH = new Bloodhound({
        name: "quantrac_search",
        datumTokenizer: function (d) {
            return Bloodhound.tokenizers.whitespace(d.loaihinh);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        local: quantrac_search,
        limit: 10
    });

    /*** Search quận huyện quan trắc ***/
    var quantrac_districtBH = new Bloodhound({
        name: "quantrac_search",
        datumTokenizer: function (d) {
            return Bloodhound.tokenizers.whitespace(d.address);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        local: quantrac_search,
        limit: 10
    });

    quantracBH.initialize();
    quantrac_loaitramBH.initialize();
    quantrac_loaihinhBH.initialize();
    quantrac_districtBH.initialize();

    $("#searchbox").typeahead({
        minLength: 1,
        highlight: false,
        hint: false
    }, {
        /*** Tên quan trắc ***/
        name: "quantrac_search",
        displayKey: "name",
        source: quantracBH.ttAdapter(),
        templates: {
            header: "<h4 class='typeahead-header'>" +
                "<i class='icon-home4 brown' style='font-size: 16px; margin-top: -2px'></i>" +
                "<span class='brown'>&nbsp;Trạm quan trắc</span>" +
                "</h4>",
            suggestion: Handlebars.compile(["" +
            "<i class='icon-home4' style='font-size: 13px; margin-top: -2px'></i>&nbsp;" +
            "<span style='font-weight: bolder'>{{name}}</span>" +
            "<br><i class='icon-location3' style='font-size: 16px; margin-top: -2px'></i>" +
            "&nbsp;<small>Địa điểm:&nbsp;" + "{{quanhuyen}}</small>" +
            "<br><i class='icon-lab' style='font-size: 16px; margin-top: -2px'></i>" +
            "&nbsp;<small>Loại hình:&nbsp;" + "{{loaihinh}}</small>" +
            "<br><i class='icon-server' style='font-size: 16px; margin-top: -2px'></i>" +
            "&nbsp;<small>Loại trạm:&nbsp;" + "{{loaitram}}</small>"
            ].join(""))
        }
    }, {
        /*** Loại trạm quan trắc ***/
        name: "quantrac_search",
        displayKey: "loaitram",
        source: quantrac_loaitramBH.ttAdapter(),
        templates: {
            header: "<h4 class='typeahead-header'>" +
                "<i class='icon-server brown' style='font-size: 16px; margin-top: -2px'></i>" +
                "<span class='brown'>&nbsp;Loại trạm quan trắc</span>" +
                "</h4>",
            suggestion: Handlebars.compile(["" +
            "<i class='icon-server' style='font-size: 16px; margin-top: -2px'></i>&nbsp;" +
            "<span style='font-weight: bolder'>{{loaitram}}</span>" +
            "<br><i class='icon-home4' style='font-size: 13px; margin-top: -2px'></i>" +
            "&nbsp;<small>Tên trạm:&nbsp;" + "{{name}}</small>" +
            "<br><i class='icon-location3' style='font-size: 16px; margin-top: -2px'></i>" +
            "&nbsp;<small>Địa điểm:&nbsp;" + "{{quanhuyen}}</small>" +
            "<br><i class='icon-lab' style='font-size: 16px; margin-top: -2px'></i>" +
            "&nbsp;<small>Loại hình:&nbsp;" + "{{loaihinh}}</small>"
            ].join(""))
        }
    }, {
        /*** Loại hình quan trắc ***/
        name: "quantrac_search",
        displayKey: "loaihinh",
        source: quantrac_loaihinhBH.ttAdapter(),
        templates: {
            header: "<h4 class='typeahead-header'>" +
                "<i class='icon-lab brown' style='font-size: 16px; margin-top: -2px'></i>" +
                "<span class='brown'>&nbsp;Loại hình quan trắc</span>" +
                "</h4>",
            suggestion: Handlebars.compile(["" +
            "<i class='icon-lab' style='font-size: 16px; margin-top: -2px'></i>&nbsp;" +
            "<span style='font-weight: bolder'>{{loaihinh}}</span>" +
            "<br><i class='icon-home4' style='font-size: 13px; margin-top: -2px'></i>" +
            "&nbsp;<small>Tên trạm:&nbsp;" + "{{name}}</small>" +
            "<br><i class='icon-location3' style='font-size: 16px; margin-top: -2px'></i>" +
            "&nbsp;<small>Địa điểm:&nbsp;" + "{{quanhuyen}}</small>" +
            "<br><i class='icon-server' style='font-size: 16px; margin-top: -2px'></i>" +
            "&nbsp;<small>Loại trạm:&nbsp;" + "{{loaitram}}</small>"
            ].join(""))
        }
    }, {
        /*** Huyện/thành phố quan trắc ***/
        name: "quantrac_search",
        displayKey: "address",
        source: quantrac_districtBH.ttAdapter(),
        templates: {
            header: "<h4 class='typeahead-header'>" +
                "<i class='icon-location4 brown' style='font-size: 16px; margin-top: -2px'></i>" +
                "<span class='brown'>&nbsp;Huyện/Thành phố</span>" +
                "</h4>",
            suggestion: Handlebars.compile(["" +
            "<i class='icon-location3' style='font-size: 16px; margin-top: -2px'></i>&nbsp;" +
            "<span style='font-weight: bolder'>{{quanhuyen}}</span>" +
            "<br><i class='icon-home4' style='font-size: 13px; margin-top: -2px'></i>" +
            "&nbsp;<small>Tên trạm:&nbsp;" + "{{name}}</small>" +
            "<br><i class='icon-server' style='font-size: 16px; margin-top: -2px'></i>" +
            "&nbsp;<small>Loại trạm:&nbsp;" + "{{loaitram}}</small>" +
            "<br><i class='icon-lab' style='font-size: 16px; margin-top: -2px'></i>" +
            "&nbsp;<small>Loại hình:&nbsp;" + "{{loaihinh}}</small>"
            ].join(""))
        }
    }).on("typeahead:selected", function (obj, datum) {
        if (datum.source === "quantrac_search") {
            map.setView([datum.lat, datum.lng], 15);

            /*** Tự động mở Modal sau khi Zoom ***/
            if (map._layers[datum.id]) {
                map._layers[datum.id].fire("click");
            }
        }

        if ($(".navbar-collapse").height() > 50) {
            $(".navbar-collapse").collapse("hide");
        }
    }).on("typeahead:opened", function () {
        $(".navbar-collapse.in").css("max-height", $(document).height() - $(".navbar-header").height());
        $(".navbar-collapse.in").css("height", $(document).height() - $(".navbar-header").height());
    }).on("typeahead:closed", function () {
        $(".navbar-collapse.in").css("max-height", "");
        $(".navbar-collapse.in").css("height", "");
    });
    $(".twitter-typeahead").css("position", "static");
    $(".twitter-typeahead").css("display", "block");
})

/*---- Search Advanced ----*/
function search_list_tramqt() {
    /*** Remove toàn bộ option trước khi tìm tiếm để add Option mới ***/
    $('#quantrac').find('option').remove();

    var loaitram = document.getElementById("loaitram").value;
    var loaihinh = document.getElementById("loaihinh").value;
    var district = document.getElementById("district").value;
    var loaitram_choose = [], loaihinh_choose = [], distric_choose = [];

    let count_choose = 0;
    for (var attr_modal in quantrac_search) {
        var datum = quantrac_search[attr_modal];
        // console.log(datum.loaitram);
        if (datum.loaitram == loaitram) {
            // console.log(loaitram_choose);
            loaitram_choose = datum;
            if (loaitram_choose.loaihinh == loaihinh) {
                loaihinh_choose = loaitram_choose;
                if (loaihinh_choose.address == district) {
                    distric_choose = loaihinh_choose;
                    // console.log(distric_choose);
                    $('#quantrac').append(`<option>${distric_choose.name}</option>`);
                    count_choose += 1;
                } else if (district == "Cả tỉnh") {
                    distric_choose = loaitram_choose
                    // console.log(distric_choose);
                    $('#quantrac').append(`<option>${distric_choose.name}</option>`);
                    count_choose += 1;
                }
            } else if (loaihinh == "Tất cả loại hình") {
                loaihinh_choose = datum;
                if (loaihinh_choose.address == district) {
                    distric_choose = loaihinh_choose;
                    // console.log(distric_choose);
                    $('#quantrac').append(`<option>${distric_choose.name}</option>`);
                    count_choose += 1;
                } else if (district == "Cả tỉnh") {
                    distric_choose = datum;
                    // console.log(distric_choose);
                    $('#quantrac').append(`<option>${distric_choose.name}</option>`);
                    count_choose += 1;
                }
            }
        } else if (loaitram == "Tất cả loại trạm") {
            loaitram_choose = datum;
            if (loaitram_choose.loaihinh == loaihinh) {
                loaihinh_choose = datum;
                if (loaihinh_choose.address == district) {
                    distric_choose = loaihinh_choose;
                    // console.log(distric_choose);
                    $('#quantrac').append(`<option>${distric_choose["name"]}</option>`);
                    count_choose += 1;
                } else if (district == "Cả tỉnh") {
                    distric_choose = loaitram_choose;
                    // console.log(distric_choose);
                    $('#quantrac').append(`<option>${distric_choose["name"]}</option>`);
                    count_choose += 1;
                }
            } else if (loaihinh == "Tất cả loại hình") {
                loaihinh_choose = loaitram_choose;
                if (loaihinh_choose.address == district) {
                    distric_choose = datum;
                    // console.log(distric_choose);
                    $('#quantrac').append(`<option>${distric_choose["name"]}</option>`);
                    count_choose += 1;
                } else if (district == "Cả tỉnh") {
                    distric_choose = datum;
                    // console.log(distric_choose);
                    $('#quantrac').append(`<option>${distric_choose["name"]}</option>`);
                    count_choose += 1;
                }
            }
        }
    }
    // console.log(count_choose)
    if (count_choose == 0) {
        $(".search-error").css("display", "block");
        $(".search-success").css("display", "none");
    } else {
        $(".search-success span").text(" Tìm thấy " + count_choose + " trạm quan trắc");
        $(".search-success").css("display", "block");
        $(".search-error").css("display", "none");
    }
}

function search_tramqt() {
    var tramqt = document.getElementById("quantrac").value;

    for (var attr_modal in quantrac_search) {
        var datum = quantrac_search[attr_modal];
        if (tramqt == datum.name) {
            map.setView([datum.lat, datum.lng], 15);

            /*** Tự động mở Modal sau khi Zoom ***/
            if (map._layers[datum.id]) {
                map._layers[datum.id].fire("click");
            }
        }
    }
}
