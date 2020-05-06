var purpose = []; /*** mảng Mục đích ***/
var standard = []; /*** mảng Quy chuẩn ***/

$(window).load(function () {
    jQuery(function($){
        $("#purposetype option:first").attr("selected", "selected");
        $("#standardtype option:first").attr("selected", "selected");

        /*** Option Mục đích ***/
        $.ajax({
            async: false,
            type: "get",
            url: protocol + host + geoserver + "typeName=quantracdt:purpose" + format_geoJSON,
            success: function(data) {
                var features = data.features;
                var len = features.length;
                var str = "";
                str = '<option value="0">Lựa chọn mục đích</option>';
                for(var i = 0; i < len; i++) {
                    var properties = features[i].properties;
                    purpose.push({id:properties.id, name:properties.name,description:properties.description});
                    str += '<option value="' + properties.id + '" ' +
                        ((properties.id == 1) ? 'checked="checked"' : '') + '>' +
                        properties.name + "</option>";
                }
                $("#purposetype").html(str);
            },
            error: function (xhr, ajaxOptions, thrownError) {
            }
        });

        /*** Option Quy chuẩn ***/
        $.ajax({
            async: false,
            type: "get",
            url: protocol + host + geoserver + "typeName=quantracdt:standard" + format_geoJSON,
            success: function(data) {
                var features = data.features;
                var len = features.length;
                var str = "";
                str = '<option value="0">Lựa chọn quy chuẩn</option>';
                for(var i = 0; i < len; i++) {
                    var properties = features[i].properties;
                    standard.push({id:properties.id, name:properties.name, obstypeid:properties.obstypeid});
                    str += '<option value="' + properties.id + '" ' +
                        ((properties.id == 1) ? 'checked="checked"' : '') + '>' +
                        properties.name + "</option>";
                }
                $("#standardtype").html(str);
            },
            error: function (xhr, ajaxOptions, thrownError) {
            }
        });
    })
})
