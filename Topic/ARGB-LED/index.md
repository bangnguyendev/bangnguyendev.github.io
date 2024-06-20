---
layout: page
title: Bộ điều khiển led ARGB
meta-title: Bộ điều khiển led ARGB
# subtitle: "... Welcome to ARGB"
bigimg:
  - "image/BANER__ARGB.png"
image: "image/BANER__ARGB.png"
tags: [esp web tools, Web serial, bluetooth]
category: Programming MCU
# gh-repo: bangnguyendev/flash-esp-web-bangnguyendev
# gh-badge: [fork]
# author: "BangNguyen"
# comments: true
---

### Chào mừng đến với bộ điều khiển led ARGB! ✨

- [Basics - Getting Started - Bắt đầu cơ bản](basics/getting-started)

- [Features - Effects - Hiệu ứng](features/effects) 

**Triển khai nhanh chóng** và nhiều tính năng của máy chủ web để điều khiển đèn **LED NeoPixel** (WS2812B, WS2811, SK6812, ...) hoặc các chipsets dựa trên SPI như WS2801 và APA102!

{: .box-warning}
**Warning:** Đối với mạch điều khiển LED **ARGB Happy Smart Light** chỉ có tiếng Việt cho chip **ESP32** và **ESP32-S3**.

<!-- Sử dụng cho button class="action action--button" -->
<link rel="stylesheet" href="/dist/css/main-bio.css"> 
<div style="text-align: center;">
  <h4>ESP Web Tools - bangnguyendev</h4>
  <!-- Lựa chọn các option -->
  <div>
    <label for="optiongroup">Chọn phiên bản:</label>
    <select id="optiongroup">
      <optgroup label="ARGB Led tiếng Việt">
        <option value="/dist/json/manifest_ESP8266_ESP32_ARGB_VN.json">ARGB Led - v1.0.0_VN</option>
      </optgroup>
      <optgroup label="ARGB Led">
        <option value="/dist/json/manifest_ESP8266_ESP32_ARGB.json">ARGB Led - v1.0.0</option>
     </optgroup>
      <optgroup label="Example ESP Web Tools - OTA">
        <option value="/dist/json/manifest_ESP8266_ESP32.json">ESP Web Tools - OTA - v1.0.0</option>
      </optgroup>
    </select>
  </div>

  Kết nối <a href="https://s.shopee.vn/4Aewn9TB7g"><b>USB-TTL</b></a> với bo mạch <b>ARGB Happy Smart Light</b>.<br> Cắm <b>USB-TTL</b> vào máy tính của bạn. <br>Phiên bản đang chọn: <span style="font-weight: bold;" id="verstr"></span><br>
  <!-- Button install ESP -->
  <esp-web-install-button id="espInstallButton">
  <button class="action action--button" slot="activate"><i class="fa fa-usb"></i><span class="action__text">Kết nối & Cài đặt</span></button>
  </esp-web-install-button>
</div>

#### ⚙️ Tính năng

- Thư viện **WS2812FX** tích hợp cho **hơn 180 hiệu ứng đặc biệt**
- Hiệu ứng **FastLED** và 50 bảng màu
- Giao diện hiện đại với điều khiển màu sắc, hiệu ứng và **phân đoạn Led**
- **Phân đoạn** để đặt các hiệu ứng và màu sắc khác nhau **cho các phần của đèn LED**
- Trang cài đặt - cấu hình qua mạng
- Chế độ Wifi và trạm phát Wifi - tự động chuyển sang Điểm truy cập an toàn
- Tối đa **10 ngõ đầu ra kết nối đèn LED** cho mỗi instance ARGB v1.0.0 (**mỗi đầu ra 800 leds**)
- Có thể kết nối không giới hạn các ARGB v1.0.0
- Hỗ trợ dải đèn **RGBW**
- **Tối đa 250 cài đặt trước** của người dùng để dễ dàng lưu và tải màu sắc/hiệu ứng, hỗ trợ chuyển đổi qua lại giữa chúng
- Cài đặt trước có thể được sử dụng để tự động thực thi các lệnh API
- Chức năng đèn ngủ (giảm dần độ sáng)
- Cập nhật phần mềm OTA đầy đủ (HTTP + ArduinoOTA), có thể bảo vệ bằng mật khẩu
- Đồng hồ analog có thể cấu hình + **hỗ trợ bộ kit Cronixie của Diamex**
- Giới hạn độ sáng tự động có thể cấu hình để hoạt động an toàn hơn
- Cấu hình dựa trên hệ thống tập tin để **dễ dàng sao lưu cài đặt** trước và cài đặt

<!-- - Native [Home-Assistant integration](https://www.home-assistant.io/integrations/wled/): [![Start native Homeassistant integration configuration](https://my.home-assistant.io/badges/config_flow_start.svg)](https://my.home-assistant.io/redirect/config_flow_start?domain=wled) -->

#### 💡 Các phần mềm kết nối chuyên nghiệp hơn ARGB có thể sử dụng
- [Jinx! – LED Matrix Control](https://live-leds.de/) - điều khiển led chuyên cho bảng ma trận LED
- [LedFx - Make your LEDs dance in sync to the music](https://www.ledfx.app/) - điều khiển led theo nhạc cực cuốn
- [Lightpack - Prismatik](https://github.com/psieg/Lightpack/releases) - trang trí Ambilight cho màn hình PC/Laptop
- [Hyperion](https://github.com/hyperion-project/hyperion.ng) - Trang trí TIVI siêu đẹp

#### 💡 Các chuẩn kết nối ARGB có thể sử dụng

<!-- - [ARGB app](https://github.com/Aircoookie/WLED-App) for [Android](https://play.google.com/store/apps/details?id=com.aircoookie.WLED) and [iOS](https://apps.apple.com/us/app/wled/id1475695033)
- Alternatively, ARGB Native app made by community member [Moustachauve](https://github.com/Moustachauve) -->
- Ứng dụng [Android](https://play.google.com/store/apps/details?id=ca.cgagnier.wlednativeandroid) 
<!-- - [[Source]((https://github.com/Moustachauve/WLED-Native-Android))] -->
- Ứng dụng [iOS](https://apps.apple.com/us/app/wled-native/id6446207239) 
<!-- - [[Source]((https://github.com/Moustachauve/WLED-Native-iOS/))] -->
<!-- - [JSON](interfaces/json-api) and [HTTP request](interfaces/http-api) APIs   -->
<!-- - [MQTT](interfaces/mqtt)   -->
<!-- - [Blynk IoT](interfaces/blynk)   -->
- [E1.31](interfaces/e1.31-dmx), [Art-Net](interfaces/e1.31-dmx), DDP and [TPM2.net](interfaces/udp-realtime)
- [UDP realtime](interfaces/udp-realtime)
- [Alexa voice control (including dimming and color)](/advanced/remote-access-ifttt)
- [Sync to Philips Hue lights](interfaces/philips-hue)
- Adalight (PC ambilight via serial) and TPM2  - Trang trí màn hình PC/Laptop siêu đẹp
- [Sync color of multiple ARGB devices (UDP notifier)](interfaces/udp-notifier)
- [Infrared remotes (24-key RGB, receiver required)](interfaces/infrared)
- Simple timers/schedules (time from NTP, timezones/DST supported)  

#### 📲 Hướng dẫn sử dụng nhanh và tài liệu liên quan

[Hướng dẫn sử dụng nhanh!](basics/getting-started)

[Trên trang này](basics/tutorials), bạn có thể tìm thấy các hướng dẫn tuyệt vời do cộng đồng thực hiện và các công cụ hữu ích để giúp bạn thiết lập và vận hành chiếc đèn mới của mình!

#### 🖼️ User interface

<img src="assets/images/ui/headers/macbook-pro-space-gray-on-the-wooden-table.jpg" width="50%"><img src="assets/images/ui/headers/walking-with-iphone-x.jpg" width="50%">

<!-- #### 💾 Compatible hardware

See [here](basics/compatible-hardware)! -->

<!-- #### ✌️ Other

Licensed under the MIT license   -->

## ✌️ Happy Smart Light - bangnguyendev


<script>
document.addEventListener("DOMContentLoaded", function() {
  var optiongroup = document.getElementById("optiongroup");
  var espButton = document.getElementById("espInstallButton");
  

  
  // Thiết lập mặc định cho option đầu tiên
  espButton.setAttribute("manifest", optiongroup.options[0].value);
  document.getElementById('verstr').textContent = optiongroup.options[0].text;

  // Lắng nghe sự kiện khi người dùng thay đổi tùy chọn
  optiongroup.addEventListener("change", function() {
    var selectedManifest = this.value;
    
    if (!selectedManifest) {
      // Nếu không có tùy chọn nào được chọn, sử dụng tùy chọn đầu tiên
      espButton.setAttribute("manifest", optiongroup.options[0].value);
      document.getElementById('verstr').textContent = optiongroup.options[0].text;
    } else {
      // Sử dụng tùy chọn được chọn
      espButton.setAttribute("manifest", selectedManifest);
      document.getElementById('verstr').textContent = optiongroup.options[optiongroup.selectedIndex].text;
    }
  });
});
</script>

<script
  type="module"
  src="https://unpkg.com/flash-esp-web-bangnguyendev@1.0.1/dist/web/install-button.js?module">
</script>
