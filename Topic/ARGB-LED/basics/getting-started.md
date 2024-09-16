---
title: Bộ điều khiển led ARGB
meta-title: Bộ điều khiển led ARGB
# subtitle: "... Welcome to ARGB"
bigimg:
  - "/Topic/ARGB-LED/image/3D_PCB1_mat-truoc.png"
image: "image/BANER__ARGB.png"
tags: [ARGB, ws2811, ws2812b, strip leds]
hide:
  # - navigation
  # - toc
---

### 💡 Thông tin chi tiết sản phẩm


| **Thông tin**                  | **Chi tiết**                                                                 |
|---------------------------------|------------------------------------------------------------------------------|
| **Tên sản phẩm**                | Happy Smart Light                                                           |
| **Model**                       | ARGB_1CH_100                                                                |
| **Nguồn cấp**                   | VLED (+5V DC)                                                               |
| **Số kênh**                     | 1 hoặc 2 kênh:                                                              |
|                                 | - 1 kênh: DATA `IO16` (CLK: `IO43`)                                              |
|                                 | - 2 kênh: DATA1: `IO16` (DATA), DATA2: `IO43` (CLK)                             |
| **Tải**                         | 800 Led/kênh                                                                |
| **Dòng điện tải tối đa**         | **10A Max** (Có thể thay đổi cầu chì nếu cần dòng lớn hơn)                      |
| **Nhiệt độ hoạt động**          | -20°C đến +60°C                                                             |
| **Chỉ số bảo vệ IP**            | IP20                                                                        |
| **Chân kết nối**                | - **GND**: Nối đất                                                         |
|                                 | - **VLED**: Nguồn cấp cho đèn (+5V DC)                                          |
|                                 | - **DATA**: Dữ liệu đầu vào                                                  |
|                                 | - **CLK**: Xung nhịp đầu vào                                                 |
| **Chân kết nối nguồn**          | VIN (VCC = +5V DC) và GND                                                   |

### ❓ Hướng Dẫn Sử Dụng

#### 1. **Kết Nối Nguồn**
Kết nối nguồn **+5V DC** vào chân **VLED** và **GND**.

Khi nguồn được kết nối chính xác, **LED báo nguồn** màu đỏ sẽ sáng lên. 

Nếu **LED nguồn không sáng**, hãy thực hiện các bước kiểm tra sau:
   1. Kiểm tra bộ cấp nguồn để đảm bảo vẫn hoạt động bình thường.
   2. Xác nhận kết nối đúng chân **+** và **-** của nguồn DC với mạch ARGB.
   3. Kiểm tra **cầu chì FH1** trên mạch có bị đứt không.
   4. Kiểm tra mạch có phát được **WiFi ARGB-AP** hoặc điều khiển LED bình thường hay không. Nếu mạch vẫn hoạt động, **LED báo nguồn** có thể bị hỏng mà không ảnh hưởng đến hiệu suất mạch.

**Mạch** được bảo vệ bằng **hai cầu chì**:
   - **FH1**: Bảo vệ quá dòng.
   - **F1**: Bảo vệ chống đấu ngược cực và chập mạch dây LED.

#### 2. **Kết Nối Điều Khiển**
   - Đối với **1 kênh**: Kết nối chân **DATA** với **IO16** và **CLK** với **IO43**.
   - Đối với **2 kênh**: Kết nối **DATA1** với **IO16** và **DATA2** với **IO43**.

#### 3. **Kiểm Tra Tải**
Đảm bảo tổng số LED không vượt quá **800 LED mỗi kênh**.

#### 4. **Kiểm Tra Nhiệt Độ Hoạt Động**
Thiết bị hoạt động tốt trong khoảng nhiệt độ từ **-20°C đến +60°C**.

#### 5. **Chỉ Số Bảo Vệ IP**
Với chỉ số **IP20**, thiết bị **không có khả năng chống nước**, cần tránh lắp đặt tại các khu vực ẩm ướt.

### 🗒️ Lưu Ý
- **Dòng điện tải tối đa 10A**: Để sử dụng dòng điện lớn hơn, hãy thay thế cầu chì **FH1** với cầu chì có dòng định mức phù hợp, tối đa là **65A**.
- Đảm bảo kết nối đúng nguồn **+5V DC** để tránh gây hư hại thiết bị.

### 3D sản phẩm

<img src="/Topic/ARGB-LED/image/3D_box_PCB1_2024-06-16.png" loading="lazy">

<img src="/Topic/ARGB-LED/image/3D_PCB1_mat-truoc.png" loading="lazy">

<img src="/Topic/ARGB-LED/image/3D_PCB1_mat-sau.png" loading="lazy">

<img src="/Topic/ARGB-LED/image/3D_PCB1.png" loading="lazy">


### ❓ Hướng dẫn kết nối chi tiết

Mạch điều khiển ARGB LED có khả năng hỗ trợ cả dãy đèn LED ARGB **5V** và **12V**. Dưới đây là hướng dẫn chi tiết và hai phương án kết nối khi sử dụng **LED 12V**.

#### 💡 Kết nối mạch với dãy LED 5V

Khi sử dụng dãy **LED 5V**, quá trình đấu nối rất đơn giản vì **nguồn cung cấp và điều khiển** chỉ cần một loại điện áp. Cụ thể:

1. **Nguồn điện**: Cấp nguồn **5V DC** với dòng từ **1A đến 10A** tùy vào tổng số lượng LED được sử dụng. Đảm bảo kết nối:
   - **Chân VIN** trên bo mạch nối với **cực dương(+)** của nguồn 5V (**V+/5V**).
   - **Chân GND** nối với **cực âm(-)** của nguồn 5V (**GND**).

2. **VLED**: Vì bo mạch và dãy LED cùng sử dụng **nguồn 5V**, bạn có thể kết nối trực tiếp chân **VLED** trên bo mạch với chân **V+/5V** của nguồn điện. Điều này giúp nguồn 5V dùng chung cho cả bo mạch điều khiển và dãy LED.

3. **Dữ liệu điều khiển**: Đấu nối dây **DATA** từ bo mạch tới chân **DATA IN** của dãy LED để truyền tín hiệu điều khiển màu sắc.

![strip_led_5v.png](/Topic/ARGB-LED/image/strip_led_5v.png)

<div class="post-img-post">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/DeOOavXX0Rc?si=2wvS_iYyyimDP4ao" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>

#### 💡 Kết nối mạch với dãy LED 12V

Đối với dãy **LED 12V**, có hai phương án đấu nối tùy thuộc vào việc bạn có sử dụng nguồn 5V riêng cho bo mạch điều khiển hay không. Tuy nhiên, **dù sử dụng phương án nào cũng cần đảm bảo rằng GND của nguồn cấp cho bo mạch điều khiển và GND của dãy LED phải được nối chung** để đảm bảo sự ổn định của hệ thống.

##### Phương án 1: Sử dụng nguồn 5V riêng cho bo mạch

1. **Nguồn điện cho bo mạch**: Bo mạch yêu cầu **nguồn 5V DC** với dòng từ **1A đến 10A**:
   - **Chân VIN** trên bo mạch nối với cực dương của nguồn 5V (**V+/5V**).
   - **Chân GND** của bo mạch nối với cực âm của nguồn 5V (**GND**).

2. **Nguồn điện cho LED**: 
   - Dãy LED **12V** cần nguồn **12V riêng**.
   - **Chân VLED** trên bo mạch **không cần kết nối** và phải **bỏ trống**.

3. **Kết nối chung GND**: Đảm bảo rằng **GND của nguồn cấp cho bo mạch** và **GND của dãy LED** được nối chung để đảm bảo sự ổn định và chính xác trong việc truyền tín hiệu điều khiển.

4. **Dữ liệu điều khiển**: Kết nối dây **DATA** từ bo mạch tới chân **DATA IN** của dãy LED để truyền tín hiệu điều khiển chính xác.

##### Phương án 2: Sử dụng mạch giảm áp từ 12V xuống 5V

1. **Mạch giảm áp**: Sử dụng **mạch giảm áp** từ 12V xuống 5V để cấp nguồn cho bo mạch điều khiển.
   - **Đầu vào** của mạch giảm áp kết nối với nguồn **12V**.
   - **Đầu ra** của mạch giảm áp cấp nguồn **5V** cho bo mạch điều khiển thông qua chân **VIN** và **GND**.

2. **Nguồn điện cho dãy LED**: 
   - Dãy LED **12V** được cấp điện trực tiếp từ nguồn **12V**.
   - **Chân VLED** trên bo mạch vẫn **bỏ trống**.

3. **Kết nối chung GND**: Cần đảm bảo rằng **GND của nguồn 12V**, **GND của mạch giảm áp**, **GND của bo mạch điều khiển**, và **GND của dãy LED** đều được nối chung để tránh gây ra các vấn đề về xung điện và tín hiệu điều khiển.

4. **Dữ liệu điều khiển**: Như thường lệ, kết nối dây **DATA** từ bo mạch tới chân **DATA IN** của dãy LED để truyền tín hiệu điều khiển.

#### 🗒️ Lưu ý kỹ thuật
- Với **LED 12V**, **bất kể sử dụng phương án nào**, **GND của nguồn điều khiển bo mạch** và **GND của dãy LED** phải được **nối chung** để hệ thống hoạt động ổn định và chính xác.
- Nếu sử dụng **mạch giảm áp**, đảm bảo mạch giảm áp có khả năng cung cấp đủ dòng **5V** cho bo mạch điều khiển.


**Note:** _Hãy đãm bảo răng tất cả các dây led được nối chung GND nếu sử dụng nhiều dây led_

![connectionsA](https://github.com/Aircoookie/WLED-Docs/assets/59397047/78cc27f3-f0e4-4c04-bd3f-d35caf143456)


### Chọn nguồn DC

<div class="post-img-post">
  <img src="/Topic/ARGB-LED/image/nguon led 5v.webp" loading="lazy">
</div>

Khi chọn nguồn tổ ong 5V dòng cao, hãy lưu ý những điểm sau:

1. **Chọn thương hiệu uy tín** như Meanwell, LRS để đảm bảo chất lượng.
2. **Đảm bảo công suất và dòng đủ lớn** cho hệ thống.
3. **Bảo vệ ngắn mạch, quá tải** để an toàn cho thiết bị.
4. **Hiệu suất cao** (trên 85%) giúp giảm nhiệt và kéo dài tuổi thọ.
5. **Tản nhiệt tốt** và có chứng nhận an toàn (CE, UL, RoHS).
6. **Chọn nguồn dư tải** để tránh quá tải và ổn định hơn.
7. **Xem đánh giá người dùng** và đảm bảo sản phẩm có bảo hành đầy đủ.

Những yếu tố này giúp hệ thống hoạt động ổn định và an toàn hơn.

### Reset cứng - SW_BTN

`SW_BTN` trên bo mạch có 3 tính năng tích hợp:

1. Làm một nút nhấn tích hợp tích năng chuyển hiệu ứng, macro, ...
2. **Nhấn giữ phím lâu hơn >6 giây** rồi thả ra thì các cài đặt về Wifi sẽ được đưa về mặc định
  - Lúc này mạch sẽ phát Wifi có tên: `ARGB-AP` với mật khẩu là `argb1234`
3. **Nhấn giữ phím lâu hơn >12 giây** rồi thả ra thì sẽ xóa toàn bộ bộ nhớ trong mạch.


<div class="post-img-post">
    <img src="/Topic/ARGB-LED/image/SW_BTN.png" loading="lazy">
</div>

### Reset mềm

Truy cập vào bo mạch bằng địa chỉ IP hoặc ứng dụng điều khiển `ARGB v1.0.0` chúng ta có thể reset bo mạch, khởi động lại, và đặt lại wifi!

{: .box-warning}
**Liên hệ:** 0784.140494 (Bằng - Kỹ thuật)

{: .box-warning}
**Liên hệ:** 0936.601944 (Hiền - Sale)