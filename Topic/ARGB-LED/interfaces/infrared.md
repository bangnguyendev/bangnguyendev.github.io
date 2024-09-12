---
title: Infrared
meta-title: Bộ điều khiển hồng ngoại
subtitle: Các remote IR được hỗ trợ
bigimg:
  - "/Topic/ARGB-LED/image\/BANER__ARGB.png"
image: "/Topic/ARGB-LED/image\/BANER__ARGB.png"
tags: [ARGB, hồng ngoại, IR, strip leds]
category: Programming MCU
hide:
  # - navigation
  # - toc
---

### Các remote IR được hỗ trợ

Để sử dụng remote IR, hãy vào `Settings`, `Sync Interfaces` và thay đổi giá trị cho `Infrared receiver type` tương ứng với loại remote IR từ danh sách sau:

1. Remote IR 24 phím màu trắng với R, G, B + 12 tông màu  
2. Remote IR 24 phím màu trắng với nút CT+ / CT-  
3. Remote IR 40 phím màu xanh với các nút 25%, 50%, 75% và 100%  
4. Remote IR 44 phím màu trắng với mũi tên lên/xuống cho các màu R, G và B  
5. Remote IR 21 phím màu trắng với R, G, B + 9 tông màu  
6. Remote IR 6 phím màu đen với CH lên/xuống + âm lượng lên/xuống  
7. [JSON IR remote](/Topic/ARGB-LED/interfaces/json-ir/json_infrared.md) - Cấu hình dễ dàng và sử dụng bất kỳ remote IR nào.

## Điều khiển từ xa dựa trên ESP-NOW  
Từ phiên bản WLED 14.0-beta3: Điều khiển từ xa tương thích ESP-NOW đã được hỗ trợ. Một ví dụ về điều khiển từ xa này là remote „WIZmote“. Điều này dựa trên vi điều khiển ESP. ESP-NOW có thể được kích hoạt trong cài đặt WLED. Bạn cần nhập địa chỉ MAC của phần cứng điều khiển từ xa. Điều này được xác định bằng cách nhấn bất kỳ nút nào trên remote và sao chép địa chỉ MAC cuối cùng nhận được từ trường "Last Seen" vào trường "Hardware MAC" trong cài đặt ESP-NOW của WLED (“Config->WiFi Setup”) và lưu lại bằng cách nhấn "Save". Ưu điểm: không cần gắn thêm bộ thu đặc biệt vào bộ điều khiển WLED và tín hiệu được truyền qua mạng radio. Do đó, không cần đường truyền thẳng giữa điều khiển từ xa và bộ điều khiển WLED như trong trường hợp của remote IR. 

![Điều khiển từ xa ESP-NOW](\Topic\ARGB-LED\assets\images\content\pic14.jpg)  

Bốn nút "1"-"4" của remote WIZmote được liên kết với các preset 1 đến 4. Ý nghĩa của các nút khác khá dễ hiểu. Lưu ý: WIZmote cần hai pin AAA chất lượng tốt để hoạt động bình thường. Nếu pin quá yếu, tín hiệu sẽ không được gửi đúng cách, ngay cả khi đèn LED xanh trên remote sáng lên ngắn gọn, vốn báo hiệu tín hiệu đã được gửi đi.



