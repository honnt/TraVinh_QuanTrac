# Quan trắc Trà Vinh

### References
+ https://datatables.net/forums/discussion/29866/datatables-buttons-removes-the-length-menu
+ https://datatables.net/reference/option/dom
+ https://www.amcharts.com/docs/v4/concepts/formatters/formatting-date-time/
+ https://stackoverflow.com/questions/39612553/add-custom-dropdown-list-datatables-plugin-in-correct-layout
+ https://www.amcharts.com/docs/v4/tutorials/customizing-chart-scrollbar/

### Note giao diện (Thư viện)
+ Phần export biểu đồ: sử dụng export của Amchart
+ Phần export bảng dữ liệu: sử dụng export của Datatables
+ Sửa Modal Exporting trong Amchart ==> Sửa trong thư viện Core.js

### Note giao diện (đề xuất)
+ Hiển thị kết quả thống kê
    + Giới hạn số lượng trạm so sánh: 3 ==> Bảng biểu và chart hiển thị tối đa 3 trạm (done)
    + Bảng dữ liệu báo cáo: đề xuất làm Dropdown hiển thị Chart (pending)
+ Nút toggle thay đổi (xóa ==> thay đổi cơ chế làm mờ)  ==> làm nút toggle nhỏ hơn
+ Làm gọn panel heading (bấm xố dropdown nhưng không làm nút, cái đầu tiên mặc định mở) ==> done
+ Bỏ chú thích bản đồ (done)
+ Làm baner to hơn (done)
+ Bỏ nút Copy và Print, đổi màu đỏ cho các nút hiển thị 1 giờ, 8 giờ và 24 giờ (done)
+ Tool chạy batch files để ở trang Admin (tool chạy bằng Php)
+ Làm phần Scrollbar width to hơn (done)

+ Hiện số liệu trạm quan trắc:
    + Đối với trạm tự động: có hiện chart
    + Đối với trạm bán tự động: không hiện chart nhưng hiện bảng số liệu 
    Datatables cho từng mẫu (không hiện số mới nhất)
    + Dom nhiều thuộc tính từ DB
    + Các mẫu theo hàng, chí tiêu theo hàng (Scrollbar ngang)

### Note kết nối Service Php Postgress
+ Tạo file config Php (Thông tin kết nối database)
+ Tạo file Geojson từ truy vấn Php PostgreSQL (link: https://stackoverflow.com/questions/31885031/formatting-json-to-geojson-via-php)
