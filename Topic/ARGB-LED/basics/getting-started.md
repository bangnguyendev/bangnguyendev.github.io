---
title: Getting Started
hide:
  # - navigation
  # - toc
---

## Welcome to the ARGB Happy Smart Light wiki!

### Nhãn dán trên sản phẩm
![connectionsA](/Topic/ARGB-LED/image/ARGB_1CH_100_TEM_DAN.png)

### 3D sản phẩm

<img src="/Topic/ARGB-LED/image/3D_box_PCB1_2024-06-16.png" loading="lazy">

<img src="/Topic/ARGB-LED/image/3D_PCB1_mat-truoc.png" loading="lazy">

<img src="/Topic/ARGB-LED/image/3D_PCB1_mat-sau.png" loading="lazy">

<img src="/Topic/ARGB-LED/image/3D_PCB1.png" loading="lazy">


### Hướng dẫn kết nối cơ bản

Mạch có thể điều khiển cho dãy ARGB Led 5v hoặc 12v (ưu tiên 5V dễ dàng kết nối hơn)


#### Mạch dây led 5v

Đối với mạch dây LED **điện áp 5V** thì chỉ cần **nguồn 5v (1A-10A)** gắn vào **chân VIN và chân GND**

**VLED sử dụng chung nguồn 5V** được nên có thể kết nối `V+/5v` vào chân **VLED trên bo mạch.**

![strip_led_5v.png](/Topic/ARGB-LED/image/strip_led_5v.png)

#### Mạch dây led 12v

Đối với mạch dây LED sử dụng **điện áp 12V** thì chỉ cần **nguồn 5v (1A-10A)** gắn vào chân **VIN và chân GND**

**VLED** sử dụng **nguồn 12V RIÊNG**

Ngõ vào **VLED** trên bo mạch **BỎ TRỐNG**.

![strip_led_12v.png](/Topic/ARGB-LED/image/strip_led_12v.png)


{: .box-note}
Kết nối `DIN` của led strip WS2812 hoặc dây led tương tự chuẩn SPI vào vị trí `DATA` của bo mạch điều khiển. 

**Note:** _Hãy đãm bảo răng tất cả các dây led được nối chung GND nếu sử dụng nhiều dây led_

![connectionsA](https://github.com/Aircoookie/WLED-Docs/assets/59397047/78cc27f3-f0e4-4c04-bd3f-d35caf143456)

### Reset cứng - SW_BTN:

`SW_BTN` trên bo mạch có 3 tính năng tích hợp:

1. Làm một nút nhấn tích hợp tích năng chuyển hiệu ứng, macro, ...
2. **Nhấn giữ phím lâu hơn >6 giây** rồi thả ra thì các cài đặt về Wifi sẽ được đưa về mặc định
  - Lúc này mạch sẽ phát Wifi có tên: `ARGB-AP` với mật khẩu là `argb1234`
3. **Nhấn giữ phím lâu hơn >12 giây** rồi thả ra thì sẽ xóa toàn bộ bộ nhớ trong mạch.


<div class="post-img-post">
    <img src="/Topic/ARGB-LED/image/SW_BTN.png" loading="lazy">
</div>

### Reset mềm:

Truy cập vào bo mạch bằng địa chỉ IP hoặc ứng dụng điều khiển `ARGB v1.0.0` chúng ta có thể reset bo mạch, khởi động lại, và đặt lại wifi!

{: .box-warning}
**Liên hệ:** 0784.140494 (Bằng - Kỹ thuật)

{: .box-warning}
**Liên hệ:** 0936.601944 (Hiền - Sale)