---
layout: post
title: "Smart Clock"
meta-title: "Smart Clock"
subtitle: "...Phần 2: Triển khai code cơ bản"
bigimg:
  - "/img/2020-01-17-smart-clock/anh-bia-baiviet.jpg"
image: /img/2020-01-17-smart-clock/anh-bia-baiviet.jpg
tags: [đồng hồ, smart, watch, clock, alarm, thingspeak, esp8266]
gh-repo: bangnguyendev/SmartClock
gh-badge: [star, watch, fork, follow]
# comments: true
---
----------------------------------------------------------------------------
Ở bài viết này, chúng ta sẽ làm việc với code sau khi các bạn đã cài đặt các phần mềm và chuẩn bị những phần cứng ở [**`Phần 1.`**](https://bangnguyendev.github.io/2020-01-17-smart-clock/ "Phần 1: Giới thiệu dự án")

Repo các bạn có thể nhấn vào các <kbd>Button Github</kbd> ở đầu bài (<kbd>star</kbd>, <kbd>watch</kbd>, <kbd>fork</kbd>, <kbd>follow</kbd>) để Clone Repo về máy tính cá nhân. Nếu máy các bạn không hiện ra thì có thể [nhấn ở đây để](https://github.com/bangnguyendev/SmartClock/ "Smart Clock") truy cập Repo.

{: .box-note}
**Khuyên dùng**: Sử dụng `Git` (GitHub Desktop, GitLab), `TortoiseGit` để lưu trữ & Clone Repo về.


### Đảm bảo kết nối wifi dễ dàng cho thiết bị (ở đây là đồng hồ)
Không riêng gì dự án này, ở một số dự án IoT nếu muốn thiết bị của chúng ta linh động hơn trong kết nối Wifi thì giải pháp được đề cập đến là `SmartConfig` (xem lại phần 1 chúng ta đã giới thiệu).
  - Đầu tiên chúng ta cần 1 cái `Smartphone` (máy tính bảng gì củng được - thu phát được sóng wifi 2.4GHz là được) để cài ứng dụng `Smartconfig`.
    - Link tải [**`app chính hãng`**](https://www.espressif.com/en/products/software/esp-touch/resources) từ ESP bao gồm `IOS` & `Android Code`. Tải app ở link này về để các bạn có thể tùy **biến lại giao diện** app nếu dùng Android Studio.
    ![Hình ảnh mô tả](/img/2020-01-23-smart-clock/APK_APP_SMARTCONFIG.png "Vào mục APKs để tải ứng dụng"){: .center-block :}
    - `Android` tải về dùng luôn: [ESP8266 SmartConfig](https://play.google.com/store/apps/details?id=com.cmmakerclub.iot.esptouch&hl=vi), [IoT Smartconfig](https://play.google.com/store/apps/details?id=com.iotmaker&hl=vi).
    - `IOS` tải về dùng luôn: [Espressif Esptouch](https://apps.apple.com/us/app/espressif-esptouch/id1071176700)
    - Cài trước đi nha, hướng dẫn sử dụng sau.
  - Vào code, chúng ta làm theo `quy trình` sau: 
    - **Bước 1.** Thiết bị sẽ `khởi động`.
    - **Bước 2.** Quá trình đọc `ssid và pass wifi` sẽ được lấy `trong bộ nhớ EEPROM` (với Wemos D1 mini mới mua về thì bước đọc bộ nhớ này sẽ cho ra kết quả rỗng - kết quả rỗng thì bước đăng nhập wifi sẽ không được - Wemos D1 mini sẽ vào `Bước 4`).
    - **Bước 3.** Sử dụng ssid và pass vừa đọc ra để `kết nối wifi`.
    - **Bước 4.** Nếu trong thời gian quy định mà việc kết nối vẫn `không thành công` thì sẽ nhảy vào quá trình `Smartconfig`.
    - **Bước 5.** `Timeout Smartconfig` chúng ta đặt ra là `100 giây` (các bạn muốn bao nhiêu giây thì chỉnh lại, riêng mình thấy 100s là hợp lí sau bao nhiêu lần thử nghiệm).
    - **Bước 6.** Trong thời gian 100 giây chúng ta `mở ứng dụng trên điện thoại`, lúc này màn hình giao diện sẽ yêu cầu chúng ta nhập ssid và pass cho Wemos D1 mini lấy data kết nối, nếu `kết nối thành công` thì ssid và pass sẽ được `lưu vào EEPROM`.
    - **Bước 7.** Nếu `không thành công` sau 100 giây thiết bị sẽ `khởi động lại` và bắt đầu quy trình đầu tiên.

    ![Lưu Đồ Giải Thuật](/img/2020-01-23-smart-clock/SSID_PASS_EEPROM_Diagram.png "Lưu Đồ Giải Thuật - Draw.io"){: .center-block :}

  - [`Code giúp ESP8266`](/documents/2020-01-23-smart-clock/Code-Smartconfig/Smartconfig.ino "Source Code") - Wemos D1 mini có khả năng lưu trữ và thay đổi wifi:

{% highlight c linenos %}
#include <ESP8266WiFi.h>
#include <Wire.h>
#include <EEPROM.h>
#define ESP_NB_ZERO 0
#define ESP_NB_ONE 1
#define ESP_NB_OFF 0
#define ESP_NB_ON 1
/*index 0 to 31 */
#define index_eeprom_SSID 32
/*index 32 to 95 */
#define index_eeprom_PASS 96
/*index 0 to 95 */
#define index_eeprom_WIFI 96
const char *ssid = "nguyenduybang";
const char *passphrase = "nguyenduybang";

void setup()
{
  /* Initialize Serial. */
  Serial.begin(115200);
  /* Initialize eeprom */
  EEPROM.begin(512);
  Serial.println("=========ĐỌC SSID PASS TỪ EEROM ĐÃ LƯU!!!====");
  /* read eeprom for ssid and pass */
  Serial.println("Reading EEPROM ssid");
  String esid = "";
  for (int i = 0; i < index_eeprom_SSID; ++i)
  {
    esid += char(EEPROM.read(i));
  }
  Serial.print("SSID: ");
  Serial.println(esid);

  Serial.println(" ");
  Serial.println("Reading EEPROM pass");
  String epass = "";
  for (int i = 32; i < index_eeprom_PASS; ++i)
  {
    epass += char(EEPROM.read(i));
  }
  Serial.print("PASS: ");
  Serial.println(epass);
  
  /* nho check lai dieu kien cho nay khi < 1 */
  if (esid.length() > ESP_NB_ONE)
  {
    WiFi.mode(WIFI_STA);
    WiFi.begin(esid.c_str(), epass.c_str());
    if (testWifi())
    {
      Serial.println("Vao test wifi ok!");
      delay(1500);
    }
    else //! KHÔNG THỂ KẾT NỐI
    {
      delay(1000);
      /* vào tìm kết nối wifi*/
      smartConfig_ndb();
    }
  }
  /* nếu SSID nhỏ hơn 0... thì yêu cầu kết nối wifi*/
  else
  {
    smartConfig_ndb();
  }
  WiFi.mode(WIFI_STA);
  Serial.println("");
  WiFi.printDiag(Serial);
  // In địa chỉ IP
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void smartConfig_ndb()
{
  //Mode wifi là station
  WiFi.mode(WIFI_STA);
  WiFi.beginSmartConfig();
  int dem = 100;
  while (1)
  {
    delay(1000);
    dem--;
    Serial.println(dem);
    if (dem == 0) //! neu qua 100s ma chua co ket noi nao thi restart lai esp
    {
      delay(2000);
      ESP.restart();
    }
    //Kiểm tra kết nối thành công in thông báo
    if (WiFi.smartConfigDone())
    {
      Serial.println("SmartConfig Success");
      String qsid = WiFi.SSID();
      String qpass = WiFi.psk();
      delay(5000);
      if (qsid.length() > 0 && qpass.length() > 0)
      {
        Serial.println("clearing eeprom");
        for (int i = 0; i < 96; ++i)
        {
          EEPROM.write(i, 0);
        }
        Serial.println(qsid);
        Serial.println("");
        Serial.println(qpass);
        Serial.println("");

        Serial.println("writing eeprom ssid:");
        for (int i = 0; i < qsid.length(); ++i)
        {
          EEPROM.write(i, qsid[i]);
          Serial.print("Wrote: ");
          Serial.println(qsid[i]);
        }
        Serial.println("writing eeprom pass:");
        for (int i = 0; i < qpass.length(); ++i)
        {
          EEPROM.write(32 + i, qpass[i]);
          Serial.print("Wrote: ");
          Serial.println(qpass[i]);
        }
        EEPROM.commit();
        break;
      }
    }
  }
}
bool testWifi(void)
{
  int c = 0;
  Serial.println("");
  Serial.println("Waiting for Wifi to connect");
  while (c < 40)
  {
    if (WiFi.status() == WL_CONNECTED)
    {
      return true;
    }
    delay(300);
    Serial.print(WiFi.status());
    /**
      typedef enum {
        WL_NO_SHIELD        = 255,   // for compatibility with WiFi Shield library
        WL_IDLE_STATUS      = 0,
        WL_NO_SSID_AVAIL    = 1,
        WL_SCAN_COMPLETED   = 2,
        WL_CONNECTED        = 3,
        WL_CONNECT_FAILED   = 4,
        WL_CONNECTION_LOST  = 5,
        WL_DISCONNECTED     = 6
      } wl_status_t;
    **/
    c++;
  }
  Serial.println("");
  Serial.println("Connect timed out, opening AP");
  return false;
}
void loop()
{
}

...
{% endhighlight %}

  - <kbd>void smartConfig_ndb()</kbd> trong đoạn code trên mình tạo một hàm riêng , trong quá trình sử dụng thiết bị nếu chúng ta `muốn thay đổi wifi` thì chỉ việc gọi hàm này ra.
  - **Sử dụng ứng dụng Smartconfig**: khi `Wemos D1 mini` vào chế độ `Smartconfig` chúng ta mở điện thoại đã cài đặt thành công ứng dụng, nhập dữ liệu tên wifi và pass và nhấn **`Comfirm`** - hình ảnh minh họa phía dưới. 
  ![Hướng dẫn sử dụng ứng dụng](/img/2020-01-23-smart-clock/Help_smartconfig.png "Quá trình kết nối Smartconfig qua phương thức ESPTouch"){: .center-block :}

### Đồng bộ thời gian từ pool.ntp.org

  ![ntp sever](/img/2020-01-23-smart-clock/ntp_sever.jpg){: .center-block .img-rounded :}

{% highlight c linenos %}
#include "time.h"

const char* ntpServer = "pool.ntp.org";
const long  gmtOffset_sec = 0;
const int   daylightOffset_sec = 3600;

/*
  %a Abbreviated weekday name
  %A Full weekday name
  %b Abbreviated month name
  %B Full month name
  %c Date and time representation for your locale
  %d Day of month as a decimal number (01-31)
  %H Hour in 24-hour format (00-23)
  %I Hour in 12-hour format (01-12)
  %j Day of year as decimal number (001-366)
  %m Month as decimal number (01-12)
  %M Minute as decimal number (00-59)
  %p Current locale's A.M./P.M. indicator for 12-hour clock
  %S Second as decimal number (00-59)
  %U Week of year as decimal number,  Sunday as first day of week (00-51)
  %w Weekday as decimal number (0-6; Sunday is 0)
  %W Week of year as decimal number, Monday as first day of week (00-51)
  %x Date representation for current locale
  %X Time representation for current locale
  %y Year without century, as decimal number (00-99)
  %Y Year with century, as decimal number
  %z %Z Time-zone name or abbreviation, (no characters if time zone is unknown)
  %% Percent sign
  You can include text literals (such as spaces and colons) to make a neater display or for padding between adjoining columns.
  You can suppress the display of leading zeroes  by using the "#" character  (%#d, %#H, %#I, %#j, %#m, %#M, %#S, %#U, %#w, %#W, %#y, %#Y)
*/

void printLocalTime()
{
  struct tm timeinfo;
  configTime(gmtOffset_sec, daylightOffset_sec, ntpServer);

  if(!getLocalTime(&timeinfo))
  {
    Serial.println(F(" Failed to obtain time"));
    return;
  }
  Serial.println(&timeinfo, " %d %B %Y %H:%M:%S ");
}
{% endhighlight %}

  - Tham khảo cách hiển thị thời gian [tại đây](/documents/2020-01-23-smart-clock/ntp-time/Gravity_date_codes.pdf).
  - Sau khi hiểu cách thức hoạt động và lấy thông tin thời gian cần thiết cho dự án của mình, việc tiếp theo chúng ta cần quan tâm là lựa chọn và sắp xếp bố cục thông tin thời gian trên LCD 20x04.

    ![gio-nhietdo-dam](/img/2020-01-23-smart-clock/gio-nhietdo-dam.jpg "Hiển thị giờ, nhiệt độ, độ ẩm, giờ báo thức, địa phương"){: .center-block .img-rounded :}

    ![gio-thu-ngay-thang-nam](/img/2020-01-23-smart-clock/gio-thu-ngay-thang-nam.jpg "Hiển thị thứ, giờ, ngày, tháng, năm"){: .center-block .img-rounded :}

  >Đây là cách mình bố trí hiển thị thông tin thời gian và một vài thứ khác. Các giao diện trên được mình thay đổi mỗi 5 giây.

  Trích đoạn **lưu đồ** và **code** được sử dụng để `hiển thị` 2 màn hình trên:

  ![Lưu đồ hiển thị](/img/2020-01-23-smart-clock/hien-thi-thoi-gian-Diagram.png){: .center-block .img-rounded :}

{% highlight c linenos %}
...
if (giay / 1 % 10 < 5)
/* Mỗi chế độ hiển thị 5 giây */
{
  /* Chỉ hiển thị vào ngày sinh nhật Dung */
  if ((ngay == DAY_DungNguyen) && (thang == MON_DungNguyen))
  {
    lcd.setCursor(0, 0);
    lcd.print("Dung Cute!");
    lcd.print("HPBD!");
    static int age_of_MsDung;
    age_of_MsDung = nam - 1994;
    lcd.setCursor(0, 1);
    lcd.print("Dung tron ");
    lcd.print(age_of_MsDung);
    lcd.print(" tuoi.");
    Serial.println("Sanh thần Dung ngáo :3");
  }
  /* Hiển thị các ngày bình thường */
  else
  {
    lcd.setCursor(0, 0);
    lcd.write(0);
    /* Canh giữa màn hình các hiển thị Thứ */
    /* Sunday Monday Friday*/
    if ((thu == 0) || (thu == 1) || (thu == 5))
    {
      lcd.setCursor(6, 0);
      lcd.print(buffer_THU);
    }
    /* Tuesday   */
    else if (thu == 2)
    {
      lcd.setCursor(5, 0);
      lcd.print(buffer_THU);
    }
    /* Thursday Saturday  */
    else if ((thu == 4) || (thu == 6))
    {
      lcd.setCursor(5, 0);
      lcd.print(buffer_THU);
    }
    /* Wednesday  */
    else if (thu == 3)
    {
      lcd.setCursor(4, 0);
      lcd.print(buffer_THU);
    }
    /* */
    lcd.setCursor(19, 0);
    lcd.write(2);

    lcd.setCursor(0, 1);
    lcd.write(3);

    /*  *___XX_May_2019____* */
    if (thang == 5)
    {
      lcd.setCursor(4, 1);
      lcd.print(buffer_N_T_N);
    }
    /*  *___XX_June_2019___*
    July  */
    else if ((thang == 6) || (thang == 7))
    {
      lcd.setCursor(4, 1);
      lcd.print(buffer_N_T_N);
    }
    /*  *__XX_March_2019___*
    April  */
    else if ((thang == 3) || (thang == 4))
    {
      lcd.setCursor(3, 1);
      lcd.print(buffer_N_T_N);
    }
    /*  *__XX_August_2019__* */
    else if (thang == 8)
    {
      lcd.setCursor(3, 1);
      lcd.print(buffer_N_T_N);
    }
    /*  *_XX_January_2019__*
    October */
    else if ((thang == 10) || (thang == 1))
    {
      lcd.setCursor(2, 1);
      lcd.print(buffer_N_T_N);
    }
    /*  *_XX_February_2019_*
    November December  */
    else if ((thang == 11) || (thang == 2) || (thang == 12))
    {
      lcd.setCursor(2, 1);
      lcd.print(buffer_N_T_N);
    }
    /* *_XX_September_2019* */
    else if (thang == 9)
    {
      lcd.setCursor(2, 1);
      lcd.print(buffer_N_T_N);
    }
    lcd.setCursor(19, 1);
    lcd.write(5);
  }
}
else
/* Hiển thị thời tiết */
{
  if (temp == 0)
  {
    lcd.setCursor(0, 0);
    lcd.print("WL_CONNECTION_LOST");
    lcd.setCursor(0, 1);
    lcd.print("time.nist.gov LOST");
  }
  else
  {

    lcd.setCursor(0, 0);
    lcd.write(0);
    lcd.print(hen_gio / 10 % 10);
    lcd.print(hen_gio / 1 % 10);
    lcd.print(":");
    lcd.print(hen_phut / 10 % 10);
    lcd.print(hen_phut / 1 % 10);
    lcd.setCursor(6, 0);
    lcd.write(2);
    lcd.write(4);
    lcd.write(0);
    lcd.print("  H: ");
    lcd.print(humidity);
    lcd.print("%");
    lcd.setCursor(19, 0);
    lcd.write(2);

    lcd.setCursor(0, 1);
    lcd.write(3);
    if (value_Location_EEPROM == 0)
    {
      lcd.print("TpHcm"); /* chuyen thanh location */
    }
    else if (value_Location_EEPROM == 1)
    {
      lcd.print("VgTau"); /* chuyen thanh location */
    }
    else if (value_Location_EEPROM == 2)
    {
      lcd.print("DaLat"); /* chuyen thanh location */
    }
    else if (value_Location_EEPROM == 3)
    {
      lcd.print("TpHue"); /* chuyen thanh location */
    }
    lcd.setCursor(6, 1);
    lcd.write(5);
    lcd.write(1);
    lcd.write(3);
    lcd.print("T: ");
    lcd.print(temp);
    lcd.print("*C");
    lcd.write(5);
  }
}
/* Hiển thị giờ Font số lớn */
printDigits(gio / 10 % 10, 0, 2);
printDigits(gio / 1 % 10, 4, 2);
/* Hiển thị dấu 2 chấm giờ & phút */
if (giay % 2 == 0)
{
  lcd.setCursor(8, 2);
  lcd.write(1);
  lcd.setCursor(8, 3);
  lcd.write(4);
}
else
{
  lcd.setCursor(8, 2);
  lcd.write(4);
  lcd.setCursor(8, 3);
  lcd.write(1);
}
/* Hiển thị phút Font số lớn */
printDigits(phut / 10 % 10, 10, 2);
printDigits(phut / 1 % 10, 14, 2);
/* Hiển thị giây */
lcd.setCursor(17, 3);
lcd.print(":");
lcd.print(buffer_GIAY);
...
{% endhighlight %}

### Đồng bộ thời tiết từ OpenWeatherMap

Ở phần lấy dữ liệu thời tiết hoạt động theo chu trình:
  - Khởi động thiết bị và đọc vị trí lưu ở EEPROM
  - Sử dụng vị trí đã lưu để cập nhập thời tiết
  - Cứ mỗi 10 phút chúng ta sẽ update dữ liệu thời tiết tại vị trí đang set trước đó qua hàm `Call_Weather_Every_10Min()`
{% highlight c linenos %}
/* Hàm gọi thời tiết mỗi 10 phút một lần */
void Call_Weather_Every_10Min()
{
  if ((unsigned long)(millis() - time_dem_thoitiet) > 60 * 10 * 1000) //10 phut/ lan
  {
    time_dem_thoitiet = millis();
    Weather_Online_sever();
  }
}
{% endhighlight %}
  - Trong quá trình sử dụng nếu chúng ta muốn thay đổi vị trí thì gọi hàm `Choose_location()`
{% highlight c linenos %}
/* Chon vi tri doc gia tri thoi tiet */
void Choose_location()
{
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Hold Mode Key >= 1s ");
  lcd.setCursor(0, 1);
  lcd.print("TpHCM> VgTau> DaLat>");
  lcd.setCursor(0, 2);
  lcd.print("VgTau> DaLat> TpHue>");
  lcd.setCursor(0, 3);
  lcd.print("DaLat> TpHue> TpHCM>");
  unsigned long dem_10s_stop = millis();
  int dem_location = 0;
  while (((unsigned long)(millis() - dem_10s_stop) < 10000) && (status_Mode == 0))
  {
    if (digitalRead(Button_Mode) == HIGH) // nếu nút bấm ở mức thấp
    {
      delay(500); //check chac chan la do ng nhan nut
      if (digitalRead(Button_Mode) == HIGH)
      {
        long startTime = millis();				 // giá trị ban đầu được gán bằng giá trị hiện tại của millis
        while (digitalRead(Button_Mode) == HIGH) // đợi cho nút bấm được giữ
        {
          /* khi nhan nut thi set lai time out mode */
          dem_10s_stop = millis();
          /* check hanh vi nut nhan */
          Serial.println(millis() - startTime);
          couter_Mode = (millis() - startTime) / 1000;
          couter_Mode = couter_Mode / 1 % 10;
          lcd.setCursor(0, 0);
          lcd.print("Couter: ");
          lcd.print(couter_Mode);
          lcd.print(" seconds  ");
          if (couter_Mode < 1)
          {
          }
          else if (couter_Mode >= 9)
          {
            /* mode xoay vong nen dem 1 den 9 thi reset */
            startTime = millis();
            lcd.setCursor(0, 1);
            lcd.print("Loca:    Hue        ");
            lcd.setCursor(0, 2);
            lcd.print("         HCMC       ");
            lcd.setCursor(0, 3);
            lcd.print("         VungTau    ");
          }
          else if (couter_Mode >= 7)
          {
            value_Location_EEPROM = 3;
            lcd.setCursor(0, 1);
            lcd.print("Loca: >> Hue        ");
            lcd.setCursor(0, 2);
            lcd.print("         HCMC       ");
            lcd.setCursor(0, 3);
            lcd.print("         VungTau    ");
          }
          else if (couter_Mode >= 5)
          {
            value_Location_EEPROM = 2;
            lcd.setCursor(0, 1);
            lcd.print("Loca: >> DaLat      ");
            lcd.setCursor(0, 2);
            lcd.print("         Hue        ");
            lcd.setCursor(0, 3);
            lcd.print("         HCMC       ");
          }
          else if (couter_Mode >= 3)
          {
            value_Location_EEPROM = 1;
            lcd.setCursor(0, 1);
            lcd.print("Loca: >> VungTau    ");
            lcd.setCursor(0, 2);
            lcd.print("         DaLat      ");
            lcd.setCursor(0, 3);
            lcd.print("         Hue        ");
          }
          else if (couter_Mode >= 1)
          {
            value_Location_EEPROM = 0;
            lcd.setCursor(0, 1);
            lcd.print("Loca: >> HCMC       ");
            lcd.setCursor(0, 2);
            lcd.print("         VungTau    ");
            lcd.setCursor(0, 3);
            lcd.print("         DaLat      ");
          }
          yield(); // disble Soft WDT reset - NodeMCU
        };
        Serial.printf("couter_Mode: ");
        Serial.println(couter_Mode);
        if (couter_Mode < 1)
        {
        }
        else if (couter_Mode >= 7)
        {
          value_Location_EEPROM = 3;
          lcd.setCursor(0, 0);
          lcd.print("Location Selection: ");
          lcd.setCursor(0, 1);
          lcd.print("         Hue        ");
          lcd.setCursor(0, 2);
          lcd.print("                    ");
          lcd.setCursor(0, 3);
          lcd.print("                    ");
          customT(0, 2);
          delay(100);
          customP(0 + 4, 2);
          delay(100);
          customH(0 + 4 + 4, 2);
          delay(100);
          customU(0 + 4 + 4 + 4, 2);
          delay(100);
          customE(0 + 4 + 4 + 4 + 4, 2);
          delay(800);
        }
        else if (couter_Mode >= 5)
        {
          value_Location_EEPROM = 2;
          lcd.setCursor(0, 0);
          lcd.print("Location Selection: ");
          lcd.setCursor(0, 1);
          lcd.print("       Dat Lat      ");
          lcd.setCursor(0, 2);
          lcd.print("                    ");
          lcd.setCursor(0, 3);
          lcd.print("                    ");
          customD(0, 2);
          delay(100);
          customA(0 + 4, 2);
          delay(100);
          customL(0 + 4 + 4, 2);
          delay(100);
          customA(0 + 4 + 4 + 4, 2);
          delay(100);
          customT(0 + 4 + 4 + 4 + 4, 2);
          delay(800);
        }
        else if (couter_Mode >= 3)
        {
          value_Location_EEPROM = 1;
          lcd.setCursor(0, 0);
          lcd.print("Location Selection: ");
          lcd.setCursor(0, 1);
          lcd.print("      Vung Tau      ");
          lcd.setCursor(0, 2);
          lcd.print("                    ");
          lcd.setCursor(0, 3);
          lcd.print("                    ");
          customV(0, 2);
          delay(100);
          customG(0 + 4, 2);
          delay(100);
          customT(0 + 4 + 4, 2);
          delay(100);
          customA(0 + 4 + 4 + 4, 2);
          delay(100);
          customU(0 + 4 + 4 + 4 + 4, 2);
          delay(800);
        }
        else if (couter_Mode >= 1)
        {
          value_Location_EEPROM = 0;
          lcd.setCursor(0, 0);
          lcd.print("Location Selection: ");
          lcd.setCursor(0, 1);
          lcd.print("        TPHCM       ");
          lcd.setCursor(0, 2);
          lcd.print("                    ");
          lcd.setCursor(0, 3);
          lcd.print("                    ");
          customT(0, 2);
          delay(100);
          customP(0 + 4, 2);
          delay(100);
          customH(0 + 4 + 4, 2);
          delay(100);
          customC(0 + 4 + 4 + 4, 2);
          delay(100);
          customM(0 + 4 + 4 + 4 + 4, 2);
          delay(800);
        }
      }
    }
    yield(); // disble Soft WDT reset - NodeMCU
  }
  /* set lai gia tri cho su dung lan sau */
  status_Mode = 0;
  /* luu gia tri vao eeprom */
  EEPROM.write(index_eeprom_location_eeprom, value_Location_EEPROM);
  EEPROM.commit();
  Serial.print("value_Location_EEPROM duoc set eeprom: ");
  Serial.println(EEPROM.read(index_eeprom_location_eeprom));
  /* Chuông báo ok */
  digitalWrite(signal_Bell, ESP_NB_ON);
  delay(300);
  digitalWrite(signal_Bell, ESP_NB_OFF);
}
{% endhighlight %}
  - Trước khi hàm `Choose_location()` kết thúc vị trí sẽ được lưu vào EEPROM và lưu vào biến `Location`
  - Gọi hàm `Weather_Online_sever()` để cập nhật thời tiết 
{% highlight c linenos %}
/* Lay gia tri thoi tiet tai vi tri da chon */
void Weather_Online_sever()
{
  if (value_Location_EEPROM == 0)
  {
    Location = "1566083";
  }
  else if (value_Location_EEPROM == 1)
  {
    Location = "1562414";
  }
  else if (value_Location_EEPROM == 2)
  {
    Location = "1584071";
  }
  else if (value_Location_EEPROM == 3)
  {
    Location = "1565033";
  }

  if (WiFi.status() == WL_CONNECTED) //Check WiFi connection status
  {
    HTTPClient http; //Declare an object of class HTTPClient

    // specify request destination
    http.begin("http://api.openweathermap.org/data/2.5/weather?id=" + Location + "&APPID=" + APIKey_openweather);

    int httpCode = http.GET(); // send the request

    if (httpCode > 0) // check the returning code
    {
      String payload = http.getString(); //Get the request response payload

      DynamicJsonBuffer jsonBuffer(512);

      // Parse JSON object
      JsonObject &root = jsonBuffer.parseObject(payload);
      if (!root.success())
      {
        Serial.println(F("Parsing failed !"));
      }

      temp = (float)(root["main"]["temp"]) - 273.15;		 // get temperature in °C
      humidity = root["main"]["humidity"];				 // get humidity in %
      pressure = (float)(root["main"]["pressure"]) / 1000; // get pressure in bar
      wind_speed = root["wind"]["speed"];					 // get wind speed in m/s
      wind_degree = root["wind"]["deg"];					 // get wind degree in °

      // print data
      Serial.printf("Temperature = % .2f°C\r\n", temp);
      Serial.printf("Humidity = % d % %\r\n", humidity);
      // Serial.printf("Pressure = % .3f bar\r\n", pressure);
      // Serial.printf("Wind speed = % .1f m / s\r\n", wind_speed);
      // Serial.printf("Wind degree = % d°\r\n\r\n", wind_degree);
    }
    http.end(); //Close connection
    yield();	// disble Soft WDT reset - NodeMCU
  }
}
{% endhighlight %}

------------------------------------------------------------

{: .box-note}
**Note:** [Phần 3 chúng ta sẽ làm việc với các Mode - Sử dụng một nút nhấn cho nhiều MODE](/2020-11-12-mot-nut-nhan-nhieu-tinh-nang)

