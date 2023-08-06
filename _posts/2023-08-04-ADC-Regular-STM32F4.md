---
layout: post
title: "Đọc nhiều kênh ADC"
meta-title: "Đọc nhiều kênh ADC"
subtitle: "... mà không sử dụng DMA trong STM32F4"
bigimg:
  - "/img/2023-08-04-ADC-Regular-STM32F4/Untitled%206.png"
image: /img/2023-08-04-ADC-Regular-STM32F4/avatar_ADC.jpg
tags: [STM32F4, STM32, ADC, Regular, LCD2004, 12-BIT]
category: lap-trinh-vi-dieu-khien
# gh-repo: bangnguyendev/SmartClock
# gh-badge: [star, watch, fork, follow]
comments: true
---

ADC là viết tắt của "**Analog-to-Digital Converter**" trong tiếng Anh, tạm dịch là "**Bộ chuyển đổi từ tín hiệu analog sang số**." Đây là một công nghệ quan trọng trong lĩnh vực điện tử và vi điều khiển.

**ADC** cho phép chúng ta **chuyển đổi tín hiệu analog, như điện áp, dòng điện, ánh sáng, nhiệt độ, hay các thông số liên tục khác**, thành dạng số **để có thể xử lý bởi vi xử lý hay máy tính**.

>[Analog-to-digital converter - Wikipedia](https://en.wikipedia.org/wiki/Analog-to-digital_converter)

### ADC là gì? Tại sao chúng ta cần ADC?

**Trong thế giới thực, nhiều thông tin và tín hiệu xung quanh chúng ta là dạng analog**, tức là có giá trị biến đổi một cách liên tục trong thời gian hoặc không gian. 

**Để xử lý và hiểu các tín hiệu này bằng vi điều khiển hoặc máy tính, chúng ta cần biến đổi chúng thành dạng số.** 


<div class="post-img-post">
    <img src="/img/2023-08-04-ADC-Regular-STM32F4/ICL7107CDL.jpg">
 <br>
INTERSIL ICL7107. 3.5 digit (i.e. conversion from analog to a numeric range of 0 to 1999 vs. 3 digit range of 0 to 999, typically used in meters, counters, etc.) single-chip A/D converter
</div>

<div class="post-img-post">
    <img src="/img/2023-08-04-ADC-Regular-STM32F4/ICM7107.jpg">
 <br>
ICL7107 silicon die
</div>

<div class="post-img-post">
    <img src="/img/2023-08-04-ADC-Regular-STM32F4/comb72.gif">
 <br>
An 6-level ADC coding scheme
</div>


#### ⚙️Ví dụ minh họa

Giả sử bạn muốn **đo độ sáng** của môi trường xung quanh và **hiển thị giá trị đó trên màn hình LCD**. 

Bộ cảm biến ánh sáng (quang trở) sẽ cung cấp một tín hiệu analog tương ứng với độ sáng. Để hiển thị giá trị đó trên LCD, **chúng ta cần chuyển đổi tín hiệu analog này thành dạng số**. 

<div class="post-img-post">
    <img src="/img/2023-08-04-ADC-Regular-STM32F4/light-sensor.gif">
 <br>
Ví dụ ADC chuyển đổi phân giải 8 bit
</div>


#### ⚙️Cách ADC hoạt động

ADC hoạt động bằng cách lấy mẫu tín hiệu analog vào và đo đạc giá trị của nó tại các thời điểm cố định (tần số lấy mẫu). Sau đó, giá trị này sẽ được biểu diễn thành dạng số bằng cách ánh xạ nó vào các giá trị số tương ứng. 

![0315AD-1.gif](/img/2023-08-04-ADC-Regular-STM32F4/0315AD-1.gif)

#### ⚙️Độ phân giải ADC

**ADC có độ phân giải bit càng lớn** thì mô phỏng lại **tín hiệu Analog càng mịn càng chi tiết**, càng giống thật.

Độ phân giải của ADC đo lường khả năng của nó để chia nhỏ một phạm vi tín hiệu đầu vào analog thành các giá trị số lượng (bits).

<div class="post-img-post">
    <img src="/img/2023-08-04-ADC-Regular-STM32F4/images.jpg">
 <br>
Các ví dụ độ phân giải của ADC
</div>

**Độ phân giải được biểu thị bằng số bit.**

Ví dụ, một `ADC 1-bit` có khả năng chia phạm vi tín hiệu đầu vào thành **2^1 = 2** giá trị số khác nhau. Điều này có nghĩa rằng ADC có thể đo và chuyển đổi tín hiệu analog thành **2** mức số khác nhau là `1` và `0`.

Ví dụ, một `ADC 2-bit` có khả năng chia phạm vi tín hiệu đầu vào thành **2^2 = 4** giá trị số khác nhau. Điều này có nghĩa rằng ADC có thể đo và chuyển đổi tín hiệu analog thành **4** mức số khác nhau là `00`, `01`, `10`, `11`.

Ví dụ, một `ADC 4-bit` có khả năng chia phạm vi tín hiệu đầu vào thành **2^4 = 16** giá trị số khác nhau. Điều này có nghĩa rằng ADC có thể đo và chuyển đổi tín hiệu analog thành **16** mức số khác nhau là `0000` `0001` `0010` ... `1111`.

Ví dụ, một `ADC 16-bit` có khả năng chia phạm vi tín hiệu đầu vào thành **2^16 = 65536** giá trị số khác nhau. Điều này có nghĩa rằng ADC có thể đo và chuyển đổi tín hiệu analog thành **65536** mức số khác nhau.

<div class="post-img-post">
    <img src="/img/2023-08-04-ADC-Regular-STM32F4/ADC_animation_5vol.gif">
 <br>
Ví dụ độ phân giải `10-bit` của ADC
</div>

#### ⚙️Ứng dụng của ADC

ADC được sử dụng rộng rãi trong các lĩnh vực công nghệ cao như:

1. Đo lường và kiểm soát các thông số môi trường như nhiệt độ, ánh sáng, độ ẩm,...
2. Xử lý âm thanh và video số
3. Truyền thông không dây và điện thoại di động
4. Đo lường và kiểm soát trong các hệ thống điện tử, vi điều khiển, IoT, robot, và nhiều ứng dụng khác.

<div class="post-img-post">
    <img src="/img/2023-08-04-ADC-Regular-STM32F4/WT-ADS1115.gif">
 <br>
Ví dụ ứng dụng ADC đọc giá trị biến trở
</div>

### Giới thiệu tổng quan về ADC trên STM32F407

>[RM0090
Reference manual](https://www.st.com/resource/en/reference_manual/dm00031020-stm32f405-415-stm32f407-417-stm32f427-437-and-stm32f429-439-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf)

**ADC (Analog-to-Digital Converter) là một chức năng quan trọng trong** vi điều khiển **STM32F407VET6**, cho phép vi điều khiển chuyển đổi tín hiệu analog thành dạng số để xử lý bên trong vi điều khiển. **STM32F407VET6** hỗ trợ nhiều kênh ADC với độ chính xác cao và khả năng đo lường nhanh chóng. Trong bài viết này, chúng ta sẽ tìm hiểu về ADC trên **STM32F407VET6** và cách sử dụng nó để đo lường tín hiệu analog.

#### ⚙️Cấu trúc ADC trên STM32F407

- STM32F407VET6 có **ADC đa kênh**, hỗ trợ chế độ đơn kênh và chế độ chuyển đổi liên tiếp (continuous conversion mode). 
- ADC trên **STM32F407VET6** có thể được cấu hình để **hoạt động ở độ phân giải khác nhau (8-bit, 10-bit, 12-bit)** tùy thuộc vào yêu cầu ứng dụng.
- **Có tối đa 19 kênh đa điểm**: Đo được tín hiệu từ 16 nguồn bên ngoài, hai nguồn bên trong và kênh VBAT (đo điện áp pin).
- **Chế độ chuyển đổi**: Có thể thực hiện chuyển đổi theo các chế độ đơn lẻ, liên tục, quét hoặc không liên tục.
- **Kết quả ADC được lưu trong thanh ghi dữ liệu 16 bit**, có thể căn chỉnh trái hoặc phải.
- **Analog watchdog**: Cho phép ứng dụng giám sát tín hiệu analog và phát hiện vượt quá ngưỡng được định trước.
![Untitled](/img/2023-08-04-ADC-Regular-STM32F4/Untitled.png)

#### ⚙️Các tính năng chính của ADC STM32F407

- Độ phân giải có thể cấu hình là 12 bit, 10 bit, 8 bit hoặc 6 bit.
- Tạo ngắt (interrupt) khi chuyển đổi hoàn tất, chuyển đổi chèn (injected conversion) hoàn tất, và khi có sự kiện giám sát tín hiệu analog (analog watchdog) hoặc lỗi "overrun".
- Chế độ chuyển đổi đơn lẻ (single) và liên tục (continuous).
- Chế độ quét (scan) tự động chuyển đổi từ kênh 0 đến kênh 'n'.
- Thời gian lấy mẫu có thể được lập trình riêng cho từng kênh.
- Tùy chọn trigger bên ngoài với cấu hình cực (polarity) có thể thay đổi cho cả chuyển đổi thông thường (regular) và chuyển đổi chèn (injected).
- Chế độ không liên tục (discontinuous).
- Yêu cầu cấp điện ADC: Từ 2.4 V đến 3.6 V khi hoạt động ở tốc độ cao và xuống còn 1.8 V khi hoạt động ở tốc độ chậm.
- Dải đầu vào ADC: VREF- ≤ VIN ≤ VREF+.
- Tạo yêu cầu DMA trong quá trình chuyển đổi kênh thông thường.
- ...

#### ⚙️Các Pin Input Output của ADC
![Untitled](/img/2023-08-04-ADC-Regular-STM32F4/Untitled%201.png)

#### ⚙️Timing diagram của ADC

Như thể hiện trong Hình 45, ADC cần một thời gian ổn định là tSTAB trước khi bắt đầu chuyển đổi chính xác. Sau khi bắt đầu chuyển đổi ADC và sau 15 chu kỳ xung đồng hồ, cờ EOC được đặt và thanh ghi dữ liệu ADC 16-bit chứa kết quả của chuyển đổi.

![Untitled](/img/2023-08-04-ADC-Regular-STM32F4/Untitled%202.png)

1. CLK của ngoại vi ADC được enable
2. Bit ADON được set lên `1`
3. Chờ một khoảng thời gian (tSTAB) ổn định kể từ khi khởi động ADON
4. SWSTART/JSWSTART được kích hoạt sau đó.
5. Sau đó quá trình chuyên đổi được xảy ra.
6. Sau quá trình chuyển đổi hệ thông kích hoạt bit EOC
7. Sau khoảnh thơi gian thì bit EOC được tắt.
8. Kích hoạt quá trình tiếp theo…

### Đọc nhiều kênh ADC không sử dụng DMA

**Về mặt lý thuyết**, có thể sử dụng việc đọc nhiều kênh **ADC1 của STM32F4 mà không cần sử dụng DMA**. 

Trong chế độ bình thường (**regular ADC mode**) của STM32F4, **vi xử lý có thể đọc các kết quả từ nhiều kênh ADC1 một cách tuần tự** bằng cách lập trình nó để chuyển đổi các kênh theo chuỗi.

Để đọc nhiều kênh ADC1, bạn có thể thực hiện các bước sau:

- **Cấu hình chuỗi chuyển đổi (Conversion Sequence):** Đầu tiên, bạn cần cấu hình chuỗi chuyển đổi để xác định thứ tự các kênh ADC1 bạn muốn chuyển đổi. 

>Ví dụ: chuyển đổi kênh 1, sau đó kênh 2, và tiếp tục như vậy. Bạn cũng có thể chọn chế độ scan để chuyển đổi tất cả các kênh trong một lần chuyển đổi.

- **Kích hoạt ADC và chờ hoàn thành chuyển đổi:** Sau khi cấu hình chuỗi chuyển đổi, bạn kích hoạt ADC và chờ cho việc chuyển đổi trên các kênh hoàn thành. Bạn có thể kiểm tra cờ hoàn thành chuyển đổi để biết khi nào các kết quả đọc từ các kênh đã sẵn sàng.

- **Đọc kết quả:** Khi các chuyển đổi trên các kênh hoàn thành, bạn có thể đọc kết quả từ các thanh ghi dữ liệu của ADC1 (`ADC_DR`). Các kết quả của các kênh sẽ được lưu trữ theo thứ tự chuyển đổi được xác định trước đó.

{: .box-note}
**Note:** Điểm quan trọng là **đảm bảo thời gian đọc kết quả** và v**iệc chuyển đổi của các kênh đủ nhanh** để không bị mất dữ liệu hoặc tràn dữ liệu. Nếu tần số chuyển đổi của các kênh là quá cao, bạn cần đảm bảo vi xử lý có thể xử lý các kết quả đọc nhanh chóng và hiệu quả.

{: .box-warning}
**Warning:** Mặc dù không cần sử dụng DMA, việc sử dụng DMA có thể cải thiện hiệu suất và giảm tải cho vi xử lý, đặc biệt là khi bạn cần đọc nhiều kênh ADC và xử lý dữ liệu liên tục.


#### ⚙️Khởi tạo MXCube, sử dụng ADC1

- **CH1: sử dụng cho cảm biến ánh sáng**
- **CH2: sử dụng cho biến trở**
- **Temperature Senror Channel**
- **Vrefint Channel**

Đọc ADC1 ở chế độ thông thường Regular

![Untitled](/img/2023-08-04-ADC-Regular-STM32F4/Untitled%203.png)

#### ⚙️Phân tích bài toán

Ở bước này, **NẾU** chúng ta chạy mode **ScanConvMode** lần lượt các Channel thì chúng ta phải **tính toán kỹ lương thời gian tiến hành đọc kết quả**.

Vì **SAU MỘT LẦN CHUYỂN ĐỔI XONG** kết quả (12bit) được lưu vào thanh ghi ADC_DR (16bit data).

Nếu chúng ta tiến hành **đọc không đúng thời điểm** sẽ dẫn tới đọc **nhầm kết quả cũ** hoặc **kết quả của Channel khác**.

Việc đọc ADC nhiều Channel theo cách này **CHO KẾT QUẢ** rất **KHÔNG TIN CẬY**.

#### ⚙️Tuỳ biến lại Project

Sau khi tạo project theo hình trên, chúng ta sẽ tuỳ biến Project như sau:

Trong phần code cấu hình ADC1:

Ta tiến hành **comment 4 kênh** ở dưới do MXCube tạo ra.

Đồng thơi sửa lại `hadc1.Init.NbrOfConversion = 1;`

```c
/* ADC1 init function */
void MX_ADC1_Init(void)
{

  /* USER CODE BEGIN ADC1_Init 0 */

  /* USER CODE END ADC1_Init 0 */

  ADC_ChannelConfTypeDef sConfig = {0};

  /* USER CODE BEGIN ADC1_Init 1 */

  /* USER CODE END ADC1_Init 1 */

  /** Configure the global features of the ADC (Clock, Resolution, Data Alignment and number of conversion)
  */
  hadc1.Instance = ADC1;
  hadc1.Init.ClockPrescaler = ADC_CLOCK_SYNC_PCLK_DIV4;
  hadc1.Init.Resolution = ADC_RESOLUTION_12B;
  hadc1.Init.ScanConvMode = ENABLE;
  hadc1.Init.ContinuousConvMode = ENABLE;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
  hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  // hadc1.Init.NbrOfConversion = 4; //MXCube Gen
	hadc1.Init.NbrOfConversion = 1; //My config - Gen
  hadc1.Init.DMAContinuousRequests = DISABLE;
  hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }

//  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time.
//  */
//  sConfig.Channel = ADC_CHANNEL_0;
//  sConfig.Rank = 1;
//  sConfig.SamplingTime = ADC_SAMPLETIME_84CYCLES;
//  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
//  {
//    Error_Handler();
//  }

//  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time.
//  */
//  sConfig.Channel = ADC_CHANNEL_1;
//  sConfig.Rank = 2;
//  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
//  {
//    Error_Handler();
//  }

//  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time.
//  */
//  sConfig.Channel = ADC_CHANNEL_TEMPSENSOR;
//  sConfig.Rank = 3;
//  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
//  {
//    Error_Handler();
//  }

//  /** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time.
//  */
//  sConfig.Channel = ADC_CHANNEL_VREFINT;
//  sConfig.Rank = 4;
//  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
//  {
//    Error_Handler();
//  }
  /* USER CODE BEGIN ADC1_Init 2 */

  /* USER CODE END ADC1_Init 2 */

}
```

Ở file **main.c** chúng ta tạo **4 hàm con cho 4 kênh ADC** như sau:

{: .box-warning}
**Warning:** Với tất cả các **rank=1**

```c
uint32_t ADC_VAL[4];
// init ADC1 channel 0
void ADC_Select_CH0 (void)
{
 ADC_ChannelConfTypeDef saConfig = {0};
 saConfig.Channel = ADC_CHANNEL_0;
 saConfig.Rank = 1;
 saConfig.SamplingTime = ADC_SAMPLETIME_84CYCLES;
 if (HAL_ADC_ConfigChannel(&hadc1, &saConfig) != HAL_OK)
 {
   Error_Handler();
 }
}
// init ADC1 channel 1
void ADC_Select_CH1 (void)
{
 ADC_ChannelConfTypeDef saConfig = {0};
 saConfig.Channel = ADC_CHANNEL_1;
 saConfig.Rank = 1;
 saConfig.SamplingTime = ADC_SAMPLETIME_84CYCLES;
 if (HAL_ADC_ConfigChannel(&hadc1, &saConfig) != HAL_OK)
 {
   Error_Handler();
 }
}
// init  ADC1 channel temp
void ADC_Select_Temp (void)
{
 ADC_ChannelConfTypeDef saConfig = {0};
 saConfig.Channel = ADC_CHANNEL_TEMPSENSOR;
 saConfig.Rank = 1;
 saConfig.SamplingTime = ADC_SAMPLETIME_84CYCLES;
 if (HAL_ADC_ConfigChannel(&hadc1, &saConfig) != HAL_OK)
 {
   Error_Handler();
 }
}
// init ADC1 channel vref
void ADC_Select_Vref (void)
{
 ADC_ChannelConfTypeDef saConfig = {0};
 saConfig.Channel = ADC_CHANNEL_VREFINT;
 saConfig.Rank = 1;
 saConfig.SamplingTime = ADC_SAMPLETIME_84CYCLES;
 if (HAL_ADC_ConfigChannel(&hadc1, &saConfig) != HAL_OK)
 {
   Error_Handler();
 }
}
```

Lúc này, trong hàm `main → while(1)` chúng ta gọi như sau:

Hàm **HAL_ADC_PollForConversion** có ý nghĩa chờ khi chuyển đổi xong thì chúng ta đọc kết quả liền.

```c
int main(void)
{
...
while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
		
		ADC_Select_CH0();
		HAL_ADC_Start(&hadc1);
		HAL_ADC_PollForConversion(&hadc1, HAL_MAX_DELAY);
		ADC_VAL[0] = HAL_ADC_GetValue(&hadc1);
		HAL_ADC_Stop(&hadc1);
		HAL_Delay(10);

		ADC_Select_CH1();
		HAL_ADC_Start(&hadc1);
		HAL_ADC_PollForConversion(&hadc1, 1000);
		ADC_VAL[1] = HAL_ADC_GetValue(&hadc1);
		HAL_ADC_Stop(&hadc1);
		HAL_Delay(10);

		ADC_Select_Temp();
		HAL_ADC_Start(&hadc1);
		HAL_ADC_PollForConversion(&hadc1, 1000);
		ADC_VAL[2] = HAL_ADC_GetValue(&hadc1);
		HAL_ADC_Stop(&hadc1);
		HAL_Delay(10);

		ADC_Select_Vref();
		HAL_ADC_Start(&hadc1);
		HAL_ADC_PollForConversion(&hadc1, 1000);
		ADC_VAL[3] = HAL_ADC_GetValue(&hadc1);
		HAL_ADC_Stop(&hadc1);
		HAL_Delay(10);
		...
	}
}
```
##### ⚙️Vào mode Debug xem thử nào!

![Untitled](/img/2023-08-04-ADC-Regular-STM32F4/Untitled%205.png)

Giá trị mỗi kênh sẽ được lưu vào một mảng `ADC_VAL`.

<div class="post-img-post">
    <img src="/img/2023-08-04-ADC-Regular-STM32F4/Untitled%206.png">
 <br>
Giá trị ADC được hiển thị theo 3 cách
</div>

#### ⚙️Kết luận chung

{: .box-note}
**Note:** Việc khởi động và tắt đọc tuần tự từng kênh như vậy thì **kết quả sẽ có độ tin cậy cao**. 

{: .box-warning}
**Warning:** Nhưng nhược điểm là **tốn nhiều thời gian chờ**. Phù hợp với những ứng dụng **không khắt khe về thời gian** đáp ứng và cần sử dụng **cấu hình đơn giản**.

*Cám ơn mọi người đã theo dõi bài viết!*
