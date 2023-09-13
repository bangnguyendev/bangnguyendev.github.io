---
layout: post
title: "Điều khiển Servo DC"
meta-title: "Điều khiển Servo DC"
subtitle: "... sử dụng PWM"
bigimg:
  - "/img/2023-09-13-PWM-servo-dc/COVER.jpg"
image: /img/2023-09-13-PWM-servo-dc/IMG-AVATAR.jpg
tags: [STM32F4, TIMER, PWM, SERVO]
category: lap-trinh-vi-dieu-khien
gh-repo: bangnguyendev/KEIL-C-STM32F407
# gh-badge: [star, watch, fork, follow]
comments: true
---

Động Cơ Servo SG90 **là loại động cơ được dùng phổ biến trong các mô hình điều khiển nhỏ và đơn giản như cánh tay robot**. Động cơ có tốc độ phản ứng nhanh, được tích hợp sẵn Driver điều khiển động cơ, dễ dàng điều khiển góc quay bằng phương pháp điều độ rộng xung PWM.

### Micro Servo SG90 là gì?

![/img/2023-09-13-PWM-servo-dc/IMG-AVATAR.jpg](/img/2023-09-13-PWM-servo-dc/IMG-AVATAR.jpg)

Servo SG90 là một servo thu nhỏ, với một số **kích thước rất nhỏ gọn** để có thể tích hợp trong các dự án mà không gian là quan trọng. Ngoài ra, nó tiết kiệm và dễ sử dụng, với nhu cầu năng lượng rất thấp, vì vậy nó cũng có thể được sử dụng trong các ứng dụng nhúng, IoT hoặc các ứng dụng tiêu thụ thấp khác.

Đối với Servo SG90, động cơ servo này bao gồm một **đầu nối loại S phổ quát** điều đó sẽ có thể phù hợp với hầu hết các thiết bị thương mại. Nó được tạo thành từ 3 dây với màu sắc xác định những gì mỗi dây được sử dụng để:

- **Rojo**: là cáp nguồn dương hoặc Vcc (+)
- **Marrón**: là cáp nguồn âm (-) hay GND (nối đất)
- **Cam**: nó là cáp mang tín hiệu PPM (Điều chế vị trí xung) để điều khiển động cơ servo

Một số kiểu máy cũng có thể có bố cục màu **Đen đỏ trăng**, trong trường hợp đó, lược đồ trong trường hợp này sẽ là Tín hiệu GND-Vcc-PPM tương ứng.

### Tính năng Servo SG90

Về **các đặc tính kỹ thuật** của động cơ servo này, Servo SG90 nổi bật với:

Những đặc điểm này chỉ mang tính tương đối, vì chúng có thể thay đổi một chút tùy thuộc vào kiểu máy và thương hiệu của servo SG90. Do đó, tốt nhất bạn nên tải xuống datasheet tương ứng với dòng máy mà bạn đã mua. Ví dụ, thay vì chịu đựng được phạm vi nhiệt độ từ -30 đến 60ºC, một số chỉ làm như vậy từ -10 đến 50ºC, những người khác có thể chấp nhận điện áp từ 3 đến 6V, v.v.

- **Trọng lượng được hỗ trợ**: từ 1.2 đến 1.6 Kg (đủ cho kích thước nhỏ của nó)
- **Mô-men xoắn động cơ ở 4.8v**: 1.2kg / cm
- **Điện áp hoạt động**: 4 - 7.2v
- **Tốc độ quay ở 4.8v**: 0.12 giây / 60º
- **Góc quay**: Thứ nhất
- **Nhiệt độ hoạt động**: -30ºC và + 60ºC
- **Kích thước**: 22 × 11.5 × 27 mm
- **Trọng lượng**: 9 g hoặc 10.6 g bao gồm cáp và đầu nối
- **Conector phổ quát**: tương thích với hầu hết các bộ thu điều khiển vô tuyến (Futaba, JR, GWS, Cirrus, Hitec,…)

Bạn cũng sẽ tìm thấy **một số biến thể của Servo SG90**, Gì:

- **MG90S**: Tương tự như SG90 nhưng có bánh răng và liên kết bằng kim loại nên có thể chịu lực lên đến 1.8kg.
- **MG996R**: Nó có kích thước lớn hơn một chút, nhưng nó có thể hỗ trợ lên đến 15 Kg khi được cho ăn ở 6V, hoặc 13 Kg nếu được cho ăn ở 4.8v.

Thêm thông tin - [Tải xuống biểu dữ liệu](http://www.ee.ic.ac.uk/pcheung/teaching/DE1_EE/stores/sg90_datasheet.pdf)

### Thông số điều khiển

- Góc quay giới hạn: 180°

![Untitled](/img/2023-09-13-PWM-servo-dc/Untitled.png)

- Pulse Cycle:  20 ms (f=50Hz) **(FIX CỨNG TẦN SỐ)**

- Pulse Width: 
	- 500-2400 µs (0.5ms - 2.4ms) **- thường thấy nhất**
	- 1000-2000 µs (1.0ms - 2.0ms)
	- .. nhiều loại có thông số khác
![Untitled](/img/2023-09-13-PWM-servo-dc/Untitled%201.png)

Dựa vào **Pulse Width ta có thể thấy động cơ chỉ hoạt động ở Duty từ 2.5% → 12%**

- Với góc 0 độ ứng với Duty = 2.5%
- Với góc 180 độ ứng với Duty = 12%

### Cấu hình MXCube

Có thể xem thêm bài PWM của mình ở đây nhé!

[PWM (Pulse Width Modulation) - STM32F407VET (bangnguyendev.github.io)](https://bangnguyendev.github.io/2023-07-05-PWM-Pulse-Width-Modulation/)

#### ⚙️Cấu hình RCC TIMER1

Cấu hình RCC TIMER1 có tần số 168MHz.

<a href="/img/2023-09-13-PWM-servo-dc/Untitled%202.png" data-lightbox="RCC TIMER1 có tần số 168MHz" data-title="RCC TIMER1 có tần số 168MHz">
	<img class="post-img-post" src="/img/2023-09-13-PWM-servo-dc/Untitled%202.png" alt="image-1"/>
</a>

#### ⚙️Cấu hình PWM TIMER1 

Để điều khiển động cơ Servo SG90 cần cấp xung với tần số 50Hz 

>[PWM (Pulse Width Modulation) - STM32F407VET (bangnguyendev.github.io)](https://bangnguyendev.github.io/2023-07-05-PWM-Pulse-Width-Modulation/)

![Untitled](/img/2023-09-13-PWM-servo-dc/Untitled%204.png)

- Clock Source: internal source
- Channel1: chọn tạo xung PWM
- **PSC: chọn 335**
- **ARR: chọn 9999 (0 → 9999)**

{: .box-warning}
**ARR càng lớn** thì điều khiển góc quay mịn hơn, **độ phân giải góc quay cao hơn**.

Sử dụng **TIMER1 Channel 1 tạo xung PWM** cấp cho chân màu vàng Servo.

<a href="/img/2023-09-13-PWM-servo-dc/Untitled%203.png" data-lightbox="TIMER1 CHANNEL1" data-title="TIMER1 CHANNEL1">
	<img class="post-img-post" src="/img/2023-09-13-PWM-servo-dc/Untitled%203.png" alt="image-1"/>
</a>

- Cấu hình Mode PWM cho Channel1: Mode 1

Pulse PWM chún ta sẽ thay đổi trong quá trình sử dụng điều khiển động cơ.

<a href="/img/2023-09-13-PWM-servo-dc/Untitled%205.png" data-lightbox="TIMER1 CHANNEL1" data-title="TIMER1 CHANNEL1">
	<img class="post-img-post" src="/img/2023-09-13-PWM-servo-dc/Untitled%205.png" alt="image-1"/>
</a>


Đồng thời, tôi sử dụng **TIMER2 Channel1 để tạo sự kiện ngắt thay đổi Duty PWM** với tần số 10Hz (có thể sử dụng for() hoặc if..else.. để control khoản này)

<a href="/img/2023-09-13-PWM-servo-dc/Untitled%206.png" data-lightbox="TIMER2 CHANNEL1" data-title="TIMER2 CHANNEL1">
	<img class="post-img-post" src="/img/2023-09-13-PWM-servo-dc/Untitled%206.png" alt="image-1"/>
</a>

#### ⚙️Kết nối phần cứng

Chân **PE9 của STM32F4 sẽ là chân TIM1_CH1** và là chân kết nối với dây tín hiệu màu vàng của động cơ.

Động cơ sử dụng nguồn DC 5V, do đó chúng ta cấp nguồn 5VDC cho 2 dây còn lại.

### Tạo project code C
Sau khi MXCube tạo project, ở file main.c

```c
/* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_TIM1_Init();
  MX_TIM2_Init();
  MX_USART2_UART_Init();
  /* USER CODE BEGIN 2 */
	// htim1
	HAL_TIM_PWM_Start(&htim1,TIM_CHANNEL_1);
	HAL_TIM_OC_Start_IT(&htim1,TIM_CHANNEL_2);
	// htim2
	HAL_TIM_OC_Start_IT(&htim2,TIM_CHANNEL_1);
  /* USER CODE END 2 */
```

Chúng ta thêm lệnh **khởi động PWM** và **ngắt Output Compare TIMER2 Channe l**  để tạo chu kỳ tăng giảm Duty.

Chương trình phục vụ ngắt như sau:

```c
uint16_t var = 0;
uint16_t status = 0;
void HAL_TIM_OC_DelayElapsedCallback(TIM_HandleTypeDef *htim)
{
	if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_1)
	{
		printf("HAL_TIM_ACTIVE_CHANNEL_1 \r\n");

		if (status == 0)
		{
			var = var + 20;
			if (var >= 1200) // 1200 -> 2.4ms
			{
				status = 1;
				var = 1200;
			}
		}
		else
		{
			var = var - 20;
			if (var <= 250) // 250 -> 0.5ms
			{
				status = 0;
				var = 250;
			}
		}
		__HAL_TIM_SetCompare(&htim1, TIM_CHANNEL_1, var);
	}
	
	if(htim->Channel == HAL_TIM_ACTIVE_CHANNEL_2)
	{
		printf("HAL_TIM_ACTIVE_CHANNEL_2 \r\n");

	}
  /* Prevent unused argument(s) compilation warning */
  UNUSED(htim);

  /* NOTE : This function should not be modified, when the callback is needed,
            the HAL_TIM_PeriodElapsedCallback could be implemented in the user file
   */
}
```

### Kết quả 

Channel 0: là TIMER2 CHANNEL1

<a href="/img/2023-09-13-PWM-servo-dc/Untitled%207.png" data-lightbox="Channel 0: là TIMER2 CHANNEL1" data-title="Channel 0: là TIMER2 CHANNEL1">
	<img class="post-img-post" src="/img/2023-09-13-PWM-servo-dc/Untitled%207.png" alt="image-1"/>
</a>


Channel 1: là PWM TIMER1 CHANNEL1

<a href="/img/2023-09-13-PWM-servo-dc/Untitled%208.png" data-lightbox="Channel 1: là PWM TIMER1 CHANNEL1" data-title="Channel 1: là PWM TIMER1 CHANNEL1">
	<img class="post-img-post" src="/img/2023-09-13-PWM-servo-dc/Untitled%208.png" alt="image-1"/>
</a>

