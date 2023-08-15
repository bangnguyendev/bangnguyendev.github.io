---
layout: post
title: "DMA đọc nhiều kênh ADC"
meta-title: "DMA đọc nhiều kênh ADC"
subtitle: "... trong STM32F4"
bigimg:
  - "/img/2023-08-04-ADC-Regular-STM32F4/Untitled%206.png"
image: /img/2023-08-04-ADC-Regular-STM32F4/avatar_ADC.jpg
tags: [STM32F4, ADC, Regular, DMA, Direct Memory Access, Circular Buffer Mode]
category: lap-trinh-vi-dieu-khien
gh-repo: bangnguyendev/KEIL-C-STM32F407
# gh-badge: [star, watch, fork, follow]
comments: true
---
Trước khi khám phá DMA, chúng ta sẽ điểm lại cơ chế hoạt động thông thường của lõi (Core) và thấu hiểu nó thông qua mô hình ***Master*** - ***Slave***.

![Untitled](/img/2023-08-11-DMA-with-ADC/master-slave.png)

Nhìn vào biểu đồ trên, **CPU có nhiệm vụ** kiểm soát quá trình **truyền dữ liệu giữa thiết bị ngoại vi** (UART, I2C, SPI, ...) **và bộ nhớ (RAM)** thông qua các đường truyền dữ liệu (bus). Cơ chế này có thể được hình dung như một mô hình Master - Slave, trong đó CPU đóng vai trò là Master, và các thiết bị ngoại vi cùng bộ nhớ đóng vai trò như các Slave. Khi cần giao tiếp giữa hai Slave, Master (CPU) sẽ kiểm soát quá trình này.

Tuy nhiên, **CPU còn có một nhiệm vụ quan trọng khác, đó là trích xuất lệnh từ bộ nhớ FLASH để thực thi các lệnh của chương trình**. Do đó, **khi cần truyền dữ liệu liên tục giữa thiết bị ngoại vi và RAM**, CPU sẽ phải **dành nhiều thời gian và tài nguyên** cho công việc này, dẫn đến việc không còn khả năng thực hiện các tác vụ khác hoặc **có thể dẫn đến việc mất dữ liệu** trong quá trình truyền.

⇨ Chính vì lý do này, hệ thống hỗ trợ một **Master** khác để đảm nhận công việc này, và đó chính là **DMA**.

![Untitled](/img/2023-08-11-DMA-with-ADC/dma%20derfiniton.gif)

### DMA - Direct Memory Access?

***DMA - Direct Memory Access*** hay còn gọi là truy cập trực tiếp bộ nhớ, là một phần quan trọng trong hệ thống vi điều khiển. DMA thực hiện vai trò như một "Master" (người chủ), được sử dụng để **điều khiển việc truy cập trực tiếp vào bộ nhớ mà không cần thông qua CPU**. Điều này cho phép DMA thực hiện việc **chuyển dữ liệu giữa các thiết bị ngoại vi và bộ nhớ một cách độc lập, giảm bớt sự tải cho CPU.**

![Untitled](/img/2023-08-11-DMA-with-ADC/mode%20dma.jpg )


**DMA hoạt động như một bộ điều khiển độc lập**, có khả năng quản lý việc **truyền dữ liệu giữa bộ nhớ và các thiết bị ngoại vi như UART, SPI, hay I2C**. Khi có sự kích hoạt từ phần mềm hoặc các nguồn tín hiệu ngoại vi, DMA có thể lấy dữ liệu từ một vùng nhớ nào đó và chuyển tiếp nó vào hoặc ra khỏi bộ nhớ mục tiêu mà không cần sự can thiệp của CPU.

#### ⚙️Ưu điểm chính

Ưu điểm chính của DMA bao gồm:

1. **Tiết kiệm tài nguyên CPU:** Khi các nhiệm vụ truyền dữ liệu được chuyển cho DMA, CPU không cần tham gia trực tiếp vào quá trình này, giúp giảm bớt khối lượng công việc mà CPU phải xử lý. Điều này tạo ra một sự tách biệt rõ rệt giữa việc xử lý dữ liệu và việc truyền dữ liệu.
2. **Tăng hiệu suất hệ thống:** Do không cần phải dành nhiều thời gian và tài nguyên CPU để quản lý việc truyền dữ liệu, hệ thống có thể hoạt động hiệu quả hơn, đồng thời cung cấp khả năng xử lý nhiều tác vụ cùng lúc.
3. **Hỗ trợ ứng dụng thời gian thực:** Trong các ứng dụng yêu cầu độ chính xác cao và thời gian đáp ứng nhanh, DMA có thể đảm nhận việc chuyển dữ liệu mà không gây trễ động cơ CPU.
4. **Tối ưu hóa truyền dữ liệu liên tục:** Khi cần chuyển dữ liệu liên tục giữa các bộ nhớ và thiết bị ngoại vi, DMA cho phép truyền dữ liệu một cách liên tục mà không làm gián đoạn hoạt động của CPU.

#### ⚙️Nhược điểm

Tất nhiên, hãy xem xét nhược điểm của DMA một cách cụ thể hơn:

Trong một số hệ thống vi điều khiển, đặc biệt là những hệ thống sử dụng bộ nhớ cache, việc sử dụng DMA có thể gây ra một số vấn đề về hiệu suất và tiêu thụ năng lượng.

1. **Sự Mất Hiệu Lực của Bộ Nhớ Cache:** Bộ nhớ cache thường được thiết kế để lưu trữ các dữ liệu phổ biến mà CPU sử dụng thường xuyên. Khi DMA thực hiện ghi dữ liệu vào bộ nhớ, dữ liệu này có thể được lưu vào bộ nhớ cache mà không thông báo cho CPU. Khi CPU cố gắng truy cập dữ liệu sau đó, nó có thể không thấy được dữ liệu mới trong bộ nhớ cache và phải truy cập dữ liệu từ bộ nhớ chính, dẫn đến việc mất hiệu suất do truy cập bộ nhớ chậm hơn.
2. **Tiêu Thụ Năng Lượng Tăng:** Khi dữ liệu được ghi vào bộ nhớ cache thông qua DMA, điều này yêu cầu bộ nhớ cache phải được cập nhật và điều này có thể tiêu tốn thêm năng lượng. Việc truyền dữ liệu qua DMA cũng đòi hỏi vi điều khiển phải thực hiện các hoạt động phức tạp để quản lý việc truyền dữ liệu, gây tốn nhiều năng lượng hơn so với việc truyền dữ liệu trực tiếp bởi CPU.
3. **Phân Bổ Tài Nguyên và Điều Khiển:** Việc cấu hình và quản lý DMA đòi hỏi việc phân bổ tài nguyên cụ thể và cài đặt các tham số đúng cách. Nếu không cài đặt DMA một cách chính xác, nó có thể dẫn đến việc sử dụng tài nguyên không hiệu quả và ảnh hưởng đến hiệu suất toàn bộ hệ thống.

{: .box-warning}
**Note:** Tóm lại, trong môi trường sử dụng bộ nhớ cache và các tài nguyên hệ thống phải được quản lý cẩn thận, việc sử dụng DMA cần phải được cân nhắc một cách thận trọng. Một thiết kế hệ thống thông minh và tối ưu có thể giảm thiểu nhược điểm này và đảm bảo rằng DMA thực sự mang lại lợi ích cho hiệu suất và tiêu thụ năng lượng của hệ thống.

#### ⚙️External DMA Controller

Trong một số vi điều khiển, nhất là những dòng vi điều khiển có kiến trúc đơn giản hoặc không tích hợp chức năng DMA, có thể sử dụng ngoại vi gọi là "**External DMA Controller**" (DMAC) để cung cấp khả năng truyền dữ liệu giữa các thiết bị ngoại vi và bộ nhớ một cách độc lập.

**DMAC hoạt động như một bộ điều khiển DMA bên ngoài**, được kết nối với vi điều khiển thông qua các giao tiếp như cổng **giao tiếp song song, SPI hoặc I2C**. DMAC thường điều khiển các luồng truyền dữ liệu giữa bộ nhớ và các thiết bị ngoại vi, giúp giảm tải cho CPU và cải thiện hiệu suất hệ thống.

>Các dòng vi điều khiển như 8051, AVR, PIC, hoặc những dòng vi điều khiển không tích hợp DMA, người ta thường sử dụng các bộ chip ngoại vi như DMAC để thực hiện chức năng DMA. Các DMAC này có thể được cấu hình và kiểm soát từ phần mềm trên vi điều khiển.

{: .box-note}
**Note:** Tóm lại, nếu vi điều khiển không tích hợp DMA hoặc có kiến trúc đơn giản, bạn có thể sử dụng ngoại vi DMA Controller (DMAC) để thay thế chức năng DMA và cung cấp khả năng truyền dữ liệu giữa các thiết bị ngoại vi và bộ nhớ.


### DMA của STM32F4 

**Dòng STM32F4** là một trong những dòng vi điều khiển của STMicroelectronics được phát triển trên nền tảng ARM Cortex-M4, và nó **hỗ trợ DMA để tối ưu hóa việc truyền dữ liệu** giữa các bộ ngoại vi và bộ nhớ mà không cần can thiệp của CPU.

#### ⚙️Thông tin cơ bản

Một số thông tin cơ bản về DMA trong STM32F4:

- **Channels (Kênh DMA):** STM32F4 hỗ trợ nhiều kênh DMA, mỗi kênh có thể được cấu hình để thực hiện truyền dữ liệu giữa các cặp thiết bị ngoại vi và bộ nhớ. Điều này cho phép đa dạng hóa việc truyền dữ liệu và tối ưu hóa hoạt động của hệ thống.
- **Memory-to-Memory Transfer (Truyền dữ liệu bộ nhớ đến bộ nhớ):** DMA trong STM32F4 có khả năng thực hiện truyền dữ liệu trực tiếp giữa các vùng bộ nhớ mà không thông qua CPU, giúp tối ưu hóa việc sao chép dữ liệu.

![Untitled](/img/2023-08-11-DMA-with-ADC/Memory-to-memory%20mode.png)

- **Peripheral-to-Memory Transfer (Truyền dữ liệu từ ngoại vi đến bộ nhớ) và Memory-to-Peripheral Transfer (Truyền dữ liệu từ bộ nhớ đến ngoại vi):** DMA cho phép truyền dữ liệu giữa bộ nhớ và các thiết bị ngoại vi như UART, SPI, I2C mà không cần sự can thiệp của CPU. Điều này giúp giảm tải cho CPU và tối ưu hóa việc truyền dữ liệu.

![Untitled](/img/2023-08-11-DMA-with-ADC/Peripheral-to-memory%20mode.png)
![Untitled](/img/2023-08-11-DMA-with-ADC/Memory-to-peripheral%20mode.png)

- **Burst Mode:** STM32F4 DMA hỗ trợ chế độ truyền dữ liệu hàng loạt (burst mode), trong đó một lượng lớn dữ liệu được truyền trong một chu kỳ, cải thiện hiệu suất truyền dữ liệu.
- **Circular Buffer Mode (Chế độ bộ đệm vòng):** DMA cũng hỗ trợ chế độ bộ đệm vòng, cho phép truyền dữ liệu liên tục mà không cần thiết phải quản lý việc chuyển địa chỉ bộ nhớ.

![Untitled](/img/2023-08-11-DMA-with-ADC/Circular_Buffer_Animation.gif)

Bộ điều khiển DMA được kết nối với 2 bus AHB chính, cùng với cấu trúc FIFO độc lập để tối ưu hóa băng thông của hệ thống, hoạt động dưa trên kiến trúc ma trận bus khá phức tạp.

Đối với STM32F4, **có 2 bộ điều khiển DMA, mỗi bộ DMA có 8 luồng**, mỗi luồng đều có vai trò riêng để quản lý các yêu cầu truy cập bộ nhớ từ 1 hoặc nhiều ngoại vi. Mỗi luồng có thể có tối đa 8 kênh.

![Untitled](/img/2023-08-11-DMA-with-ADC/Untitled.png)

#### ⚙️Chức năng chính

Dưới đây là mô tả về các chức năng chính của DMA (Direct Memory Access):

1. **Cấu hình Channel Riêng Biệt:** Mỗi kênh DMA có thể được cấu hình một cách độc lập. Điều này cho phép tùy chỉnh cách mà mỗi kênh DMA hoạt động dựa trên yêu cầu cụ thể của ứng dụng.
2. **Kết nối với Thiết Bị Ngoại Vi và MCU:** Mỗi kênh DMA có thể được gán để xử lý tín hiệu DMA từ các thiết bị ngoại vi hoặc tín hiệu từ bên trong vi điều khiển (MCU). Điều này tạo ra tính linh hoạt trong việc truyền dữ liệu giữa các nguồn khác nhau.
3. **Ưu Tiên Kênh:** Mỗi kênh DMA có thể được thiết lập với một trong 4 mức ưu tiên khác nhau. Điều này quyết định thứ tự xử lý truyền dữ liệu nếu có nhiều kênh DMA cần truyền dữ liệu cùng một lúc.
4. **Kích Thước Data Linh Hoạt:** DMA hỗ trợ kích thước dữ liệu truyền là 1 byte, 2 byte (Half Word) hoặc 4 byte (Word), tùy thuộc vào yêu cầu của ứng dụng.
5. **Chế Độ Lặp Liên Tục:** DMA hỗ trợ việc lặp lại liên tục dữ liệu, giúp thực hiện truyền dữ liệu liên tục mà không cần phải cấu hình lại kênh DMA.
6. **Cờ Báo Ngắt:** DMA cung cấp 5 cờ báo ngắt khác nhau, bao gồm DMA Half Transfer, DMA Transfer Complete, DMA Transfer Error, DMA FIFO Error và Direct Mode Error. Các cờ này giúp theo dõi trạng thái và quản lý quá trình truyền dữ liệu.
7. **Quyền Truy Cập Đa Dạng:** DMA cho phép truyền dữ liệu giữa bộ nhớ và nhiều vùng như Flash, SRAM, APB1, APB2, và APB.
8. **Số Lượng Data Lớn:** Số lượng dữ liệu có thể được lập trình để truyền bởi DMA lên tới 65535, tùy thuộc vào khả năng của kênh DMA cụ thể.
9. **Chuyển Dữ Liệu Bộ Nhớ Đến Bộ Nhớ:** Đối với DMA2, mỗi luồng (stream) hỗ trợ việc chuyển dữ liệu từ bộ nhớ đến bộ nhớ mà không cần thông qua CPU.
10. **Truyền Dữ Liệu Giữa SRAM và Peripheral:** DMA có thể điều khiển truyền dữ liệu giữa bộ nhớ SRAM và các thiết bị ngoại vi như UART mà không thông qua bus dữ liệu của CPU.

#### ⚙️Ngoại vi sử dụng DMA

Các ngoại vi có thể sử dụng DMA trên kit STM32F407

| SPI và I2S | Timer |
| I2C | DAC |
| USART | SDIO |
| Camera interface (DCMI) | ADC |

Hệ thống vi điều khiển STM32F4 có nhiều ngoại vi khác nhau, và chúng có thể kết nối với các luồng DMA khác nhau trên DMA1 và DMA2. Dưới đây là một số ví dụ về ma trận kết nối DMA với một số ngoại vi cụ thể trên STM32F4:

![Untitled](/img/2023-08-11-DMA-with-ADC/Untitled%201.png)

![Untitled](/img/2023-08-11-DMA-with-ADC/Untitled%202.png)

{: .box-warning}
**Warning:** Chúng ta sử dụng ma trận kết nối DMA **phải xác định đúng luồng DMA (stream) và DMA1 hoặc DMA2** phù hợp cho các ngoại vi cụ thể mà chúng ta muốn sử dụng với DMA. Điều này đảm bảo rằng chúng ta có thể **cấu hình ngoại vi để sử dụng DMA một cách chính xác**, tận dụng ưu điểm của DMA trong việc truyền dữ liệu.

#### ⚙️Tóm tắt sử dụng cấu hình DMA

![Untitled](/img/2023-08-11-DMA-with-ADC/Possible%20DMA%20configurations.png)

#### ⚙️DMA interrupts

Đối với mỗi luồng DMA, một ngắt có thể được tạo ra trong các sự kiện sau đây:

- Đạt đến nửa lượt truyền `(Half-transfer reached)`

- Hoàn thành truyền `(Transfer complete)`

- Lỗi truyền `(Transfer error)`

- Lỗi FIFO (tràn, thiếu dữ liệu hoặc lỗi mức FIFO)

- Direct mode error

Các bit kiểm soát cho phép ngắt riêng biệt đã được cung cấp để tăng tính linh hoạt như được thể hiện trong **Bảng 50**.

![Untitled](/img/2023-08-11-DMA-with-ADC/DMA%20interrupt%20requests.png)

{: .box-warning}
**Warning:** Trước khi đặt bit điều khiển Kích hoạt thành '1', cờ sự kiện tương ứng phải được xóa, nếu không, một ngắt sẽ được tạo ngay lập tức.


### Project 5 Channel ADC - DMA 
Tạo Project ADC sử dụng DMA

#### ⚙️Cấu hình ADC

- Sử dụng MXCube, tôi chọn ADC1 với:
    - Channel 0, Channel 1, Channel 2,
    - Kênh nhiệt độ nội
    - Kênh Vrefint ( sử dụng nhiệt độ nội thì bật kênh này).

![Untitled](/img/2023-08-11-DMA-with-ADC/Untitled%203.png)

Các kênh ADC setup chế độ Scan và chuyển đổi liên tục, sử dụng ADC phân giải 12bit

Regular ConversionMode chuyển đổi liên tục 5 kênh xoay vòng.

![Untitled](/img/2023-08-11-DMA-with-ADC/Untitled%204.png)

#### ⚙️Cấu hình DMA
Tiếp theo, ở mục cấu hình DMA chọn Add thêm mới.

- Direction: Peripheral to Memory
- Mode: Circular
- Data width: Half Word  (16bit)
- DMA2 (DMA request mappings)
- Stream 0 (DMA request mappings)

![Untitled](/img/2023-08-11-DMA-with-ADC/Untitled%205.png)

![Untitled](/img/2023-08-11-DMA-with-ADC/Untitled%206.png)

#### ⚙️Gen code và đọc data

Tạo Project và check source code thôi!

Thứ tự `rank` 5 kênh được cấu hình :

```c
ADC_ChannelConfTypeDef sConfig = {0};
ADC_InjectionConfTypeDef sConfigInjected = {0};

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
hadc1.Init.NbrOfConversion = 5;
hadc1.Init.DMAContinuousRequests = ENABLE;
hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
if (HAL_ADC_Init(&hadc1) != HAL_OK)
{
  Error_Handler();
}

/** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time.
*/
sConfig.Channel = ADC_CHANNEL_0;
sConfig.Rank = 1;
sConfig.SamplingTime = ADC_SAMPLETIME_84CYCLES;
if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
{
  Error_Handler();
}

/** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time.
*/
sConfig.Channel = ADC_CHANNEL_1;
sConfig.Rank = 2;
if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
{
  Error_Handler();
}

/** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time.
*/
sConfig.Channel = ADC_CHANNEL_2;
sConfig.Rank = 3;
if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
{
  Error_Handler();
}

/** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time.
*/
sConfig.Channel = ADC_CHANNEL_TEMPSENSOR;
sConfig.Rank = 4;
if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
{
  Error_Handler();
}

/** Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time.
*/
sConfig.Channel = ADC_CHANNEL_VREFINT;
sConfig.Rank = 5;
if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
{
  Error_Handler();
}
```

```c
// code khởi tạo ngắt cho DMA
void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA2_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA2_Stream0_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA2_Stream0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA2_Stream0_IRQn);

}
```

Trích đoạn code từ `main.c` :

  - Các hàm khởi tạo `MX_…_Init();`

  - Tạo một biến `uint16_t data_adc[5];` lưu trữ 5 giá trị của 5 kênh ADC1.

Tiến hành khởi tạo ADC với DMA:

`HAL_ADC_Start_DMA(&hadc1,(uint32_t *)data_adc,5);`

```c
...
int main(void)
{
......

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_ADC1_Init();
  MX_I2C1_Init();
  /* USER CODE BEGIN 2 */

	uint16_t data_adc[5];
	HAL_ADC_Start_DMA(&hadc1,(uint32_t *)data_adc,5);
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
		
		printf("Gia tri ADC_C1:  %d \n",data_adc[0]);
		printf("Gia tri ADC_C2:  %d \n",data_adc[1]);
		printf("Gia tri ADC_C3:  %d \n",data_adc[2]);
		printf("Gia tri ADC_C_Temp:  %d \n",data_adc[3]);
		printf("Gia tri ADC_C_Vref:  %d \n",data_adc[4]);
		HAL_Delay(100);
		printf("============== \n");
  }
  /* USER CODE END 3 */
}
...
```

<a href="/img/2023-08-11-DMA-with-ADC/Untitled%207.png" data-lightbox="DMA" data-title="Kết quả 5 kênh ADC với DMA">
	<img class="post-img-post" src="/img/2023-08-11-DMA-with-ADC/Untitled%207.png" alt="image-1"/>
</a>

<a href="/img/2023-08-11-DMA-with-ADC/Untitled%208.png" data-lightbox="DMA" data-title="Kết quả 5 kênh ADC với DMA">
	<img class="post-img-post" src="/img/2023-08-11-DMA-with-ADC/Untitled%208.png" alt="image-1"/>
</a>



### Kết luận chung

DMA (Direct Memory Access) là một cơ chế cho phép thiết bị ngoại vi truyền dữ liệu trực tiếp vào bộ nhớ mà không cần sự can thiệp của CPU. Khi **áp dụng DMA khi đọc ADC từ nhiều kênh khác nhau**, có một số ưu điểm quan trọng:

1. **Tiết kiệm thời gian CPU:** Khi sử dụng DMA, CPU không cần tham gia trực tiếp trong quá trình truyền dữ liệu từ ADC vào bộ nhớ. CPU có thể tiếp tục thực hiện các tác vụ khác trong khi quá trình truyền dữ liệu đang diễn ra. Điều này giúp tối ưu hóa sự sử dụng tài nguyên của hệ thống và giảm thiểu việc chờ đợi.
2. **Giảm tải CPU:** Khi đọc nhiều kênh ADC, việc đọc và lưu trữ dữ liệu thường đòi hỏi nhiều tài nguyên CPU. Sử dụng DMA giúp giảm tải cho CPU bằng cách chuyển trách nhiệm truyền dữ liệu từ CPU sang DMA controller.
3. **Tăng hiệu suất hệ thống:** DMA có thể thực hiện việc truyền dữ liệu giữa các bộ nhớ mà không cần can thiệp của CPU. Do đó, việc truyền dữ liệu có thể diễn ra một cách liên tục và hiệu quả, giúp tăng tốc độ truyền dữ liệu và cải thiện hiệu suất hệ thống.
4. **Phù hợp với ứng dụng thời gian thực:** Trong các ứng dụng thời gian thực, việc đọc nhiều kênh ADC mà không cần sự can thiệp của CPU là rất quan trọng. DMA giúp đảm bảo rằng dữ liệu được đọc và lưu trữ một cách liên tục mà không bị gián đoạn bởi các tác vụ khác của CPU.
5. **Tăng khả năng mở rộng:** Sử dụng DMA cho việc đọc ADC từ nhiều kênh khác nhau làm cho hệ thống dễ dàng mở rộng hơn. Bạn có thể thêm nhiều kênh ADC mới mà không cần phải thay đổi quá nhiều trong phần xử lý DMA.

{: .box-warning}
**Note:** Tóm lại, việc sử dụng DMA khi đọc ADC từ nhiều kênh khác nhau mang lại nhiều ưu điểm quan trọng bao gồm tiết kiệm thời gian CPU, giảm tải CPU, tăng hiệu suất hệ thống và phù hợp cho các ứng dụng thời gian thực.

[*Project Github ADC-LCD-STM32F407*](https://github.com/bangnguyendev/KEIL-C-STM32F407/tree/master/ADC-LCD-STM32F407)

*Cám ơn mọi người đã theo dõi bài viết!*
