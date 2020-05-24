<?php
    include "config.php";
?>

<?php
    /*** Querry Thông tin trạm quan trắc
    Áp dụng cho trường hợp gọi xem thuộc tính bảng quan trắc và search tìm kiếm ***/

    /*** Select Data ***/
    $loaitram = $_GET['loaitram'];
    $quanhuyen = $_GET['quanhuyen'];
    $querry_tramqt_select = 'SELECT
                            "station"."id", "station"."code", "station"."name",
                            "station"."coordx", "station"."coordy",
                            "station"."establishyear", "station"."terminatedate", 
                            "station"."maintenance", "station"."active", 
                            "station"."the_geom",
                            "category"."name" "categoryName", 
                            "organization"."name" "organizationName", 
                            "enterprise"."name" "enterpriseName", 
                            "basin"."name" "basinName", 
                            "location"."name" "locationName",
                            "district"."name" "districtName",
							string_agg("obs_type"."name", \'; \') "obstype_namelist"
							
                        FROM "Observationstation" "station"
                        LEFT JOIN "Category" "category" ON "category"."id" = "station"."categoryid"
                        LEFT JOIN "Organization" "organization" ON "organization"."id" = "station"."organizationid"
                        LEFT JOIN "Enterprise" "enterprise" ON "enterprise"."id" = "station"."enterpriseid"
                        LEFT JOIN "Basin" "basin" ON "basin"."id" = "station"."basinid"
                        LEFT JOIN "Location" "location" ON "location"."id" = "station"."locationid"
                        LEFT JOIN "District" "district" ON "district"."id" = "station"."districtid"
						LEFT JOIN "Obstype_Station" "obs_station" ON "obs_station"."stationid" = "station"."id"
						LEFT JOIN "ObservationType" "obs_type" ON "obs_type"."id" = "obs_station"."obstypesid"';

    /*** Group and Order Data ***/
    $querry_tramqt_group = ' GROUP BY "station"."id", "category"."name", "organization"."name", 
                            "enterprise"."name", "basin"."name", "location"."name", "district"."name"
                            ORDER BY "station"."name" ASC';

    /*** Where Condition Data (1=1 là không có điều kiện xảy ra)***/
    $querry_tramqt_where = '1=1';
    if ($quanhuyen != '1=1') {
        $querry_tramqt_where.=' AND "district"."name" = '.$quanhuyen;
    }
    if ($loaitram != '1=1') {
        $querry_tramqt_where.=' AND "category"."name" = '.$loaitram;
    }

    /*** Gộp 3 chuỗi trên tạo thành câu truy vấn ***/
    $querry_tramqt = $querry_tramqt_select.' WHERE '.$querry_tramqt_where.$querry_tramqt_group;
    // echo $querry_tramqt;
    $result = pg_query($travinh_db, $querry_tramqt);
    if (!$result) {
        echo "Không có dữ liệu.\n";
        exit;
    }

    /*** Chuyển định dạng từ Array sang Geojson ***/
    $data = array();
    while ($row = pg_fetch_assoc($result)) {
        $data[] = $row;
    }

    $jsonData = json_encode($data);
    $original_data = json_decode($jsonData, true);
    $features = array();
    foreach ($original_data as $key => $value) {
        $features[] = array(
            'type' => 'Feature',
            'properties' => array(
                'id' => $value['id'],
                'code' => $value['code'],
                'name' => $value['name'],
                'organizationName' => $value['organizationName'],
                'categoryName' => $value['categoryName'],
                'basinName' => $value['basinName'],
                'enterpriseName' => $value['enterpriseName'],
                'districtName' => $value['districtName'],
                'locationName' => $value['locationName'],
                'establishyear' => $value['establishyear'],
                'terminatedate' => $value['terminatedate'],
                'maintenance' => $value['maintenance'],
                'active' => $value['active'],
                'obstype_namelist' => $value['obstype_namelist']
            ),
            'geometry' => array(
                'type' => 'Point',
                'coordinates' => array(
                    floatval($value['coordx']),
                    floatval($value['coordy'])
                ),
            ),
        );
    }
    $new_data = array(
        'type' => 'FeatureCollection',
        'features' => $features,
    );

    $final_data = json_encode($new_data, JSON_PRETTY_PRINT);
    echo $final_data;
?>
