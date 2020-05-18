<?php
    $travinh_db = pg_connect("host=localhost 
        port=5432 
        dbname=travinh_quantrac 
        user=postgres 
        password=0888365051"
    );
    if (!$travinh_db) {
        echo "Kết nối thất bại.\n";
        exit;
    } else {
        echo "Kết nối thành công.\n";
    }

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