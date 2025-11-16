use sakila;
-- 1.Nhiệm vụ 1: Thêm một Khách hàng Mới.
insert into sakila.customer(store_id, first_name, last_name, email, address_id)
value(2, 'ANNA', 'HILL', 'ANNA.HILL@sakilacustomer.org', 5);
-- 2.Nhiệm vụ 2: Cập nhật Địa chỉ Email cho một Nhóm Khách hàng.
update sakila.customer 
set email = replace(email,'@sakilacustomer.org' , '@sakilacustomer.com')
where first_name = 'JENNIFER' and email like '%@sakilacustomer.org';
-- 3.Nhiệm vụ 3: Xử lý Yêu cầu Xóa Tài khoản (Tạm thời).
update sakila.customer
set active = 0
where customer_id = 25; 
/*customer
Trong hệ thống kinh doanh, "soft delete" (đánh dấu không hoạt động) được ưu tiên hơn "hard delete" (xóa hẳn).
Lý do:
1. Dữ liệu khách hàng cũ rất quan trọng cho phân tích hành vi, thống kê, báo cáo doanh thu. 
   Nếu xóa vĩnh viễn, doanh nghiệp sẽ mất toàn bộ lịch sử giao dịch liên quan.
2. Soft delete giúp khôi phục tài khoản dễ dàng khi khách hàng quay lại.
   Hard delete khiến việc phục hồi gần như không thể.
3. Giảm rủi ro sai sót: nếu nhân viên lỡ xóa nhầm bằng DELETE, dữ liệu mất hoàn toàn.
   Soft delete an toàn và được dùng trong hầu hết hệ thống lớn.
=> Vì vậy, phần lớn hệ thống chọn UPDATE active = 0 thay vì DELETE.
*/

