<?php
    include "config.php";
?>

<?php
    /*** Querry lựa chọn loại trạm ***/
    $querry_option_categories = 'SELECT * FROM "Category"';
    $result = pg_query($travinh_db, $querry_option_categories);
    if (!$result) {
        echo "Không có dữ liệu.\n";
        exit;
    }

    /*** Chuyển định dạng từ Array sang Geojson ***/
    while ($row = pg_fetch_assoc($result)) {
       var_dump(json_encode($row));
    }
?>