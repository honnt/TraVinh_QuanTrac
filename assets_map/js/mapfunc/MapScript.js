/*---- Control Base Map ----*/
var Basemaps_Control = [
    L.tileLayer('https://mt1.google.com/vt/lyrs=p&x={x}&y={y}&z={z}', {
        attribution: 'Google Terrain',
        subdomains: 'abcd',
        maxZoom: 20,
        minZoom: 0,
        label: 'Bản đồ địa hình Google',
        iconURL: 'https://mt1.google.com/vt/lyrs=p&x=101&y=60&z=7'
    }),

    L.tileLayer('//{s}.tile.stamen.com/toner-lite/{z}/{x}/{y}.png', {
        attribution: 'Map tiles by',
        subdomains: 'abcd',
        maxZoom: 20,
        minZoom: 0,
        label: 'Bản đồ đơn giản',  // optional label used for tooltip
        iconURL: 'assets/images/b_tile.stamen.png'

    }),

    L.tileLayer('http://gis.chinhphu.vn/BaseMap/{z}/{x}/{y}.png', {
        attribution: 'Map tiles by gischinhphu',
        subdomains: 'abcd',
        maxZoom: 20,
        minZoom: 0,
        label: 'Bản đồ hành chính',
        iconURL: 'assets/images/gis_chinhphu.png'
    }),

    L.tileLayer('http://mt0.google.com/vt/lyrs=s&hl=en&x={x}&y={y}&z={z}', {
        attribution: 'Google Satellite',
        subdomains: 'abcd',
        maxZoom: 20,
        minZoom: 0,
        label: 'Ảnh vệ tinh Google',
        iconURL: 'http://mt0.google.com/vt/lyrs=s&hl=en&x=101&y=60&z=7'
    }),

    L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
        attribution: 'Map tiles by Esri',
        subdomains: 'abcd',
        maxZoom: 20,
        minZoom: 0,
        label: 'Ảnh vệ tinh ESRI',
        iconURL: 'http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/7/60/101'
    }),
]

/*---- Đọc WMS Geosever ----*/

/*---- Đem biến map ra ngoài cấu trúc nested của getJSON để không bị lỗi invalidateSize bên main.js ----*/
var map = L.map('mymap', {
        center: [9.80, 106.32],
        zoom: 11,
        zoomControl: false,
    }
);

/*---- GPS user ----*/
var gps = new L.Control.Gps({
    autoCenter: true,
    maxZoom: 11,
});

gps.on('gps:located', function (e) {
    e.marker.bindPopup(e.latlng.toString()).openPopup()
}).on('gps:disabled', function (e) {
    e.marker.closePopup()
});

gps.addTo(map);

/*---- Fullscreen Leaflet ----*/
L.control.fullscreen({
    position: 'topleft',
    title: 'Phóng to bản đồ',
    titleCancel: 'Thu nhỏ bản đồ ',
}).addTo(map);

/*---- Zoom Home ----*/
var zoomHome = L.Control.zoomHome();
zoomHome.addTo(map);

/*---- Biến tìm kiếm quan trắc cơ bản ----*/
var quantrac_search = [];

/*** Tạo Pulse Marker ***/
var pulse_marker;
var pulsingIcon = L.icon.pulse({
    iconSize: [13, 13],
    color: '#ff0000',
    fillColor: 'rgba(255,255,255,0)',
    heartbeat: 1
});

/*---- Hàm Zoom on Click marker ----*/
function markerOnClick(e) {
    var latLngs = [e.target.getLatLng()];
    var lat = latLngs[0]['lat'];
    var lng = latLngs[0]['lng'] - 0.005;
    var markerBounds = L.latLngBounds([lat, lng], [lat, lng]);
    map.fitBounds(markerBounds, {
        maxZoom: 15
    });
}

/*---- Tạo biến URL ----*/
/*** Biến có dữ liệu không gian ***/
/// var travinh_quantrac = protocol + host + geoserver + "typeName=quantracdt:observationstation" + format_geoJSON + sortBy;
$.getJSON("assets_map/data/point_demo.geojson", function (data_quantrac) {
    var categories_quantrac = {}, category_quantrac;

    function add_quantrac(data, map) {
        L.geoJSON(data, {
            onEachFeature: function (feat, layer) {

                /*** Thông tin trạm quan trắc ***/
                var content_info = "<table class='table table-striped table-bordered table-condensed'>" +
                    "<tr><th class='blue'><i class='icon-home4' style='font-size: 14px; " +
                    "margin-top: -2px; margin-left: 1px;'></i>" +
                    "&nbsp;Tên trạm</th><td colspan='3' style='font-weight: bold; " +
                    "text-align: center'>" + feat.properties.tentram + "</td></tr>" +
                    "<tr><th class='brown'><i class='icon-location3' style='font-size: 16px; margin-top: -2px'></i>" +
                    "&nbsp;Địa điểm</th><td>" + feat.properties.quanhuyen + "</td>" +
                    "<th class='brown'><i class='icon-server' style='font-size: 16px; margin-top: -2px'></i>" +
                    "&nbsp;Loại trạm</th><td>" + feat.properties.loaitram + "</td></tr>" +
                    "<tr><th class='brown'><i class='icon-lab' style='font-size: 16px; margin-top: -2px'></i>" +
                    "&nbsp;Loại hình</th><td>" + feat.properties.loaihinh + "</td>" +
                    "<th class='brown'><i class='icon-office' style='font-size: 14px; " +
                    "margin-top: -2px; margin-left: 1px;'></i>" +
                    "&nbsp;Tổ chức</th><td>" + "Chưa cập nhật" + "</td></tr>" +
                    "<tr><th class='brown'><i class='icon-watch2' style='font-size: 14px; " +
                    "margin-top: -2px; margin-left: 1px;'></i>" +
                    "&nbsp;Thành lập</th><td>" + "Chưa cập nhật" + "</td>" +
                    "<th class='brown'><i class='icon-connection' style='font-size: 12px; margin-top: -2px'></i>" +
                    "&nbsp;Trạng thái</th><td>" + "<span class='badge bg-info bg-active-qt'>" +
                    "Đang hoạt động" + "</span>" + "</td></tr>" +
                    "<table>";

                /*** Số liệu trạm quan trắc mới nhất ***/
                var content_data_qt = "<table class='table table-striped table-bordered table-condensed'>";
                content_data_qt = content_data_qt + "<tr><th class='blue' style='text-align: center'>Thời gian</th>" +
                    "<td style='text-align: center'>" + "2019-07-07" + " " + "02:35:00" + "</td></tr>" +
                    "<tr><th class='blue' style='text-align: center'>" + "Nhu cầu Oxy hóa học" +
                    "</th><td style='text-align: center'>" + "33.32" + "</td></tr>";

                $.getJSON("assets_map/data/data_viewchart_demo.json", function (data_viewchart_demo) {
                    render_chart_quantrac("chart_para_1", data_viewchart_demo, "Nhu cầu Oxy hóa học",
                        "Thời gian", "Nhu cầu Oxy hóa học");
                })

                layer.on({
                    click: function (e) {
                        $("#feature-title").html(feat.properties.tentram);
                        $("#info_qt").html(content_info);
                        $("#data_qt").html(content_data_qt);
                        /* $("#chart_qt").html(content_chart); */

                        $("#featureModal").modal("show");
                        pulse_marker = L.marker([feat.geometry.coordinates[1],
                            feat.geometry.coordinates[0]], {
                            icon: pulsingIcon
                        }).addTo(map)
                    }
                });

                /*** Modal off function ***/
                $('.closemodal').click(function () {
                    map.removeLayer(pulse_marker)
                });

                /*** Tạo mảng quantrac_search ***/

                // category_quantrac = feat.properties.loaitram;
                category_quantrac = feat.properties.obstypes;
                if (typeof categories_quantrac[category_quantrac] === "undefined") {
                    // console.log(category_quantrac);
                    categories_quantrac[category_quantrac] = L.layerGroup().addTo(map);
                }
                categories_quantrac[category_quantrac].addLayer(layer);

                /*--- Control Layer Data cho bộ điểm quan trắc ---*/
            },

            pointToLayer: function (feat, latlng) {
                return L.marker(latlng).on('click', markerOnClick);
            }
        });
    };
    add_quantrac(data_quantrac, map);

    /*** Legend
    var quantrac_legend = L.control({position: "topleft"});
    quantrac_legend.onAdd = map => {
        var div = L.DomUtil.create('div', 'info legend');

        div.innerHTML =
            "<div class='legend-content'>" +
            "<div class='legend'>" +
            ("<p class='title-legend-chart'>Ký hiệu trạm quan trắc</p>") +
            ("<div class='container_poi'>" +
                "<div class='overlay_poi' style='background-color: #cf540f;'></div>" +
                "<div class='icon-checkbox-unchecked2 iconmoon_poi' style=''></div>" +
                "<span class='label_legend_poi_iconmoon'>" + "Trạm quan trắc đất" + "</span>" +
                "</div>") + '<br>' +
            ("<div class='container_poi'>" +
                "<div class='overlay_poi' style='background-color: #606060;'></div>" +
                "<div class='icon-air iconmoon_poi'></div>" +
                "<span class='label_legend_poi_iconmoon' style=''>" + "Trạm quan trắc không khí" + "</span>" +
                "</div>") + '<br>' +
            ("<div class='container_poi'>" +
                "<div class='overlay_poi' style='background-color: #009cff;'></div>" +
                "<div class='icon-wave2 iconmoon_poi'></div>" +
                "<span class='label_legend_poi_iconmoon'>" + "Trạm quan trắc nước mặt" + "</span>" +
                "</div>") + '<br>' +
            ("<div class='container_poi'>" +
                "<div class='overlay_poi' style='background-color: #276a91;'></div>" +
                "<div class='icon-graph iconmoon_poi'></div>" +
                "<span class='label_legend_poi_iconmoon' style=''>" + "Trạm quan trắc nước ngầm" + "</span>" +
                "</div>") + '<br>' +
            ("<div class='container_poi'>" +
                "<div class='overlay_poi' style='background-color: #009d27;'></div>" +
                "<div class='icon-alert iconmoon_poi' style='margin-top: 6px'></div>" +
                "<span class='label_legend_poi_iconmoon' style=''>" + "Trạm quan trắc nước thải" + "</span>" +
                "</div>") +
            "</div>" +
            "</div>";
        var draggable = new L.Draggable(div);
        draggable.enable();
        return div;
    }; ***/

    /*** Control Legend
    $('#switch_legend').change(function () {
        if ($(this).prop('checked')) {
            map.addControl(quantrac_legend);
        } else {
            map.removeControl(quantrac_legend);
        }
    }); ***/
})

map.addControl(
    L.control.basemaps({
        basemaps: Basemaps_Control,
        tileX: 0,  // tile X coordinate
        tileY: 0,  // tile Y coordinate
        tileZ: 1   // tile zoom level
    })
);
