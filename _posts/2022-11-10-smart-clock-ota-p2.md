---
layout: post
title: "P2: Over the Air - OTA cho ESP8266"
meta-title: "P2: OTA cho ESP8266"
subtitle: "...sử dụng HTTPS Github Repo."
bigimg:
  - "/img/2022-10-25-smart-clock-ota/update-internet-of-things-iot-cheat-sheet.jpeg"
image: /img/2022-10-25-smart-clock-ota/logo.png
tags: [OTA, OTA firmware, firmware, esp8266, adruino, https, github ]
# gh-repo: bangnguyendev/SmartClock
# gh-badge: [star, watch, fork, follow]
# comments: true
---

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


### ⚙️ Bắt đầu

Ở trong bài viết này, chúng ta sử dụng Repo 

- [**`SmartClock Hash commit: c12fb ... 6578e0`**](https://github.com/bangnguyendev/SmartClock/tree/c12fbc04e5b3a2b53620f97d68670463b16578e0 "SmartClock") nhé!

Với thiết bị là một cái đồng hồ sử dụng internet tôi sẽ chọn 3 phương án để lập trình viên tiện update OTA cho nó:
  - **Ngay khi cấp nguồn** hoặc **khởi động lại** nó sẽ tìm tới một function có nhiệm vụ kiểm tra phiên bản phần mềm hiện tại ở thiết bị và ở trên Sever có giống nhau hay không?
    - Nếu `có` thì bỏ qua và tiếp tục khởi động các ứng dụng của thiết bị.
    - Nếu `không` thì tiến hành tải về và cập nhật nó vào bộ nhớ.
  - **Cập nhật thủ công** thông qua `Mode` lựa chọn do mình lập trình ra.
  - **Cập nhật tự động định kỳ** hàng tuần/tháng/năm ...


### ⚙️ Tại sao cần FOTA Inernet

Các phương pháp cập nhật firmware thông qua wifi-local mà không có internet rất hạn chế về khoảng cách và bảo mật.

Ví dụ, các bạn thấy windows, smartphone,... thường xuyên có các bản cập nhật, bản vá lỗi là nó sử dụng OTA qua internet.

Khi sản phẩm của các bạn mang tính thương mại, các thiết bị có thể lỗi thời về mặt `công nghệ mềm` nhưng `phần cứng vẫn cho phép` thì chúng ta nên sử dụng OTA thông qua internet để thêm hoặc bớt tính năng, sửa lỗi...

Vậy nên, chúng ta cần nạp FOTA thông qua Internet. Có một `máy chủ lưu trữ `và `quản lý version` của sản phẩm của bạn

### ⚙️ Nguyên lý FOTA Internet

Để có thể nạp firmware từ xa cho ESP32/8266 qua Internet. 

Chúng ta cần 1 máy chủ lưu giữ. 

Khi cập nhật hệ thống sẽ tuân theo các bước sau:
  - Nhà phát triển Upload firmware lên máy chủ
  - ESP32/8266 sẽ gọi 1 API lên server đó, truy vấn xem có bản cập nhật mới không. Việc hỏi này sẽ được lặp lại liên tục có thể 1 vài phút 1 lần hoặc 1 vài ngày, tùy người phát triển
  - Nếu nhận được thông tin thay đổi version, ESP32/8266 sẽ download firmware về thông qua internet.
  - Khởi động lại với firmware mới


### ⚙️ Setup trên Github Repo Project

Có rất nhiều sever-broker để các bạn có thể lựa chọn để lưu trữ file firmware, nhưng ở bài viết này mình sử dụng 👉[`https://github.com/`](https://github.com/ "https://github.com/")

**`Ưu điểm`** của việc sử dụng Github Repo Project là: 
- Chúng ta làm chủ được data CSDL, không bị phụ thuộc vào bên thứ 3.
- Quản lý các phiên bản version Project tốt.

**`Nhược điểm:`**
- Khó quản lý, thống kê thiết bị đã đang sử dụng so với OTADrive.
- Cần phải cập nhật mã X509 cho phép truy cập HTTPS (10 - 15 năm, nên củng không hẳn khó khăn)

Đầu tiên các bạn truy cập vào website: 👉[`https://github.com/`](https://github.com/ "https://github.com/")

Hãy tạo một **Repo Public** để quản lý lưu trữ *`file bin & file JOSN`* thông tin Project. 

Nếu Public thì quyền tải file bin qua HTTP của ESP8266 sẽ thuận lợi hơn.

Ngược lại, nếu sử dụng Private thì chúng ta sẽ sử dụng `key secret authentication` của Account Github cho Project đó. 

> Private Project Có thể tham khảo ở đây:
> 1. 👉[`Creating a personal access token - GitHub Docs`](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token "Creating a personal access token - GitHub Docs")
> 2. 👉[`How I do an ESP8266 HTTPupdate via private Github repository?`](https://stackoverflow.com/questions/62333061/how-i-do-an-esp8266-httpupdate-via-private-github-repository "How I do an ESP8266 HTTPupdate via private Github repository?") 


Ở phương pháp OTA thông qua HTTPS này chúng ta cần phải có `DigiCert Global Root CA` để ESP8266 có thể truy cập và tải file bin.

{: .box-warning}
**🛡️🛡️🛡️ Khai báo client:** WiFiClientSecure client;

{: .box-warning}
**🛡️🛡️🛡️ Nhập cert:** client.setTrustAnchors(&cert); // cert theo tiêu chuẩn X509

{: .box-warning}
**🛡️🛡️🛡️ Kết nối tới host:** client.connect(host, httpsPort)

### ⚙️ Giới thiệu void update_FOTA()

```c
WiFiClientSecure client;
client.setTrustAnchors(&cert);
if (!client.connect(host, httpsPort))
{
    Serial.println(">>> raw.githubusercontent.com - Connection failed");
    Serial.println(">>> Sever bị nghẻn, quá tải...");
    Serial.println(">>> Hoặc thiết bị của bạn chưa được cho phép cập nhật trên hệ thống...");
    Serial.println(">>> Check cập nhật ở thời điểm khác...");
    Serial.printf(">>> Phiên bản hiện tại là %s \n", FirmwareVer);
    return;
}

client.print(String("GET ") + URL_fw_Version + " HTTP/1.1\r\n" +
                "Host: " + host + "\r\n" +
                "User-Agent: BuildFailureDetectorESP8266\r\n" +
                "Connection: close\r\n\r\n");

// Check nội dung từ file Version     
while (client.connected())
{
    String line = client.readStringUntil('\n');
    if (line == "\r")
    {
        Serial.println(">>> Headers received");
        break;
    }
}

String payload = client.readString(); // Get the request response payload
Serial.println(payload);
DynamicJsonDocument jsonBuffer(1024);

auto error = deserializeJson(jsonBuffer, payload);
if (error) {
    Serial.print(F("deserializeJson() failed with code "));
    Serial.println(error.c_str());
    return;
}

```

Sau khi connect tới host `URL_fw_Version` thành công - nơi lưu trữ thông tin `Plain Text in Project`, chúng ta sẽ tiến hành đọc version hiện có trên sever Repo Github để lấy được giá tri `payload`.

Chuỗi JSON này được chúng ta phân tách để đọc giá trị `version_prod`

Nếu `version_prod = FirmwareVer` tức là vesion trên sever-URL_fw_Version `khớp` với version hiện tại được sử dụng trong trên ESP8266 thì `bỏ qua việc cập nhật OTA` và ngược lại thì tiến hành cập nhật OTA.


**`Trường hợp 2 version giống nhau`**

```c
String author_prod = jsonBuffer["author"];
String version_prod = jsonBuffer["main"]["version"];

// serializeJson(jsonBuffer, Serial);
// Trường hợp 2 version gióng nhau
if (version_prod.equals(FirmwareVer))
{
    Serial.println(">>> Device already on latest firmware version");
    lcd.setCursor(0, 2);
    lcd.print("The current version ");
    lcd.setCursor(0, 2);
    lcd.print("      is the latest.");
    lcd.setCursor(0, 3);
    lcd.print("> > > > > > > > > > ");
    delay(1500);
}
else
{
    Serial.print(">>> New firmware detected: ");
    
    ....
}
```
 
**`Trường hợp 2 version khác nhau`**

Ta sử dụng `HTTPS + X509` -> HTTP Request/Respone để gửi yêu cầu sever & chờ kết quả phản hồi: 

```c
ESPhttpUpdate.setLedPin(LED_BUILTIN, LOW);

// Add optional callback notifiers
ESPhttpUpdate.onStart(update_started);
ESPhttpUpdate.onEnd(update_finished);
ESPhttpUpdate.onProgress(update_progress);
ESPhttpUpdate.onError(update_error);

t_httpUpdate_return ret = ESPhttpUpdate.update(client, URL_fw_Bin);

switch (ret)
{
case HTTP_UPDATE_FAILED:
    Serial.printf("HTTP_UPDATE_FAILD Error (%d): %s\n", ESPhttpUpdate.getLastError(), ESPhttpUpdate.getLastErrorString().c_str());
    Serial.println(">>> Sever bị nghẻn, quá tải...");
    Serial.println(">>> Hoặc thiết bị của bạn chưa được cho phép cập nhật trên hệ thống...");
    Serial.println(">>> Check cập nhật ở thời điểm khác...");
    Serial.printf(">>> Phiên bản hiện tại là %s \n", FirmwareVer);
    lcd.setCursor(0, 3);
    lcd.print("> Skip updated...ERR");
    delay(2000);
    break;

case HTTP_UPDATE_NO_UPDATES:
    Serial.println("HTTP_UPDATE_NO_UPDATES");
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
    Serial.println("HTTP_UPDATE_OK");
    break;
}
```

Nếu kết quả `ret` trả về:

**HTTP_UPDATE_FAILED**: 

Nếu `HTTP_UPDATE_FAILED` thì sẽ bỏ qua quá trình cập nhật OTA.

**HTTP_UPDATE_NO_UPDATES**: 

Nếu `HTTP_UPDATE_FAILED` thì sẽ bỏ qua quá trình cập nhật OTA.

**HTTP_UPDATE_OK**:

Trường hợp này, sau khi download Firmware mới nhất thì ESP sẽ tự khởi động lại và nạp lại Firmware mới nhất.


{: .box-warning}
**HTTP_UPDATE_OK:** Các bạn xem phần Lưu ý ở dưới <a class="jumper" hre="#-update-process---memory-view">💾 Update process - memory view</a> để chắc chắn rằng dung lượng của ESP còn đủ cho việc nạp.

**`Chương trình`** 

```c

/* Cập nhật OTA */

const String FirmwareVer={"v2.2.1"}; 


#define URL_fw_Version "/bangnguyendev/SmartClock/master/include/Info_prod.json"
#define URL_fw_Bin "https://raw.githubusercontent.com/bangnguyendev/SmartClock/master/build/main.ino.bin"


const char* host = "raw.githubusercontent.com";
const int httpsPort = 443;

// DigiCert Global Root CA - Valid until: 10/Nov/2031
// https://www.digicert.com/kb/digicert-root-certificates.htm
// https://cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem
const char trustRoot[] PROGMEM = R"EOF(
-----BEGIN CERTIFICATE-----
MIIDrzCCApegAwIBAgIQCDvgVpBCRrGhdWrJWZHHSjANBgkqhkiG9w0BAQUFADBh
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBD
QTAeFw0wNjExMTAwMDAwMDBaFw0zMTExMTAwMDAwMDBaMGExCzAJBgNVBAYTAlVT
MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j
b20xIDAeBgNVBAMTF0RpZ2lDZXJ0IEdsb2JhbCBSb290IENBMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4jvhEXLeqKTTo1eqUKKPC3eQyaKl7hLOllsB
CSDMAZOnTjC3U/dDxGkAV53ijSLdhwZAAIEJzs4bg7/fzTtxRuLWZscFs3YnFo97
nh6Vfe63SKMI2tavegw5BmV/Sl0fvBf4q77uKNd0f3p4mVmFaG5cIzJLv07A6Fpt
43C/dxC//AH2hdmoRBBYMql1GNXRor5H4idq9Joz+EkIYIvUX7Q6hL+hqkpMfT7P
T19sdl6gSzeRntwi5m3OFBqOasv+zbMUZBfHWymeMr/y7vrTC0LUq7dBMtoM1O/4
gdW7jVg/tRvoSSiicNoxBN33shbyTApOB6jtSj1etX+jkMOvJwIDAQABo2MwYTAO
BgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUA95QNVbR
TLtm8KPiGxvDl7I90VUwHwYDVR0jBBgwFoAUA95QNVbRTLtm8KPiGxvDl7I90VUw
DQYJKoZIhvcNAQEFBQADggEBAMucN6pIExIK+t1EnE9SsPTfrgT1eXkIoyQY/Esr
hMAtudXH/vTBH1jLuG2cenTnmCmrEbXjcKChzUyImZOMkXDiqw8cvpOp/2PV5Adg
06O/nVsJ8dWO41P0jmP6P6fbtGbfYmbW0W5BjfIttep3Sp+dWOIrWcBAI+0tKIJF
PnlUkiaY4IBIqDfv8NZ5YBberOgOzW6sRBc4L0na4UU+Krk2U886UAb3LujEV0ls
YSEY1QSteDwsOoBrp+uvFRTp2InBuThs4pFsiv9kuXclVzDAGySj4dzp30d8tbQk
CAUw7C29C79Fv1C5qfPrmAESrciIxpg0X40KPMbp1ZWVbd4=
-----END CERTIFICATE-----
)EOF";
X509List cert(trustRoot);


//UPDATER
String last_error;
String update_status;
float progress_percent; 
void update_started() {
    Serial.println("CALLBACK:  HTTP update process started");
    lcd.setCursor(0, 3);
    lcd.print("Downloading... ");
}
void update_finished() {
    Serial.println("CALLBACK:  HTTP update process finished");
}
void update_progress(int cur, int total) {
    progress_percent = float((float)cur/(float)total)*100;
    Serial.printf("CALLBACK:  HTTP update process at %d of %d bytes... -[ %0.1f %% ]- \n", cur, total, progress_percent);
}
void update_error(int err) {
    Serial.printf("CALLBACK:  HTTP update fatal error code %d\n", err);
}
//UPDATER

void update_FOTA()
{
    Serial.println("\n>>>>>>>>>>> Update FOTA \n");
    Serial.println("Check firmware coi có bản cập nhật không? ");

    lcd.clear();
    /* màn hình hiển thị trên LCD 2004 */
    lcd.setCursor(0, 0);
    lcd.print("Version Firmware:   ");

    lcd.setCursor(0, 1);
    lcd.print(FirmwareVer);
    lcd.print(" - ");
    lcd.print(CHIPID);

    lcd.setCursor(0, 2);
    lcd.print("Checking for updates");

    /* hiển thị loading . . . */
    lcd.setCursor(0, 3);
    lcd.print("...");
    Serial.printf(">>> Device: %d MHz \n", ESP.getCpuFreqMHz());
    Serial.printf(">>> Version Firmware: %s \n", FirmwareVer);
    Serial.printf(">>> ID ESP: ");
    Serial.println(CHIPID);
    Serial.printf(">>> Boot Mode: %d \n", ESP.getBootMode());
    Serial.printf(">>> Free Sketch Space: %d \n", ESP.getFreeSketchSpace());

    WiFiClientSecure client;
    client.setTrustAnchors(&cert);
    if (!client.connect(host, httpsPort))
    {
        Serial.println(">>> raw.githubusercontent.com - Connection failed");
        Serial.println(">>> Sever bị nghẻn, quá tải...");
        Serial.println(">>> Hoặc thiết bị của bạn chưa được cho phép cập nhật trên hệ thống...");
        Serial.println(">>> Check cập nhật ở thời điểm khác...");
        Serial.printf(">>> Phiên bản hiện tại là %s \n", FirmwareVer);
        return;
    }

    client.print(String("GET ") + URL_fw_Version + " HTTP/1.1\r\n" +
                 "Host: " + host + "\r\n" +
                 "User-Agent: BuildFailureDetectorESP8266\r\n" +
                 "Connection: close\r\n\r\n");

    // Check nội dung từ file Version     
    while (client.connected())
    {
        String line = client.readStringUntil('\n');
        if (line == "\r")
        {
            Serial.println(">>> Headers received");
            break;
        }
    }

    String payload = client.readString(); // Get the request response payload
    Serial.println(payload);
    DynamicJsonDocument jsonBuffer(1024);

    auto error = deserializeJson(jsonBuffer, payload);
    if (error) {
        Serial.print(F("deserializeJson() failed with code "));
        Serial.println(error.c_str());
        return;
    }

    String author_prod = jsonBuffer["author"];
    String version_prod = jsonBuffer["main"]["version"];

    // serializeJson(jsonBuffer, Serial);

    if (version_prod.equals(FirmwareVer))
    {
        Serial.println(">>> Device already on latest firmware version");
        lcd.setCursor(0, 2);
        lcd.print("The current version ");
        lcd.setCursor(0, 2);
        lcd.print("      is the latest.");
        lcd.setCursor(0, 3);
        lcd.print("> > > > > > > > > > ");
        delay(1500);
    }
    else
    {
        Serial.print(">>> New firmware detected: ");
        Serial.println(version_prod);
        lcd.setCursor(0, 2);
        lcd.print("NewFirmware detected");
        lcd.setCursor(0, 2);
        lcd.print(FirmwareVer);
        lcd.print(" -> ");
        lcd.print(version_prod);
        // The line below is optional. It can be used to blink the LED on the board during flashing
        // The LED will be on during download of one buffer of data from the network. The LED will
        // be off during writing that buffer to flash
        // On a good connection the LED should flash regularly. On a bad connection the LED will be
        // on much longer than it will be off. Other pins than LED_BUILTIN may be used. The second
        // value is used to put the LED on. If the LED is on with HIGH, that value should be passed
        ESPhttpUpdate.setLedPin(LED_BUILTIN, LOW);

        // Add optional callback notifiers
        ESPhttpUpdate.onStart(update_started);
        ESPhttpUpdate.onEnd(update_finished);
        ESPhttpUpdate.onProgress(update_progress);
        ESPhttpUpdate.onError(update_error);

        t_httpUpdate_return ret = ESPhttpUpdate.update(client, URL_fw_Bin);

        switch (ret)
        {
        case HTTP_UPDATE_FAILED:
            Serial.printf("HTTP_UPDATE_FAILD Error (%d): %s\n", ESPhttpUpdate.getLastError(), ESPhttpUpdate.getLastErrorString().c_str());
            Serial.println(">>> Sever bị nghẻn, quá tải...");
            Serial.println(">>> Hoặc thiết bị của bạn chưa được cho phép cập nhật trên hệ thống...");
            Serial.println(">>> Check cập nhật ở thời điểm khác...");
            Serial.printf(">>> Phiên bản hiện tại là %s \n", FirmwareVer);
            lcd.setCursor(0, 3);
            lcd.print("> Skip updated...ERR");
            delay(2000);
            break;

        case HTTP_UPDATE_NO_UPDATES:
            Serial.println("HTTP_UPDATE_NO_UPDATES");
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
            Serial.println("HTTP_UPDATE_OK");
            break;
        }
    }
    lcd.clear();
    Serial.println("\n<<<<<<<<<< Done Check FOTA \n");
}
```

<br>

### ⚙️ Tuỳ chọn cập nhật OTA

Tuỳ chọn cập nhật OTA chúng ta sẽ có 3 cách như đã trình bày ở trên bài viết: 

#### 1️⃣ Cách 1 

Ở cách 1 ngay khi khởi động thiết bị hoặc cấp nguồn:

```c
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
```

> Chúng ta thấy ở dòng 10-11 sẽ có function thực hiện các nhiệm vụ của update OTA.

<br>

#### 2️⃣ Cách 2

Ở cách 2 khi lựa chọn Mode cập nhật:

Ở nút nhấn Mode - nhấn giữ 7 giây sẽ vào mode cập nhật OTA

```c
....
long startTime = millis(); // giá trị ban đầu được gán bằng giá trị hiện tại của millis
....
while (digitalRead(Button_Mode) == PULLUP_PULLDOWN) // đợi cho nút bấm được giữ
{
  Serial.printf("Thời gian đè giữ nút nhấn: %d ms\n", (millis() - startTime));
  couter_Mode = (millis() - startTime) / 1000;
  couter_Mode = couter_Mode / 1 % 10;
  if (couter_Mode < 1)
  {
    lcd.setCursor(0, 1);
    lcd.print("Mode Selection      ");
  }
  /* vao mode OTA */
  else if (couter_Mode >= 7)
  {
    lcd.print("Mode: >> Update OTA ");
  }
  ......
};
/* Update FOTA mode*/
if (couter_Mode >= 7)
{
  /* Update FOTA mode*/
  /* Hien thi message tu Update OTA */
  update_FOTA();
}
......
```

<br>

#### 3️⃣ Cách 3

Ở cách 3 chúng ta sẽ chèn `void update_FOTA();` vào mỗi hàng tuần/tháng/năm định kỳ để kiểm tra bản cập nhật.
<div class="post-img-post">
    <img src="/img/2022-10-25-smart-clock-ota/loop.png">
</div>
<br>

### ⚠️ Lưu ý 

#### 💾 Updater class

Updater nằm trong Core và dùng để xử lí việc viết firmware lên flash, kiểm tra tính thống nhất của nó và thông báo bootloader để load firmware trên boot kế tiếp.

#### 💾 Update process - memory view

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


### Kết - OTA

FOTA Internet là một phần rất quan trọng khi các bạn làm các sản phẩm thương mại, vì các sản phẩm khi release chưa chắc đã hoàn hảo, cần update thêm tính năng hoặc sửa lỗi. 

Vậy nên làm chủ được nó sẽ giúp sản phẩm của bạn sẽ được nâng cấp liên tục, người sử dụng cũng sẽ không cần phải làm gì cả.

### *Link tham khảo*
*	Repo [SmartClock Hash commit: c12fb ... 578e0](https://github.com/bangnguyendev/SmartClock/tree/c12fbc04e5b3a2b53620f97d68670463b16578e0 "SmartClock")
