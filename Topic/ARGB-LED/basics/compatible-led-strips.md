---
title: Compatible LED strips
meta-title: Compatible LED strips
# subtitle: "... Welcome to ARGB"
bigimg:
  - "/Topic/ARGB-LED/image/3D_PCB1_mat-truoc.png"
image: "image/BANER__ARGB.png"
tags: [ARGB, ws2811, ws2812b, strip leds]

---

**ARGB v1.0.0** hỗ trợ hai loại dải LED: dải LED **digital addressable** (có thể điều khiển từng LED riêng biệt) và dải LED **analog non-addressable** (không thể điều khiển từng LED riêng biệt).

## Dải LED Addressable

Dải LED Addressable cho phép điều khiển từng LED riêng biệt, cho phép sử dụng nhiều hiệu ứng khác nhau. Các loại được hỗ trợ được liệt kê bên dưới. Đôi khi có những loại mới xuất hiện trên thị trường có giao thức điều khiển tương thích.

**Phân loại:** Chỉ có dữ liệu 5V, Dữ liệu + Clock 5V, Chỉ có dữ liệu 12V

| Loại | Điện áp | Ghi chú |
|---|---|---|
| SK6812 | 5&nbsp;V / 12&nbsp;V | RGBW |
| WS2811 | 5&nbsp;V | thường thấy trong dây pixel IP68, 12mm |
| WS2812B | 5&nbsp;V | |
| WS2813 | 5&nbsp;V | có đường truyền dữ liệu dự phòng |
| APA102 | 5&nbsp;V | sử dụng 2 chân dữ liệu, Clock và Data |
| LPD8806 | 5&nbsp;V | sử dụng 2 chân dữ liệu, Clock và Data |
| WS2801 | 5&nbsp;V | sử dụng 2 chân dữ liệu, Clock và Data |
| SK9822 | 5&nbsp;V | sử dụng 2 chân dữ liệu, Clock và Data |
| UCS8903 | 5&nbsp;V | |
| GS8208 | 12&nbsp;V | |
| TM1814 | 12&nbsp;V | RGBW |
| WS2805 | 12&nbsp;V / 24&nbsp;V | RGBCCT, nhóm 3 LED (12V) / 6 LED (24V) như một LED logic. Dự phòng đường dữ liệu. Hai kênh trắng cho Correlated Color Temperature (CCT) |
| WS2811 | 12&nbsp;V | thường là đoạn 3 LED, có điện trở trên đường dữ liệu |
| WS2814 | 12&nbsp;V / 24&nbsp;V | RGBW, nhóm 3 LED (12V) / 6 LED (24V) như một LED logic. Điều khiển như loại SK6812, thứ tự màu: BRG, hoán đổi W và G (có từ WLED 0.14.0-b1) |
| WS2815 | 12&nbsp;V | có đường truyền dữ liệu dự phòng |
| FW1906 | 24&nbsp;V | RGBCCT, nhóm 6 LED như một LED logic. Hai kênh trắng cho Correlated Color Temperature (CCT) (có từ WLED 0.15.0-b2) |
| LPD6803 | 12&nbsp;V | |
| P9813 | 5-24&nbsp;V | |
| TM1829 | 5-24&nbsp;V | |
| UCS8904 | 5-24&nbsp;V | RGBW |

## Dải LED Non-Addressable

**ARGB v1.0.0** cũng hỗ trợ dải LED **non-addressable**. Không giống như dải addressable, dải non-addressable yêu cầu một chân cho mỗi kênh "màu" và tất cả các LED được điều khiển cùng một cách. Để điều khiển các dải này, cần các mạch bổ sung (MOSFETs). 

**ARGB v1.0.0** hỗ trợ các dải LED đơn sắc, CCT, RGB, RGBW và RGBCCT. Các dải này thường có điện áp 12V hoặc 24V. Tần số PWM mặc định cho việc làm mờ là 19531 Hz trên **ARGB v1.0.0**. 

