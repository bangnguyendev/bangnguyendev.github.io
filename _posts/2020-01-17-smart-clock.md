---
layout: post
title: "Smart Clock"
meta-title: "Smart Clock"
subtitle: "...Phần 1: Giới thiệu chút chơi"
bigimg:
  - "/img/2020-01-17-smart-clock/anh-bia-baiviet.jpg"
image: /img/2020-01-17-smart-clock/anh-bia-baiviet.jpg
tags: [đồng hồ, smart, watch, clock, alarm, thingspeak, esp8266]
# gh-repo: bangnguyendev/SmartClock
# gh-badge: [star, watch, fork, follow]
# comments: true
---
----------------------------------------------------------------------------
`Xin chào` mọi người. Đây là bài viết `đầu tiên chia sẽ` về một trong những `project` mà mình đã và đang phát triển...

Repo các bạn có thể nhấn vào các <kbd>Button Github</kbd> ở đầu bài (<kbd>star</kbd>, <kbd>watch</kbd>, <kbd>fork</kbd>, <kbd>follow</kbd>) để Clone Repo về máy tính cá nhân. Nếu máy các bạn không hiện ra thì có thể [nhấn ở đây để](https://github.com/bangnguyendev/SmartClock/ "Smart Clock") truy cập Repo.

{: .box-note}
**Khuyên dùng**: Sử dụng `Git` (GitHub Desktop, GitLab), `TortoiseGit` để lưu trữ & Clone Repo về.

Ở `bài viết này` mình sẽ **`mô tả chi tiết`** và tuần tự mọi thứ khi mình `bắt đầu` làm nó (theo phong cách kể chuyện nha). **`Cách mạng công nghiệp 4.0`** như bây giờ thì việc mua 1 cái `đồng hồ thông minh` có tính năng hay ho với giá thành vừa phải là điều rất dễ dàng. Thế nên **`bài viết`** này chi mang **`tính chất trao đổi kiến thức`**, **`kinh nghiệm`** khi đam mê làm đồ chơi `handmade` thôu nhé!

![industrial4.0](/img/2020-01-17-smart-clock/iot40.jpeg "What is the Industrial IoT?"){: .center-block :}

----------------------------------------------------------------------------
## Việc đầu tiên các bạn cần chuẩn bị:
  - **`Phần cứng:`**
    - Board ESP266 **Wemos D1 mini** (Sơ đồ nguyên lí đây [nhấn vô đây cơ](/documents/2020-01-17-smart-clock/sch_d1_mini_v3.0.0.pdf "Sơ đồ nguyên lí mạch")).
    - Một cộng cáp **`Micro USB connection`** để nạp code nha! Mình lấy cáp sạc điện thoại Samsung nạp luôn, nhưng nhớ là chuẩn **`Micro USB`** nha... ~~Type-C~~ là ngéo luôn á nha mọi người.
    - **Lcd 20x04**.
    - Mạch chuyển đổi **`I2C`** cho màn hình LCD2004.
    - Mica dày 3mm (có hay không củng không quan trọng, các bạn cứ chạy ra tiệm nào nhận cắt mica rồi đưa bản vẽ ra, họ cân tất cả. Có một số cửa hàng cắt mica khá ngon mình sẽ đính kèm địa chỉ cuối bài viết hoặc tìm gg "**Mica Sinh Viên**" - nếu bạn ở *`thành phố Hồ Chí Minh`* nhé).
    - **Buzzer** 5-12v (hoặc loa liếc gì đấy tùy vào kỹ năng chơi điện của các bạn.).
    - Một vài **cọng dây đực cái, cái đực, dây điện** (nối để test mạch hoạt động), vv...
    - Nguồn cung cấp cho ESP266 Wemod D1 (**Nguồn `5v-2A`**, dư dòng tí mình sử dụng trong các mục đích khác).

  - **`Phần mềm:`**
    - **[VS code](https://code.visualstudio.com/download "Visual Studio Code")** (khuyên dùng vì tiện nhiều thứ hơn IDE Arduino không hổ trợ).
    - **[IDE Arduino](https://www.arduino.cc/en/main/software)**.
    - Driver giao tiếp giả lập port **[CH340](https://sparks.gogo.co.nz/ch340.html)**.
    - **[Android Studio](https://developer.android.com/studio)**.

  - **`Ngôn ngữ lập trình:`**
    - Chắc chắc là **`C/C++`** là không thể thiếu sót rầu nhé.
    - Một chút tẹo tẹo về **`Java`** để chơi app Android. (Đọc hiểu củng đơn giản lắm - chỉ easy so với ứng dụng mình làm thôu nhé).
    - Một chút kiến thức về debug, vị trí đặt lệnh kiểm tra giá trị này nọ...

  - **`Vài thứ linh tinh:`**
    - Đọc hiểu được **`HTTP Methods GET vs POST`**.
    - Cáu trúc dữ liệu **[JavaScript Object Notation](https://vi.wikipedia.org/wiki/JSON)** (thường được viết tắt là **JSON**).
    - ... đại loại như đam mê kiểu **"Em yêu khoa học:3"**.

##  Giới thiệu chút về Wemos D1 mini mà mình sẽ sử dụng nhé!
### Technical specs
----------------------------------------------------------------------------
![esp8266](/img/2020-01-17-smart-clock/Wemos-D1-Mini.png){: .center-block :}

| Microcontroller | ESP-8266EX |
| Operating Voltage | 3.3V |
| Digital I/O Pins | 11 |
| Analog Input Pins | 1(Max input: 3.2V) |
| Clock Speed | 80MHz/160MHz |
| Flash | 4M bytes |
| Length | 34.2mm |
| Width | 25.6mm |
| Weight | 3g |

### Pin

![pinout_esp8266](/img/2020-01-17-smart-clock/wemosD1Mini.jpg){: .center-block :}

{: .box-warning}
**Warning:** Tất cả các **pin IO** của bé nó đều sài **3.3v** nha!

## Mục tiêu & tính năng của project này:
  - Một cái **`đồng hồ thời gian thực`** trang trí phòng ngon lành. Độ chính xác của giờ lấy từ **pool.ntp.org** đem lại độ chính xác tin cậy cho người dùng.
  - Thấy được **`nhiệt độ`**, **`độ ẩm`** không khí của địa phương (set mode tới 5 vị trí địa lí muốn lấy dữ liệu thời tiết với độ tin cậy từ **`OpenWeathermap`**)
  - Với khả năng **`kết nối mạng không dây nhanh gọn`** được hổ trợ bởi nhà sản xuất ESP32 & ESP8266.
  - Củng có **`báo thức`** luôn (set báo thức từ phím cứng trên đồng hồ hoặc smartphone luôn).
  - **`Cá nhân hóa`** được nè (thẩm mĩ tí khúc khắc lazer mica các bạn sẽ có sản phẩm toẹt vời).
  - **`Đèn ngủ`** cũng được nữa, đêm nó củng sang `sáng lắm`... **đèn ngủ siêu `tiết kiệm` điện** á nha.

----------------------------------------------------
## Hướng đi & giải pháp nào?
----------------------------------------------------
### Thời gian

**`Việc đầu tiên`**, đã là cái đồng hồ thì điều quan trọng là phải **xem được giờ** mà phải **chính xác** luôn - `thời gian thực`.

![lcd2004](https://www.makerguides.com/wp-content/uploads/2019/02/I2C-LCD-1024x683.jpg "Màn hình LCD thường dùng trong các dự án IoT nhỏ."){: .center-block .img-rounded :}

Từ đó chúng ta thấy `"xem được giờ"` tức là phải có cái gì đó nhìn trực quan được. Có nhiều sự lựa chọn cho việc đó như **LCD 20x04**, **LCD Graphic**, **LCD Oled**... Và mình chọn **`LCD 20x04`** vì nó khá dễ sử dụng với bộ `thư viện` phong phú trên `Github` và các diễn đàn IoT.

![ds1307](/img/2020-01-17-smart-clock/RTC_DS1307_PIN_Diagram.png "Sơ đồ DS1307"){: .center-block :}

**`Tiếp theo`** là việc lựa chọn **nguồn cung cấp thời gian**? RTC **DS1307**? Nó thì mình củng đã từng sử dụng qua rồi... Việc cấu hình khá vất vả, phụ thuộc vào viên pin Backup, **độ chính xác không cao** (thạch anh và **vị trí đặt thạch anh** trên mạch như thế nào củng ảnh hưởng đến `sai số thời gian` - và việc này làm chúng ta **code bù trừ thời gian** thêm phức tạp), vân vân mấy mây...

----------------------------------------------------
<h3 class="text-center"> Đến với 4.0 và pool.ntp.org </h3>

![ntp](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Network_Time_Protocol_servers_and_clients.svg/525px-Network_Time_Protocol_servers_and_clients.svg.png "Mũi tên vàng là kết nối trực tiếp; mũi tên đỏ là kết nối thông qua mạng."){: .center-block :}

Với **`công nghiệp 4.0`** như bây giờ cái việc nhà nhà có internet, người người có internet thì tại sao mình lại không sử dụng nó để **cập nhật giờ giống như các thiết bị di động, laptop** nhỉ? Sau khi tìm hiểu trên các diễn đàn IoT trong nước củng như nước ngoài, mình đã thu thập được một vài kiến thức về [cách thức hoạt động](https://vi.wikipedia.org/wiki/NTP "NTP (Network Time Protocol - Giao thức đồng bộ thời gian mạng)") và lấy dữ liệu giờ từ trang **[pool.ntp.org](https://www.pool.ntp.org/zone/vn)**.

----------------------------------------------------
### MCU - Smartconfig - Kết nối mạng

**`Để lấy được giờ từ internet`** thì **MCU** của chúng ta phải **có khả năng `kết nối internet`** (hoặc là kết nối không dây hoặc là có dây). Mình sử dụng **ESP8266 Wemos D1 mini** như đã giới thiệu ở trên.
Thứ khiến mình `băn khoăn` ở đây chính là **vấn đề kết nối mạng** cho em nó. Đối với một số bạn thì dòng `code` này rất quen thuộc:

{% highlight c linenos %}
#include <ESP8266WiFi.h>

const char* ssid = "********";
const char* password = "********";
void setup(void)
{
  Serial.begin(115200);
  Serial.println();

  Serial.printf("Connecting to %s \n", ssid);
  WiFi.begin(ssid, password);
  WiFi.config(staticIP, gateway, subnet);
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println();
  Serial.print("Connected, IP address: ");
  Serial.println(WiFi.localIP());
}

void loop() {}
{% endhighlight %}

**`Nếu sử dụng kiểu này`**, sản phẩm của chúng ta khi đóng hộp sẽ **sử dụng cố định một tên SSID & PASS** duy nhất rất **`bất tiện` trọng quá trình sử dụng** khi chuyển nhà, đổi tên mạng Wifi, vv... Mỗi lần như vậy **chúng ta phải `nạp lại code` để cập nhật ssid và password mới** cho ESP8266 (hoặc là phải đổi tên của modun Wifi thành ssid và pass như chúng ta đã cấu hình trong code).

Vậy thứ **chúng ta cần** là một cái đồng hồ có **khả năng kết nối wifi và thay đổi wifi**. Giải pháp được mình tìm thấy chính là [**Smartconfig**](https://docs.espressif.com/projects/esp-idf/en/latest/api-reference/network/esp_smartconfig.html).

>
[**`Smartconfig - ESPTouch`**](https://www.espressif.com/sites/default/files/documentation/esp-touch_user_guide_en.pdf) là một khái niệm được nhắc đến khi khi muốn `cấu hình thông tin` cho thiết bị WiFi kết nối nhanh chóng đến Internet nhất từ người dùng bằng chính thiết bị (điện thoại) của họ.
  - `Dễ dàng cấu hình` wifi cho ESP8266 thông qua smartphone.
  - `Không` cần phải `nạp lại code` để cấu hình
  - Có thể dùng `Smartconfig` để cấu hình `nhiều thiết bị` một lúc 

![smartconfig](/img/2020-01-17-smart-clock/smart-config.gif "Quy trình hoạt động Smartconfig")

----------------------------------------------------
### EEPROM - bộ nhớ backup lưu trữ data

Với việc sử dụng **`Smartconfig`** thì chúng ta cần một **vùng nhớ lưu ssid và pass** phòng khi **reset** đồng hồ hoặc **mất điện** vì lí do nào đó.

{% highlight c linenos %}
#include <ESP8266WiFi.h>
#include <Wire.h>
#include <EEPROM.h>
void setup()
{
	/* Initialize eeprom */
	EEPROM.begin(512);
	Serial.println(" ");
	Serial.println("Lay gio bao thuc:");
	hen_gio = EEPROM.read(index_eeprom_hengio);
	Serial.print("hen_gio: ");
	Serial.println(EEPROM.read(index_eeprom_hengio));
	hen_phut = EEPROM.read(index_eeprom_henphut);
	Serial.print("hen_phut: ");
	Serial.println(EEPROM.read(index_eeprom_henphut));
	value_Location_EEPROM = EEPROM.read(index_eeprom_location_eeprom);
	Serial.print("value_Location_EEPROM: ");
	Serial.println(EEPROM.read(index_eeprom_location_eeprom));
}
...
{% endhighlight %}

{: .box-note}
Như các bạn đã thấy trong trích đoạn code trên mình **sử dụng `EEPROM` để lưu** một số `giá trị` cho chức năng **`báo thức`**, **`vị trí địa lí`**, **`ssid & pass wifi`**.

----------------------------------------------------
### Thời tiết - cảm biến

![cambien_dht](/img/2020-01-17-smart-clock/dht_cambien.jpg){: .center-block :}
![cambien_ds18b20](/img/2020-01-17-smart-clock/ds18b20.jpg){: .center-block :}

Cái **đồng hồ mình trông có vẻ "*xịn*"** hơn thì thêm một vài **tính năng nhiệt độ, độ ẩm không khí**. Như các hình ảnh trên thì những cảm biến **DH111**, **DHT22**, **DS18b20** được rất nhiều các bạn sài.

Để **tiết kiệm được `PIN IN/OUT`** & theo **`Hot trend 4.0`**, ở dự án này mình không sử dụng phần cứng như thế. Với khả năng **kết nối internet** chúng ta sẽ tìm một **nguồn cung cấp thông tin thời tiết tin cậy** và lấy thông tin từ đó.

![OpenWeatherMap](/img/2020-01-17-smart-clock/icon-openweathermap-1.png){: .center-block :}

Đây [**OpenWeatherMap**](https://openweathermap.org) sẽ là nơi mình chọn lựa nơi để lấy data thời giữa hàng loạt các sự lựa chọn [khác](https://rapidapi.com/collection/top-weather-apis?utm_source=google&utm_medium=cpc&utm_campaign=1674315309_64978333346&utm_term=weather%20api_b&utm_content=1t1&gclid=Cj0KCQiA9orxBRD0ARIsAK9JDxTlX4QuAjT0zTrChC7GYx5ovIaqSI5wqny0YrF9yX3bXC4vO_F6gqwaAnWFEALw_wcB).

>***OpenWeatherMap API***
  - **`OpenWeatherMap API`** này cung cấp dịch vụ **dữ liệu thời tiết và dự báo miễn phí**, thích hợp cho bất kỳ dịch vụ bản đồ như các ứng dụng web và điện thoại thông minh.
  - Ý tưởng được lấy cảm hứng từ **OpenStreetMap** và `Wikipedia` nhằm cung cấp thông tin miễn phí và sẵn có cho mọi người.
  - **`OpenWeatherMap`** cung cấp nhiều dữ liệu thời tiết như:
    - Bản đồ **thời tiết hiện tại**, 
    - **Dự báo tuần**, lượng mưa, gió, mây, 
    - Dữ liệu từ các **trạm thời tiết** và nhiều thứ khác. 
    - Dữ liệu thời tiết được nhận từ các **dịch vụ phát sóng khí tượng toàn cầu** và hơn **`40.000 trạm khí tượng`**.
  - Bạn có thể **nhận được bất kỳ dữ liệu** `thời tiết` nào cho ứng dụng của bạn bằng cách sử dụng **API JSON** / XML.

Với những thông số trên về **`OpenWeatherMap`** thì nó là sự lựa chọn `đáng tin cậy` cho mình.

------------------------------------------------------------

Cơ bản là đã `giới thiệu` sơ bộ những `linh kiện` và `kiến thức` cần thiết sử dụng `trong project` này rồi.

{: .box-note}
**Note:** [**`Phần 2`**](/2020-01-23-smart-clock) mình sẽ đào vào `logic code` của mình. Hẹn gặp lại ở phần tiếp theo **`(Feb - 2020)`**!

