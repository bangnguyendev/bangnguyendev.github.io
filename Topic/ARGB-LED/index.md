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

[On this page](basics/tutorials) you can find excellent tutorials made by the community and helpful tools to help you get your new lamp up and running!

#### 🖼️ User interface

<img src="assets/images/ui/headers/macbook-pro-space-gray-on-the-wooden-table.jpg" width="50%"><img src="assets/images/ui/headers/walking-with-iphone-x.jpg" width="50%">

<!-- #### 💾 Compatible hardware

See [here](basics/compatible-hardware)! -->

<!-- #### ✌️ Other

Licensed under the MIT license   -->

### ✌️ Happy Smart Light - bangnguyendev

