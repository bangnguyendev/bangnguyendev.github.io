---
layout: post
title: "Một nút nhấn nhiều chức năng"
meta-title: "A Button for Multi Mode"
subtitle: "...Sử dụng nút nhấn với hàm millis()"
bigimg:
  - "/img/2020-11-12-mot-nut-nhan-nhieu-tinh-nang/anh-bia.jpg"
image: /img/2020-11-12-mot-nut-nhan-nhieu-tinh-nang/anh-bia.jpg
tags: [button, pullup, pull up, nút nhấn, điện trở kéo lên, chống dội nút nhấn, debounce button]
# gh-repo: bangnguyendev/SmartClock
# gh-badge: [star, watch, fork, follow]
# comments: true
---
## Giới thiệu về nút nhấn
**Nút nhấn** là một phần cứng khá cơ bản và dễ dàng sử dụng. `Nút nhấn cơ học` là loại mình sẽ giới thiệu trong bài viết này. Hầu hết những bạn mới bắt đầu làm quen với điện tử thì đều quen với việc sử dụng nút nhấn. 

### Phân loại
Các loại **nút nhấn cơ học** phổ biến bao gồm:

{: .box-note}
Cơ chế `lò xo` bên trong `vận hành hai trạng thái` này (`nhấn` và `thả`) của một nút nhấn. Các `nút bấm` được `phân loại` chủ yếu `thành` các `nút ấn thường mở`, `thường đóng` và `nhấn kép`.

<div class="post-img-post">
    <img src="/img/2020-11-12-mot-nut-nhan-nhieu-tinh-nang/cacloainutnhan.png">
	<a href="https://codienhaiau.com/category/nut-nhan/">Các loại nút nhấn.</a>
</div>

------------------------------------------
**`Repo có chứa Source code`** mình ví dụ trong bài viết này: [SmartClock](https://github.com/bangnguyendev/SmartClock)

**Nay mình sử dụng nút nhấn tự nhả - thường mở** (dùng theo kiểu trở kéo lên nhé  - `pull up resistor`) để giới thiệu về cách `sử dụng` khá hay ho `khi chúng ta bị giới hạn PIN GPIO` trên MCU.

<div class="post-img-post">
    <img src="/img/2020-11-12-mot-nut-nhan-nhieu-tinh-nang/nut-nhan-pull-up.png">

</div>

Các bạn có thể tìm hiểu của nút nhấn sài **trở kéo lên** hoặc **trở kéo xuống** ở bài viết này:

{: .box-note}
**Note:** [Xác định trạng thái của một nút nhấn](http://arduino.vn/bai-viet/161-bai-11-xac-dinh-trang-thai-cua-mot-nut-nhan-button-inputpullup)

-----------------------------------

## Mục đích của bài viết này là giải quyết vấn đề bị giới hạn phần cứng và PIN GPIO ở MCU.

<div class="post-img-post">
    <img src="/img/2020-11-12-mot-nut-nhan-nhieu-tinh-nang/checkbutton.png">
	Nội dung code trong bài giới thiệu.
</div>


Nhìn vào hình ảnh trên chúng ta thấy hàm `CheckButton_ndb()` được đặt trong `loop()` của MCU.

### Chống dội phím cho phím nhấn cơ học

Vì là nút nhấn cơ học nên khi thực hiện thao tác bấm (hoặc k bấm mà do yếu tố môi trường độ ẩm, nhiễm nước nhẹ) sẽ xảy ra hiện tượng dội phím gây nhiễn tín hiệu INPUT có thể làm chương trình chạy sai ý đồ. (**#debounce button**)

<div class="post-img-post">
    <img src="/img/2020-11-12-mot-nut-nhan-nhieu-tinh-nang/chong-doi-phim.jpg">
	Debounce button.
</div>

Như trong hình thì khoảng thời gian `Fluctuations` chính là lúc xảy ra dội phím làm cho tín hiệu nhảy mức logic 1-0 loạn xạ và làm MCU xử lý sai lệch nếu đọc tín hiệu này.
Để khắc phục tình trạng trên thì khi coding chúng ta sử dụng phương pháp chống dội bằng `delay()` (có nhiều phương pháp, mỗi phương pháp có ưu điểm, nhược điểm khác nhau. Với **#tag** mình để phía trên các bạn có thể tìm kiếm `google` để tìm hiểu thêm).

**Source code mẫu:**
{% highlight c linenos %}
if (digitalRead(Button_Mode) == HIGH) // nếu nút bấm ở mức cao
{
    delay(500); //check chac chan la do ng nhan nut
    if (digitalRead(Button_Mode) == HIGH)
    {
        // thực hiện lệnh
    }
}
{% endhighlight %}
*Nhìn vào Source code mẫu:*

Lệnh <kbd>#line1</kbd> sẽ check xem nút nhấn có đang được nhấn hay không - **`HIGH`**? 

Nếu sau khoảng thời gian `delay(500);` mà tín hiệu vẫn đang ỏ mức **`HIGH`** thì chính xác là do con người cố ý tác động việc nhấn nút. 

Còn sau `500ms` - <kbd>#line3</kbd> mà việc check ở <kbd>#line4</kbd> không thỏa mãn - **`LOW`** thì đó chỉ là xung nhiễu hoặc nút nhấn vô tình bị cấn nhẹ gì đấy.

-------------------------

### Tìm hiểu hàm millis

{: .box-note}
**`millis()`** có nhiệm vụ trả về một số - là thời gian (tính theo mili giây) kể từ lúc mạch Arduino bắt đầu chương trình của bạn. `Nó sẽ tràn số và quay số 0 (sau đó tiếp tục tăng) sau 50 ngày` *(tức là cho phép đo đạc binh thường khoảng 50 ngày)*.

{: .box-note}
**`Trả về`** một số nguyên kiểu `unsigned long` là thời gian kể từ lúc thương trình Arduino được khởi động

{: .box-warning}
**Tham khảo thêm:** [Tìm hiểu hàm millis](http://arduino.vn/reference/micros) - diễn đàn ArduinoVN

--------------------------

### Áp dụng thực tiễn

**`Nguyên lí làm việc`** của nút nhấn là khi **chúng ta nhấn giữ nút ở khoảng bao lâu thời gian** thì **mỗi khoảng thời gian** sẽ **là một mode lựa chọn khác nhau**. Khi chúng ta **nhả nút ra thì sẽ chọn mode đó**. *(Giống mấy nút nhấn trên màn hình LCD xe máy Winner, Exceter, Raider...)*

<div class="post-img-post">
    <img src="/img/2020-11-12-mot-nut-nhan-nhieu-tinh-nang/checkbutton2.png">
	Hàm CheckButton_ndb() cho ví dụ bên dưới.
</div>

Nhìn vào <kbd>#line324</kbd>, chúng ta khởi tạo một biến `startTime` và nó được gán bằng `millis()`. Điều này có nghĩa là ngay khi chương trình chạy tới lệnh này thì giá trị truyền về của hàm `millis()` sẽ được gán cho biến `startTime`.

Ví dụ, ngay khi `chương trình hoạt động` thì hàm `millis() được chạy từ 0ms`, chạy tới khi nó đụng cái lệnh <kbd>#line324</kbd> thì hết `50 mili giây`. Thì ngay lúc đó biến `startTime = 50`.

*Sài kiểu biến phạm vi local vì mỗi lần chúng ta nhấn nút thì muốn nó lấy giá trị thời gian tại thời điểm đó.*

Tại thời điểm <kbd>#line327</kbd>, lệnh `while (digitalRead(Button_Mode) == HIGH)` sẽ check việc chúng ta có *`ĐANG GIỮ NÚT NHẤN`* hay không? Nếu không còn giữ nút thì thoát While, ngược lại nếu đang còn giữ nút ở mức logic `HIGH` thì check lệnh bên trong.
- Lúc này nếu còn giữ đè nút thì ở <kbd>#line330</kbd>,  `couter_Mode = (millis() - startTime) / 1000;` có nghĩa là nếu chúng ta `giữ nút nhấn trong 1000ms` (ứng với 1 giây) thì sau khoảng 1000ms thì `hàm millis() lúc này bằng 50ms trước đó cộng với 1000ms giữ phím là 1050ms`. 
- Nên biến `couter_Mode` sẽ luu trữ khoảng thời gian chúng ta nhấn giữ nút chính thúc bằng cách `lấy giá trị trả về của hàm millis()` `tại thời điểm buông nút` `trừ đi` `mốc thời gian trước khi vào việc` check giữ nút (`startTime`).

<div class="post-img-post">
    <img src="/img/2020-11-12-mot-nut-nhan-nhieu-tinh-nang/cach-tinh-thoi-gian.png">
	Mô phỏng tiến trình thời gian khi MCU hoạt động.
</div>

*Các bạn nhìn hình mô phỏng khoảng thời gian ở trên cho dễ hiểu nhé.*

**Source code:**
{% highlight c linenos %}
long startTime = millis(); // giá trị ban đầu được gán bằng giá trị hiện tại của millis
// Serial.printf("digitalRead(Button_Mode): ");
// Serial.println(digitalRead(Button_Mode));
while (digitalRead(Button_Mode) == HIGH) // đợi cho nút bấm được giữ
{
	Serial.println(millis() - startTime);
	couter_Mode = (millis() - startTime) / 1000;
	couter_Mode = couter_Mode / 1 % 10;
	lcd.setCursor(0, 0);
	lcd.print("Couter: ");
	lcd.print(couter_Mode);
	lcd.print(" seconds  ");
	if (couter_Mode < 1)
	{
		lcd.setCursor(0, 1);
		lcd.print("Mode Selection      ");
	}
	/* vao mode Message */
	else if (couter_Mode >= 7)
	{
		lcd.setCursor(0, 1);
		lcd.print("Mode: >> Message    ");
		lcd.setCursor(0, 2);
		lcd.print("                    ");
		lcd.setCursor(0, 3);
		lcd.print("                    ");
	}
	/* vao mode setup wifi */
	else if (couter_Mode >= 5)
	{
		lcd.setCursor(0, 1);
		lcd.print("Mode: >> Wifi Change");
		lcd.setCursor(0, 2);
		lcd.print("         Message    ");
		lcd.setCursor(0, 3);
		lcd.print("                    ");
	}
	/* vao mode setup vi tri thoi tiet */
	else if (couter_Mode >= 3)
	{
		lcd.setCursor(0, 1);
		lcd.print("Mode: >> Location   ");
		lcd.setCursor(0, 2);
		lcd.print("         Wifi Change");
		lcd.setCursor(0, 3);
		lcd.print("         Message    ");
	}
	/* vao mode setup bao thuc */
	else if (couter_Mode >= 1)
	{
		lcd.setCursor(0, 1);
		lcd.print("Mode: >> Alarm      ");
		lcd.setCursor(0, 2);
		lcd.print("         Location   ");
		lcd.setCursor(0, 3);
		lcd.print("         Wifi Change");
	}
	yield(); // disble Soft WDT reset - NodeMCU
};
{% endhighlight %}

Kết quả trả về của `couter_Mode` vẫn là mili giây nên chúng ta chia cho 1000 để đổi sang giây tiện việc theo dõi số liệu.

Tiếp đến, chương trình của mình có `4 Mode, mỗi Mode khoảng 2 giây`.

Nếu đè nút nhỏ `hơn 1 giây` thì có thể do cấn nút hay gì đó nên mình chỉ cho `hiển thị chuẩn bị vào chế độ chọn mode `và `nếu buông nút thì thoát khỏi chọn Mode`.

Sau đó lần lượt các `Mode từ 1 đến 3 giây`, `3 đến 5 giây`, `5 đến 7 giây`, `7 đến 9 giây`. Khi `đến 10 mình quay lại 0` ( tức là < 1) bằng cách chỉ lấy số hàng đơn vị. 


Tương tự như vậy các bạn có thể triển khai thêm cho từng Mode. `Khi vào mỗi mode riêng biệt` chúng ta `tạo thêm biến local để đong đếm khoảng thời gian` đè nút để vào các `mode con` của `Mode cha mẹ`.

----------------------------------------

## *Chúc mọi người thành công!*

*Bài viết có sử dụng một số bài link đính kèm từ diễn đàn* [*Arduino Việt Nam*](http://arduino.vn/)
*    *http://arduino.vn/reference/micros*
*    *http://arduino.vn/bai-viet/161-bai-11-xac-dinh-trang-thai-cua-mot-nut-nhan-button-inputpullup*

--------------------------

<svg viewBox="0 0 900 200">

  <!-- Symbol -->
  <symbol id="s-text">
    <text text-anchor="middle"
          x="50%" y="50%" dy=".35em">
      Hi, I'm Bang
    </text>
  </symbol>  

  <!-- Duplicate symbols -->
  <use xlink:href="#s-text" class="text"
      ></use>
  <use xlink:href="#s-text" class="text"
      ></use>
  <use xlink:href="#s-text" class="text"
      ></use>
  <use xlink:href="#s-text" class="text"
      ></use>
  <use xlink:href="#s-text" class="text"
      ></use>
</svg>

----------------------