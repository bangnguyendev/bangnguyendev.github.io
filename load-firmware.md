---
layout: page
title: "Load firmware using ESP Web Tools"
meta-title: "ESP Web Tools"
subtitle: "... Load firmware using ESP Web Tools"
bigimg:
  - "/img/2024-04-10-What-Is-a-Sandbox-Environment/banner.webp"
image: "/img/2024-04-10-What-Is-a-Sandbox-Environment/avatar.webp"
tags: [esp web tools, Web serial, bluetooth]
category: Programming MCU
# gh-repo: bangnguyendev/Documents
# gh-badge: [star, watch, fork, follow]
# author: "BangNguyen"
comments: true
---
<!-- Sử dụng cho button class="action action--button" -->
<link rel="stylesheet" href="/dist/css/main-bio.css"> 

<div style="text-align: center;">
  <h4>ESP Web Tools - bangnguyendev</h4>
  <!-- Lựa chọn các option -->
  <div>
    <label for="optiongroup">Choose a firmware:</label>
    <select id="optiongroup">
      <optgroup label="Example ESP Web Tools - OTA">
        <option value="/dist/json/manifest_ESP8266_ESP32.json">ESP Web Tools - OTA - v1.0.0</option>
      </optgroup>
      <optgroup label="ARGB Led - WSxxxx">
        <option value="/dist/json/manifest_ESP8266_ESP32_ARGB.json">ARGB Led - WSxxxx - v1.0.0</option>
      </optgroup>
    </select>
  </div>
  Plug in your ESP to a USB port. <br>We will install <span style="font-weight: bold;" id="verstr"></span> to it.<br>
  <!-- Button install ESP -->
  <esp-web-install-button id="espInstallButton">
  <button class="action action--button" slot="activate"><i class="fa fa-usb"></i><span class="action__text">Connect & Install</span></button>
  </esp-web-install-button>
</div>





>User friendly tools to manage **ESP8266** and **ESP32** devices in the browser:
>
>- Install & update firmware
>
>- Connect device to the Wi-Fi network
>
>- Visit the device's hosted web interface
>
>- Access logs and send terminal commands
>
>- Add devices to [Home Assistant](https://www.home-assistant.io/)

```
npm i flash-esp-web-bangnguyendev
```
#### *Link repo:*

- [NPM flash-esp-web-bangnguyendev@1.0.0](https://www.npmjs.com/package/flash-esp-web-bangnguyendev)

- [UNPKG flash-esp-web-bangnguyendev@1.0.0](https://unpkg.com/browse/flash-esp-web-bangnguyendev@1.0.0/)


-----------------------------

#### Adding ESP Web Tools to your website

```html
<script
  type="module"
  src="https://unpkg.com/flash-esp-web-bangnguyendev@1.0.1/dist/web/install-button.js?module">
</script>

<esp-web-install-button  manifest="/dist/json/manifest_ESP8266_ESP32.json">
  <button slot="activate"><i class="fa fa-usb"></i><span class="action__text">Connect & Install</span></button>
</esp-web-install-button>

```

-----------------------------

#### How it works

**ESP Web Tools** works by combining **Web Serial**, **Improv Wi-Fi** (optional), and a manifest which describes the firmware. 

**ESP Web Tools** detects the chipset of the connected ESP device and **automatically selects the right firmware** variant from the manifest.

Web Serial is **available** in `Google Chrome` and `Microsoft Edge` browsers. Android support should be possible but has not been implemented yet.

#### Configuring Wi-Fi

**ESP Web Tools** supports the `Improv` Wi-Fi serial standard. This is an open standard to allow configuring Wi-Fi via the serial port.

If the firmware supports `Improv`, a user will be asked to connect the device to the network after installing the firmware. 

Once connected, the device can send the user to a URL to finish configuration. For example, this can be a link to the device's IP address where it serves a local UI.

At any time in the future a user can use ESP Web Tools to find the device link or to reconfigure the Wi-Fi settings without doing a reinstall.

-----------------------------

#### Thank you ESP Web Tools team

- *ESP Web Tools is a project by [ESPHome](https://esphome.io/).*

- *Development is funded by [Nabu Casa](https://www.nabucasa.com/).*

- *ESP Web Tools is [open source](https://github.com/esphome/esp-web-tools).*




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
