<?php
    include "config.php";
    ?>

<?php
    /*** Querry Example Data ***/
    $result = pg_query($travinh_db, 'SELECT * FROM public."Unit" ORDER BY id ASC ');
    if (!$result) {
        echo "Không có dữ liệu.\n";
        exit;
    }

    /*** Show Example Data and Convert to Json ***/
    while ($row = pg_fetch_assoc($result)) {
        var_dump(json_encode($row));
    }
?>
