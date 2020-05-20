<?php
    include "config.php";
?>

<?php
    /*** Querry Thông tin trạm quan trắc
    Áp dụng cho trường hợp gọi xem thuộc tính bảng quan trắc và search tìm kiếm ***/

    $querry_tramqt = 'SELECT
                            "station"."id", "station"."code", "station"."name",
                            "station"."coordx", "station"."coordy",
                            "station"."establishyear", "station"."terminatedate", 
                            "station"."maintenance", "station"."active", 
                            "station"."the_geom", "station"."obstypes",
                            "category"."name" "categoryName", 
                            "organization"."name" "organizationName", 
                            "enterprise"."name" "enterpriseName", 
                            "basin"."name" "basinName", 
                            "location"."name" "locationName"
                            /* "district"."name" "districtName" */ 
                            
                        FROM "Observationstation" "station"
                        LEFT JOIN "Category" "category" ON "category"."id" = "station"."categoryid"
                        LEFT JOIN "Organization" "organization" ON "organization"."id" = "station"."organizationid"
                        LEFT JOIN "Enterprise" "enterprise" ON "enterprise"."id" = "station"."enterpriseid"
                        LEFT JOIN "Basin" "basin" ON "basin"."id" = "station"."basinid"
                        LEFT JOIN "Location" "location" ON "location"."id" = "station"."locationid"
                        /* LEFT JOIN "District" "district" ON "district"."id" = "station"."districtid" */
                            
                        ORDER BY "station"."name" ASC';
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
                /* 'districtName' => $value['districtName'], */
                'locationName' => $value['locationName'],
                'obstypes' => $value['obstypes'],
                'establishyear' => $value['establishyear'],
                'terminatedate' => $value['terminatedate'],
                'maintenance' => $value['maintenance'],
                'active' => $value['active']
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
