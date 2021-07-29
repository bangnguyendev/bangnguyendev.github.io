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
