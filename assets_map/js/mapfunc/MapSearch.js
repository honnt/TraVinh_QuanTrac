/*----- Search Basic -----*/
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
            return Bloodhound.tokenizers.whitespace(d.quanhuyen);
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
        displayKey: "quanhuyen",
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

/*----- Search Advanced -----*/
console.log(quantrac_search);

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
