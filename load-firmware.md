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

### ESP Web Tools - bangnguyendev

User friendly tools to manage **ESP8266** and **ESP32** devices in the browser:

- Install & update firmware

- Connect device to the Wi-Fi network

- Visit the device's hosted web interface

- Access logs and send terminal commands

- Add devices to [Home Assistant](https://www.home-assistant.io/)

<script
  type="module"
  src="https://unpkg.com/esp-web-tools-bangnguyendev@10.0.2/dist/web/install-button.js?module">
</script>

<link rel="stylesheet" href="/dist/css/main-bio.css">

<div style="text-align: center;">
  <h2>👇👇👇</h2>
  <esp-web-install-button  manifest="/dist/json/manifest_ESP8266_ESP32.json">
  <button class="action action--button" slot="activate"><i class="fa fa-usb"></i><span class="action__text">Connect & Install</span></button>
  </esp-web-install-button>
</div>

### How it works

**ESP Web Tools** works by combining **Web Serial**, **Improv Wi-Fi** (optional), and a manifest which describes the firmware. 

**ESP Web Tools** detects the chipset of the connected ESP device and **automatically selects the right firmware** variant from the manifest.

Web Serial is **available** in `Google Chrome` and `Microsoft Edge` browsers. Android support should be possible but has not been implemented yet.

### Configuring Wi-Fi

**ESP Web Tools** supports the `Improv` Wi-Fi serial standard. This is an open standard to allow configuring Wi-Fi via the serial port.

If the firmware supports `Improv`, a user will be asked to connect the device to the network after installing the firmware. 

Once connected, the device can send the user to a URL to finish configuration. For example, this can be a link to the device's IP address where it serves a local UI.

At any time in the future a user can use ESP Web Tools to find the device link or to reconfigure the Wi-Fi settings without doing a reinstall.

<div class="post-img-post">
    <img src="https://esphome.github.io/esp-web-tools/static/screenshots/dashboard.png" loading="lazy">
</div>


### Thank you ESP Web Tools team

- *ESP Web Tools is a project by [ESPHome](https://esphome.io/).*

- *Development is funded by [Nabu Casa](https://www.nabucasa.com/).*

- *ESP Web Tools is [open source](https://github.com/esphome/esp-web-tools).*