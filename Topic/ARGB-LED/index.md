---
layout: page
title: Bộ điều khiển led ARGB
meta-title: Bộ điều khiển led ARGB
# subtitle: "... Welcome to ARGB"
bigimg:
  - "image/BANER__ARGB.png"
image: "image/BANER__ARGB.png"
tags: [ARGB, ws2811, ws2812b, strip leds]
category: Programming MCU
# gh-repo: bangnguyendev/flash-esp-web-bangnguyendev
# gh-badge: [fork]
# author: "BangNguyen"
# comments: true
---

### Chào mừng đến với bộ điều khiển led ARGB! ✨

- [Basics - Bắt đầu cơ bản](basics/getting-started)

- [Features - Effects - Hiệu ứng](features/effects) 

- [Features - Palettes - Bảng màu](features/palettes) 

- [Một số video hướng dẫn](basics/tutorials)


**Triển khai nhanh chóng** và nhiều tính năng để điều khiển đèn **LED NeoPixel** (WS2812B, WS2811, SK6812, ...) hoặc các chipsets dựa trên SPI như WS2801 và APA102!

<link rel="stylesheet" href="/Topic/ARGB-LED/assets/js/styles.css">
<div class="image-gallery">
   <div class="image-item">
      <img src="/Topic/ARGB-LED/image/3D_box_PCB1_2024-06-16.png" alt="Image 1" onclick="openModal(this.src)">
   </div>
   <div class="image-item">
      <img src="/Topic/ARGB-LED/image/3D_PCB1_mat-truoc.png" alt="Image 2" onclick="openModal(this.src)">
   </div>
   <div class="image-item">
      <img src="/Topic/ARGB-LED/image/3D_PCB1_mat-sau.png" alt="Image 3" onclick="openModal(this.src)">
   </div>
   <div class="image-item">
      <img src="/Topic/ARGB-LED/image/3D_PCB1.png" alt="Image 4" onclick="openModal(this.src)">
   </div>
</div>

<!-- Modal to display full-size image -->
<div id="imageModal" class="modal" onclick="closeModal()">
   <span class="close">&times;</span>
   <img class="modal-content" id="modalImage">
</div>

<script>
   function openModal(src) {
      document.getElementById('imageModal').style.display = "block";
      document.getElementById('modalImage').src = src;
   }

   function closeModal() {
      document.getElementById('imageModal').style.display = "none";
   }
</script>

### 💡 Các loại chip Led được hổ trợ

- [Các loại chip Led được hổ trợ](basics/compatible-led-strips)

#### Bảng 1: SPI 3-wire và SPI 4-wire

| **SPI 3-wire**        | **SPI 4-wire**          |
|-----------------------|-------------------------|
| WS281x                | APA102                  |
| SK6812/WS2814 RGBW    | LPD8806                 |
| TM1814                | LPD6803                 |
| 400kHz                | P9813                   |
| TM1829                |                         |
| UCS8903               |                         |
| UCS8904 RGBW          |                         |
| WS2801                |                         |

#### Bảng 2: PWM và Others

| **PWM**              | **Others**              |
|----------------------|-------------------------|
| WS2811 White         | On/Off                  |
| PWM White            | DDP RGB (network)       |
| PWM CCT              | E1.31 RGB (network)     |
| PWM RGB              | Art-Net RGB (network)   |
| PWM RGBW             | DDP RGBW (network)      |
| PWM RGB+CCT          |                         |
| PWM RGB+DCCT         |                         |


#### ⚙️ Tính năng

- Thư viện **WS2812FX** tích hợp cho **hơn 180 hiệu ứng đặc biệt**
- Hiệu ứng **FastLED** và 50 bảng màu
- Giao diện hiện đại với điều khiển màu sắc, hiệu ứng và **phân đoạn Led**
- **Phân đoạn** để đặt các hiệu ứng và màu sắc khác nhau **cho các phần của đèn LED**
- Két nối mạng wifi thông minh.
- Tối đa **2 ngõ đầu ra kết nối đèn LED** cho mỗi mạch ARGB v1.0.0 (**mỗi đầu ra 800 leds**)
- Có thể kết nối không giới hạn các module ARGB v1.0.0
- **Tối đa 250 Preset** của người dùng để dễ dàng lưu và tải màu sắc/hiệu ứng, hỗ trợ chuyển đổi qua lại giữa chúng
- **Preset** có thể được sử dụng để tự động thực thi các lệnh API
- Chức năng đèn ngủ (giảm dần độ sáng)
- Cập nhật phần mềm OTA đầy đủ (HTTP + ArduinoOTA), có thể bảo vệ bằng mật khẩu.
- Đồng hồ analog có thể cấu hình + **hỗ trợ bộ kit Cronixie của Diamex**
- Giới hạn độ sáng tự động có thể cấu hình để hoạt động an toàn hơn.
- Cấu hình dựa trên hệ thống tập tin để **dễ dàng sao lưu cài đặt** trước và cài đặt.

<!-- - Native [Home-Assistant integration](https://www.home-assistant.io/integrations/wled/): [![Start native Homeassistant integration configuration](https://my.home-assistant.io/badges/config_flow_start.svg)](https://my.home-assistant.io/redirect/config_flow_start?domain=wled) -->

### 💡 Ứng dụng điều khiển mạch

#### ⚡Phần mềm bắt buộc:

- 💻Trên PC/laptop:
   - 🔥 [WLED PC – LED Control](https://github.com/w00000dy/WLED-GUI/releases/): Công cụ **điều khiển chính**

- 📱Trên Smartphone:
   - 🔥 Ứng dụng **Android**: [WLED](https://play.google.com/store/apps/details?id=ca.cgagnier.wlednativeandroid)
   - 🔥 Ứng dụng **iOS**: [WLED](https://apps.apple.com/us/app/wled-native/id6446207239)

#### ⚡Phần mềm tùy chọn trên PC/laptop:
- 🔥 [xLights – LED Control](https://xlights.org/releases/): Điều khiển và lập trình LED chuyên nghiệp.
- 🔥 [Jinx! – LED Matrix Control](https://live-leds.de/): Điều khiển LED cho bảng ma trận chuyên dụng.
- 🔥 [LedFx](https://www.ledfx.app/): Điều khiển LED nhấp nháy theo nhạc sống động.
- 🔥 [Lightpack - Prismatik](https://github.com/psieg/Lightpack/releases): Hiệu ứng **Ambilight** trang trí màn hình PC/laptop.
- 🔥 [Hyperion](https://github.com/hyperion-project/hyperion.ng): Trang trí LED cho TV với hiệu ứng đẹp mắt.

#### ⚡👉 [Danh sách các phần mềm khác](basics/compatible-software).


### 💡 Các chuẩn kết nối ARGB có thể sử dụng

- [JSON](interfaces/json-api) and [HTTP request](interfaces/http-api) APIs  
- [MQTT](interfaces/mqtt)  
<!-- - [Blynk IoT](interfaces/blynk)   -->
- [E1.31](interfaces/e1.31-dmx), [Art-Net](interfaces/e1.31-dmx), DDP and [TPM2.net](interfaces/udp-realtime)
- [UDP realtime](interfaces/udp-realtime)
- [Alexa voice control (including dimming and color)](/advanced/remote-access-ifttt)
- [Sync to Philips Hue lights](interfaces/philips-hue)
- Adalight (PC ambilight via serial) và TPM2 -> Trang trí màn hình PC/Laptop siêu đẹp
- [Sync color of multiple ARGB devices (UDP notifier)](interfaces/udp-notifier)
- [Infrared remotes (24-key RGB, receiver required)](interfaces/infrared)
- Simple timers/schedules (time from NTP, timezones/DST supported)  

## ✌️ Happy Smart Light - bangnguyendev

{: .box-warning}
**Mục này dành cho nạp lại bo mạch:** Đối với mạch điều khiển LED **ARGB Happy Smart Light** chỉ có tiếng Việt cho chip **ESP32** và **ESP32-S3**.

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
