/*---- Search Basic (bên MapScript.js) ----*/
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
