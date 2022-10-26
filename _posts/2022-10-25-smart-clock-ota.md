---
layout: post
title: "Over the Air - OTA cho ESP8266"
meta-title: "OTA cho ESP8266"
subtitle: "... nâng cấp phần mềm qua mạng và định kì cho thiết bị."
bigimg:
  - "/img/2022-10-25-smart-clock-ota/update-internet-of-things-iot-cheat-sheet.jpeg"
image: /img/2022-10-25-smart-clock-ota/logo.png
tags: [OTA, OTA firmware, firmware, esp8266, adruino ]
# gh-repo: bangnguyendev/Documents
# gh-badge: [star, watch, fork, follow]
# comments: true
---

## Giới thiệu OTA

Cập nhật firmware OTA (`Over the Air`) là tiến trình tải firmware mới vào ESP module thay vì sử dụng cổng Serial. 

Tính năng này thực sự rất hữu dụng trong nhiều trường hợp giới hạn về kết nối vật lý đến ESP Module.

Trong tất cả các trường hợp, thì `Firmware hỗ trợ OTA phải được nạp lần đầu tiên qua cổng Serial`, nếu mọi thứ hoạt động trơn tru, logic ứng dụng OTA hoạt động đúng thì có thể thực hiện việc cập nhật firmware thông qua OTA.

**Và thông tin giới thiệu đầy đủ về OTA các bạn có thể tham khảo ở đây:**  

  - Link tham khảo từ `arduino.esp8266.vn` [Cập nhật firmware](https://arduino.esp8266.vn/network/ota.html "arduino.esp8266.vn - Cập nhật firmware")

<div class="post-img-post">
    <img src="/img/2022-10-25-smart-clock-ota/updatemodel.png">
	<br>
	Quy trình hoạt động của OTA
</div>


## Bắt đầu

Ở trong ví dụ này, chúng ta sử dụng ví dụ Repo [SmartClock](https://github.com/bangnguyendev/SmartClock "SmartClock") nhé!

Với thiết bị là một cái đồng hồ sử dụng internet tôi sẽ chọn 2 phương án để lập trình viên tiện update OTA cho nó:
  - **Ngay khi cấp nguồn** hoặc **khởi động lại** nó sẽ tìm tới một function có nhiệm vụ kiểm tra phiên bản phần mềm hiện tại ở thiết bị và ở trên Sever có giống nhau hay không?
    - Nếu `có` thì bỏ qua và tiếp tục khởi động các ứng dụng của thiết bị.
    - Nếu `không` thì tiến hành tải về và cập nhật nó vào bộ nhớ.
  - **Cập nhật thủ công** thông qua `Mode` lựa chọn do mình lập trình ra.


Ở cách 1 ngay khi khởi động thiết bị hoặc cấp nguồn:


{% highlight c linenos %}
	WiFi.mode(WIFI_STA);
	Serial.println("");
	WiFi.printDiag(Serial);
	// In địa chỉ IP
	Serial.println("");
	Serial.println("WiFi connected");
	Serial.println("IP address: ");
	Serial.println(WiFi.localIP());

	/* Check firmware coi có cập nhật không?  */
	update_FOTA();

	/* Cập nhật thời gian từ sever vn.pool.ntp.org */
	Reload_Localtime_NTP();

	/* Màn hình khởi tạo chào mừng */
	Serial.println("Chạy màn hình LCD khởi tạo chào mừng");
	Welcome_Smartclock();

	/* truy cap den thoi tiet dia phuong da luu o eeprom */
	Serial.println("Truy cập đến thời tiết địa phương");
	time_dem_thoitiet = millis();
	Weather_Online_sever();
{% endhighlight %}

{: .box-note}
**Note:** Chúng ta thấy ở dòng 10-11 sẽ có function thực hiện các nhiệm vụ của update OTA.

### Tại sao chúng ta cần FOTA Inernet

Các phương pháp cập nhật firmware thông qua wifi mà không có internet rất hạn chế về khoảng cách và bảo mật.

Ví dụ, các bạn thấy Windown, smartphone,.. thường xuyên có các bản cập nhật, bản vá lỗi là nó sử dụng OTA qua internet.

Khi sản phẩm của các bạn mang tính thương mại, các thiết bị có thể lỗi thời về mặt công nghệ mềm nhưng phần cứng vẫn cho phép thì chúng ta nên sử dụng OTA thông qua internet để thêm hoặc bớt tính năng, sửa lỗi...

Vậy nên, chúng ta cần nạp FOTA thông qua Internet. Có một `máy chủ lưu trữ `và `quản lý version` của sản phẩm của bạn

### Nguyên lý FOTA Internet

Để có thể nạp firmware từ xa cho ESP32/8266 qua Internet. Chúng ta cần 1 máy chủ lưu giữ. 

Khi cập nhật hệ thống sẽ tuân theo các bước sau:
  - Nhà phát triển Upload firmware lên máy chủ
  - ESP32/8266 sẽ gọi 1 API lên server đó, truy vấn xem có bản cập nhật mới không. Việc hỏi này sẽ được lặp lại liên tục có thể 1 vài phút 1 lần hoặc 1 vài ngày, tùy người phát triển
  - Nếu nhận được thông tin thay đổi version, ESP32/8266 sẽ download firmware về thông qua internet.
  - Khởi động lại với firmware mới


### Setup trên OTA Drive

Có rất nhiều sever-broker để các bạn có thể lựa chọn để lưu trữ file firmware, nhưng ở bài viết này mình sử dụng `https://www.otadrive.com`

Đầu tiên các bạn truy cập vào website: `https://www.otadrive.com/`

Đăng kí một account và đăng nhập vào

Chuyển qua Tab Product và làm các bước sau:

<div class="post-img-post">
  <img src="/img/2022-10-25-smart-clock-ota/product_ota.png">
  <br>
  <img src="/img/2022-10-25-smart-clock-ota/add_product_ota.png">
  <br>
	Tạo Product
</div>

<div class="post-img-post">
  <img src="/img/2022-10-25-smart-clock-ota/add1_product_ota.png">
	<br>
	Nhấn vào biểu tượng folder bên phải để vào product.
</div>

<div class="post-img-post">
  <img src="/img/2022-10-25-smart-clock-ota/apikey_product_ota.png">
	<br>
	Copy API key
</div>

Ok. Vậy là các bạn đã có API key để truy cập vào Product này. Việc tiếp theo chúng ta cần làm là lập trình cho ESP32/8266

### void update_FOTA()

Ở hàm `void update_FOTA()` tôi sử dụng một biến `Check_OTA` làm flag-cờ báo trạng thái 


{% highlight c linenos %}

/* Cập nhật OTA */
#define ProductKey "ee01b*******12df"
#define Version "2.0.0"
#define MakeFirmwareInfo(k, v) "&_FirmwareInfo&k=" k "&v=" v "&FirmwareInfo_&"

void update_FOTA()
{
	Serial.println("\n>>>>>>>>>>> Update FOTA \n");
	Serial.println("Check firmware coi có bản cập nhật không? ");

	lcd.clear();
	/* màn hình hiển thị trên LCD 2004 */
	lcd.setCursor(0, 0);
	lcd.print("Version Firmware:   ");

	lcd.setCursor(0, 1);
	lcd.print(Version);
	lcd.print(" - ");
	lcd.print(CHIPID);

	lcd.setCursor(0, 2);
	lcd.print("Checking for updates");

	/* hiển thị loading . . . */
	lcd.setCursor(0, 3);
	lcd.print("...");
	Serial.printf(">>> Device: %d MHz \n", ESP.getCpuFreqMHz());
	Serial.printf(">>> Version Firmware: v%s (OTADrive) \n", Version);
	Serial.printf(">>> ID ESP: ");
	Serial.println(CHIPID);
	Serial.printf(">>> Boot Mode: %d \n", ESP.getBootMode());
	Serial.printf(">>> Free mem: %d \n", ESP.getFreeHeap());
	/* biến Check_OTA kiểm tra có coi bản cập nhật OTA nào hay không? */
	bool Check_OTA = true;
	int count_Check_OTA = 0;
	while (Check_OTA)
	{

		/* sever chưa tệp BIN */
		String url = "http://otadrive.com/DeviceApi/update?";
		WiFiClient client;
		url += "&s=" + String(CHIPID);
		url += MakeFirmwareInfo(ProductKey, Version);

		t_httpUpdate_return ret = ESPhttpUpdate.update(client, url, Version);

		switch (ret)
		{
		case HTTP_UPDATE_FAILED:
			count_Check_OTA++;
			Check_OTA = true;
			Serial.println(">>> Please waiting ...");
			lcd.setCursor(0, 3);
			lcd.print("> Please waiting ");
			lcd.print((100 - count_Check_OTA) / 10 % 10);
			lcd.print((100 - count_Check_OTA) / 1 % 10);
			if (count_Check_OTA > 100)
			{
				Check_OTA = false;
				Serial.println(">>> Sever OTADrive bị nghẻn, quá tải...");
				Serial.println(">>> Hoặc thiết bị của bạn chưa được cho phép cập nhật trên hệ thống...");
				Serial.println(">>> Check cập nhật ở thời điểm khác...");
				Serial.printf(">>> Phiên bản hiện tại là v%s \n", Version);
				lcd.setCursor(0, 3);
				lcd.print("> Skip updated...   ");
				delay(2000);
			}
			break;

		case HTTP_UPDATE_NO_UPDATES:
			Check_OTA = false;
			Serial.println(">>> HTTP_UPDATE_NO_UPDATES");
			Serial.println(">>> The current version is the latest.");
			lcd.setCursor(0, 2);
			lcd.print("The current version ");
			lcd.setCursor(0, 2);
			lcd.print("      is the latest.");
			lcd.setCursor(0, 3);
			lcd.print("> > > > > > > > > > ");
			delay(1500);
			break;

		case HTTP_UPDATE_OK:
			Serial.println(">>> HTTP_UPDATE_OK"); // may not called we reboot the ESP
			Check_OTA = false;
			break;
		}
	}
	lcd.clear();
	Serial.println("\n<<<<<<<<<< Done Check FOTA \n");
}
{% endhighlight %}

### Lưu ý 

#### Updater class

Updater nằm trong Core và dùng để xử lí việc viết firmware lên flash, kiểm tra tính thống nhất của nó và thông báo bootloader để load firmware trên boot kế tiếp.

#### Update process - memory view

- Sketch mới sẽ được chứa trong dung lượng trống gĩưa sketch cũ và spiff will be stored in the space between the old sketch and the spiff.

- Trong lần reboot tiếp theo thì “eboot” bootloader kiểm tra các câu lệnh.

- Sketch mới sẽ được copy.

- Sketch mới khởi động.

<div class="post-img-post">
    <img src="/img/2022-10-25-smart-clock-ota/memory-view.png">
	<br>
	Update process - memory view
</div>


*to be continued....*


## Kết

ESP32 FOTA Internet là một phần rất quan trọng khi các bạn làm các sản phẩm thương mại, vì các sản phẩm khi release chưa chắc đã hoàn hảo, cần update thêm tính năng hoặc sửa lỗi. 

Vậy nên làm chủ được nó sẽ giúp sản phẩm của bạn sẽ được nâng cấp liên tục, người sử dụng cũng sẽ không cần phải làm gì cả.

### *Link tham khảo:*
*	[khuenguyencreator - Lập trình ESP32 FOTA nạp firmware qua mạng Internet với OTA Drive](https://khuenguyencreator.com/lap-trinh-esp32-fota-nap-firmware-qua-mang-internet-voi-ota-drive/ "Lập trình ESP32 FOTA nạp firmware qua mạng Internet với OTA Drive")
*	[arduino.esp8266.vn - Cập nhật firmware](https://arduino.esp8266.vn/network/ota.html "Cập nhật firmware")