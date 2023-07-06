---
layout: post
title: "PWM (Pulse Width Modulation) - STM32F407VET"
meta-title: "PWM <br> Pulse Width Modulation"
subtitle: "...STM32F407VET"
bigimg:
  - "/img/2023-07-05-PWM-Pulse-Width-Modulation/COVER-PWM.jpg"
image: /img/2023-07-05-PWM-Pulse-Width-Modulation/COVER-PWM.jpg
tags: [STM32F4, STM32, PWM, RCC, TIMER, github ]
# gh-repo: bangnguyendev/SmartClock
# gh-badge: [star, watch, fork, follow]
# comments: true
---

PWM (**Pulse Width Modulation**) là phương pháp `điều chế độ rộng xung` được hiểu là cách `điều khiển điện áp tải ra`, dựa trên sự thay đổi độ rộng xung vuông, dẫn đến sự thay đổi điện áp. Hiểu theo cách khác, *PWM là tín hiệu được tạo ra* từ *vi mạch kỹ thuật số*, như *vi mạch điều khiển*.

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled.png)

### PWM là gì?

Điều chế độ rộng xung (PWM) là một kỹ thuật điều khiển dòng điện tiện lợi cho phép bạn kiểm soát tốc độ của động cơ, sản lượng nhiệt của máy sưởi và hơn thế nữa theo cách tiết kiệm năng lượng (và thường là êm hơn). Các ứng dụng hiện có cho PWM bao gồm, nhưng không giới hạn:

- Bộ `điều khiển quạt` tản nhiệt `tốc độ thay đổi`.
- Hệ thống truyền động máy nén VRF HVAC.
- Mạch truyền động động cơ xe hybrid và điện.
- Bộ điều `chỉnh độ sáng LED`

Điều biến độ rộng xung đã thay đổi thế giới bằng cách `cắt giảm mức tiêu thụ điện năng của các thiết bị sử dụng động cơ` như máy điều hòa không khí biến tần, tủ lạnh biến tần, máy giặt biến tần, trong số nhiều thiết bị khác.

Ví dụ, máy điều hòa không khí biến tần có thể tiêu thụ ít hơn một nửa năng lượng so với máy điều hòa không khí biến tần trong một số trường hợp.

Trong thời đại ngày nay, nếu một thiết bị được quảng cáo là có máy nén tốc độ thay đổi hoặc quạt tốc độ thay đổi (điều này không bao gồm hai hoặc ba tốc độ quạt), thì có khả năng đáng kể là nó đang sử dụng PWM.

### PWM hoạt động như thế nào?

`PWM hoạt động bằng cách tạo xung dòng điện một chiều` và thay đổi khoảng thời gian mà mỗi xung ở trạng thái “bật” để kiểm soát lượng dòng điện chạy đến một thiết bị chẳng hạn như đèn LED. PWM là kỹ thuật số, có nghĩa là nó có hai trạng thái: `bật và tắt` (tương ứng với `1` và `0` trong ngữ cảnh nhị phân, sẽ trở nên phù hợp hơn với bạn nếu sử dụng bộ vi điều khiển).

Mỗi `xung được bật càng lâu, đèn LED sẽ càng sáng`. Do `khoảng thời gian giữa các xung quá ngắn` nên đèn `LED không thực sự tắt`. **Nói cách khác, nguồn điện của đèn LED bật và tắt quá nhanh (hàng nghìn lần mỗi giây)** đến mức đèn LED thực sự vẫn sáng mà không nhấp nháy. Điều này được gọi là làm mờ PWM, và mạch như vậy chỉ được gọi là mạch điều chỉnh độ sáng LED PWM.

#### Chu kỳ làm việc của PWM

`Tỷ lệ phần trăm` thời gian trong đó `tín hiệu PWM vẫn ở mức CAO` (đúng giờ) được gọi là `chu kỳ hoạt động - Duty Cycle`. Nếu tín hiệu luôn BẬT thì nó ở trong chu kỳ hoạt động 100% và nếu nó luôn tắt thì đó là chu kỳ hoạt động 0%.

> Duty Cycle =Turn ON time/ (Turn ON time + Turn OFF time)
>

**Nếu chu kỳ làm việc - Duty Cycle** của bộ nguồn **PWM được đặt thành 70%**, thì xung sẽ `bật` trong `70% thời gian` và nó `tắt 30% thời gian`. Chu kỳ nhiệm vụ đề cập đến lượng thời gian nó được bật. Ở chu kỳ hoạt động 70%, độ sáng của đèn LED phải gần 70%. **Mối tương quan giữa chu kỳ nhiệm vụ và độ sáng không phải là tuyến tính 100%, vì hiệu suất của đèn LED thay đổi theo lượng dòng điện được cung cấp.**

Nếu **Duty Cycle là 0%**, toàn bộ tín hiệu sẽ bằng phẳng. Duty Cycle PWM là 0% có nghĩa `là nguồn bị tắt`. Trong trạng thái như vậy, đèn **LED sẽ không hoạt động**.

Lý do chính khiến các **mạch PWM rất hiệu quả** là chúng **không cố gắng hạn chế** một phần **dòng điện** sử dụng điện trở **mà chúng bật và tắt hoàn toàn dòng điện.**


<div class="post-img-post">
    <img src="/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 1.png">
 <br>
 Sử dụng 8051 để tạo xung PWM điều khiển động cơ 3 phase
</div>

### PWM trong STM32F4XX

Trong mỗi `timer` của `STM32Fxx` các bạn sẽ kiểm tra xem có hỗ trợ PWM hay không?

<div class="post-img-post">
    <img src="/img/2023-07-05-PWM-Pulse-Width-Modulation/timer_1_8.png">
 <br>
 Timer 1 và Timer 8 trong STM32F407 (DS8626 Rev 9)
</div>

Check trong cấu hình Timer bằng **phần mềm CubeMX**
<div class="post-img-post">
    <img src="/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 2.png">
 <br>
 Kiểm tra tính năng PWM của Timer 1
</div>

Hoặc trong datasheet nhà sản xuất [**Reference manual**](https://github.com/bangnguyendev/Document-STM32/blob/master/Tai%20lieu%20-%20Documents/STM32F4/rm0090-stm32f405415-stm32f407417-stm32f427437-and-stm32f429439-advanced-armbased-32bit-mcus-stmicroelectronics.pdf)

<div class="post-img-post">
    <img src="/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 3.png">
 <br>
 STM32F4 RM0090 Reference manual
</div>

#### Sử dụng Board kit nào?

Các bạn có thể sử dụng các loại board kit, chip **STM32F407** bất kỳ nào mà các bạn có. Ở đây mình sử dụng board này:

[STM32F407VET6 Board 32bit Cortex-M4](https://www.thegioiic.com/stm32f407vet6-board)

Sơ đồ nguyên lý [tại đây](https://github.com/bangnguyendev/Document-STM32/blob/master/Tai%20lieu%20-%20Documents/STM32F4/STM32F407VET6%20ARM%20Cortex-M4%20schematic.PDF)!!!

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 4.png)

#### Lựa chọn nguồn kênh Timer?

Mình sử dụng luôn Timer 1 cho mạnh mẽ nhé! ***(Advanced-control timers (TIM1 and TIM8))***

Cùng kiểm tra xem [**Reference manual**](https://github.com/bangnguyendev/Document-STM32/blob/master/Tai%20lieu%20-%20Documents/STM32F4/rm0090-stm32f405415-stm32f407417-stm32f427437-and-stm32f429439-advanced-armbased-32bit-mcus-stmicroelectronics.pdf) có gì nhé!

<div class="post-img-post">
    <img src="/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 11.png">
 <br>
  Cấu trúc của TIMER 1/TIMER 8 (RM0090 Rev 19)
</div>

Tại **Chapter 17 Advanced-control timers (TIM1 and TIM8)** nhà sản xuất có nói rằng: Ở Timer 1 là Timer cao cấp nhất của chip luôn đó. Và đặc biệt hỗ trợ luôn PWM.

> It may be used for a variety of purposes, including measuring the pulse lengths of input signals (input capture) or generating output waveforms (output compare, PWM, complementary PWM with dead-time insertion).
>

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 5.png)

Hẳn là rất mạnh khi hãng tuyên bố “**on the fly**”, TIMER 1 hổ trợ đếm lên, xuống, với 16 bit ( tương đương đếm 1 → 65536), hỗ trợ tạo xung PWM theo các mode khác nhau *(Chế độ PWM canh theo cạnh -PWM edge-aligned mode,  Chế độ PWM canh giữa - PWM center -aligned mode)*.

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 6.png)

#### PWM của STM32F4XX có gi?

Vào xem nhà sản xuất nói gì về mode PWM của họ ?

**Chế độ PWM( điều biến độ rộng xung)** cho phép người dùng có thể `tạo ra tín hiệu xung vuông` có tần số được định bằng giá trị trong thanh thi `TIMx_ARR` và duty định bằng giá trị trong thanh ghi `TIMx_CCRx`.

Mỗi kênh của timer có thể cấu hình được chế độ PWM độc lập với nhau.

Mỗi ngõ ra OCx (**O**utput**C**apture) có thể cấu hình đươc mức tích cực cao hoặc thấp bằng phần mềm.

Trong chế độ PWM( 1 hoặc 2) giá trị của thanh ghi `TIMx_CNT` và thanh ghi `TIMx_CCRx` luôn được so sánh với nhau để để xác định `IMx_CCRx` ≤ `TIMx_CNT` hoặc `TIMx_CNT` ≤ `TIMx_CCRx` (phụ thuộc vào chiều đếm của bộ đếm).

Bộ định thời có thể tạo PWM theo 2 chế độ là canh theo cạnh(edge-aligned mode) hoặc canh giữa(center-aligned mode)

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 7.png)

#### Ví dụ với edge-aligned mode

**Một số thanh ghi về Timer:**

- **Counter register (TIMx_CNT) *lưu giá trị đếm***
- **Prescaler register (TIMx_PSC) *lưu giá trị chia từ tần số cơ sở cấp cho Timer để tạo ra tần số thích hợp***
- **Auto-reload register (TIMx_ARR) *lưu giá trị đích đếm lên hoặc đếm xuống***
- **Repetition counter register (TIMx_RCR)**
- Thanh ghi compare/capture( **TIMx_CCRx**) được sử dụng để **lưu giá trị đếm hiện tại** của bộ đếm ngay sau **khi nhận được tín hiệu yêu cầu capture ICx**

> Với **TIMx_ARR** = 8 ( tức là bộ đếm từ 0 → 8 sẽ reload lại)
>

> Khi quá trình capture xảy ra **cờ tương ứng CCxIF được set và có thể phát sinh yêu cầu ngắt hoặc DMA** nếu trước đó đã cho phép chúng. Cờ **CCxIF** có thể được xóa bằng phần mềm thông qua việc ghi bit ‘0’ vào nó hoặc tự động được xóa bằng phần cứng khi người dùng đọc giá trị capture được lưu trong thanh ghi **TIMx_CCRx**.
>

Theo hình dưới bộ đếm được cấu hình ở **chế độ đếm lên (ARR 0 → 8)**:

- **Tín hiệu tham chiếu PWM( OCxREF) ở mức cao** khi **TIMx_CNT < TIMx_CCRx** và ngược lại thì tín hiệu này ở mức thấp.
- Nếu giá trị của thanh ghi **TIMx_CCRx** lớn hơn giá trị tự động nạp lại của thanh ghi **TIMx_ARR** thì tín hiệu **OCxREF** luôn ở mức cao

<div class="post-img-post">
    <img src="/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 8.png">
 <br>
 Ví dụ với chế độ edge-aligned mode
</div>

- Với **CCRx = 4**: ta có **Duty Cycle** = [CCRx /(AAR +1)]*100 = [4/(8+1)]*100 **= 44.4444%**
- Với **CCRx = 8**: ta có **Duty Cycle** = [CCRx /(AAR +1)]*100 = [8/(8+1)]*100 **= 88.8888%**
- Với **CCRx > 8**: ta có **Duty Cycle = 100%**
- Với **CCRx = 0**: ta có **Duty Cycle = 0%**

Dựa vào ví dụ trên chắc các bạn đã hiểu sơ bộ về các số liệu khi setup độ rộng của xung rồi hen!

### Bây giờ vào dự án thực tế nhé

**Chúng ta sẽ sử dụng Channel 1 của Timer 1 để tạo PWM:**

- **Tần số là 60Hz**
- **Tạo xung với độ rộng 45%**
- **Thử thay đổi độ rộng tự động**

#### RCC cấp tần số

Bây giờ xem xét **RCC cấp tần số** bao nhiêu cho **TIMER 1**?

Dựa vào datasheet của nhà sản xuất ta thấy **TIM1 sử dụng APB2 max 84MHz**

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 9.png)

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 10.png)

Với kit sử dụng **STM32F407VET** chúng ta sử dụng thì có **thạch anh ngoài 8MHz → HSE → PLLCLK → HCLK 168MHz → APB2 qua bộ chia, bộ nhân → APB2 timer clock là 168 MHz.**

Các **công thức tính toán** được lấy từ Datasheet nhà sản xuất.

- `Frequency = ClockFreq / ((PSC + 1) * (ARR + 1))`
- `Dutyin% = (CCRx * 100) / ARR` for the fast PWM
- RCR nếu không sử dụng *(highlight)* thì bỏ qua nhé!!!
- Tool các bạn có thể tham khảo ở link Github: <https://github.com/bangnguyendev/STM32-Scaler>

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 12.png)

Dựa vào công thức trên, ta chọn **tần số là 60Hz** tương ứng với **Update_event** = 60 Hz

**TIM_CLK** = **APB2 timer clock là 168 MHz.**

Chọn **ARR** = **999** (đếm từ 0 → 999) tức là 1000 xung.

Vậy theo công thức trên ta được **PCS** = **2800 - 1 = 2799** (giá trị bộ chia từ xung đầu vào TIM_CLK)

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 13.png)

OK! Các thông số cơ bản đã có, bây giờ tạo Project và check xung clock tạo ra từ TIMER 1 nhé!

#### Tạo Project từ MXCube & KeilC ARM

Mở **MXCube → New Project → ACCESS TO MCU SELECTOR**

<div class="post-img-post">
    <img src="/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 14.png">
 <br>
 MXCube → New Project → ACCESS TO MCU SELECTOR
</div>

**→ STM32F407VET6 → START PROJECT**

<div class="post-img-post">
    <img src="/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 15.png">
 <br>
 → STM32F407VET6 → START PROJECT
</div>

Cấu hình **RCC** → mình sử dụng **HSE (hoặc gì là do các bạn chọn nhé!)**

<div class="post-img-post">
    <img src="/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 16.png">
 <br>
RCC → mình sử dụng HSE (cấp xung ngoại 8MHz)
</div>


Cấu hình mode Debug để nạp code và Debug nè → **Serial Wire** 
<div class="post-img-post">
    <img src="/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 17.png">
 <br>
Cấu hình mode Debug
</div>

#### Cấu hình **TIMER 1** trên MXCube

Theo thông số đã tính toán như trên. 
Trong mục `Parameter Settings` của `TIMER 1`:
1. Sử dụng **Channel 1** dạng `xuất xung PWM` output ***(Pin PE9)***
2. **Clock Source** chọn `Internal Clock`
3. **PSC 2799**
4. **ARR (Counter Period) 999**

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 18.png)

Phía dưới `Parameter Settings` của `TIMER 1` có mục `PWM Generation Channel 1`:
1. Sử dụng PWM `Mode 1`
2. Counter mode là `UP` đếm lên
3. Pulse là `450` ( bởi vì `450 là 45%` của **AAR=1000**)

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 19.png)

Cấu hình xung `Clock` ta thấy `Timer APB2` sử dụng `168MHz` như chúng ta xác định như trên
<div class="post-img-post">
    <img src="/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 20.png">
 <br>
Cấu hình xung Clock
</div>

Cấu hình mục **tạo Project**:

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 21.png)

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 22.png)

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 23.png)

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 24.png)

Sau khi mở lên thì Project của chúng ta như sau:

Các tham số tính toán đã được phần mềm **MXCube** tạo sẳn.

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 25.png)

Ở file `main.c` ta thêm lệnh khởi động PWM ở `TIMER 1` & `Channel 1` ***(Pin PE9)***

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 26.png)

Nạp code và thử thôi

Mình sử dụng `Logic port`, Channel 0 sẽ cắm vào `Pin PE9` để đo xung đầu ra thử thì thấy đúng `60Hz và Duty 45%`

<div class="post-img-post">
    <img src="/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 27.png">
 <br>
F = 60Hz và Duty 45%
</div>

<div class="post-img-post">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/YrxO8CrMu7A" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
 <br>
F = 60Hz và Duty 45%
</div>


Cùng Debug để xem các giá trị ở thanh ghi nhé!

Trước khi chương trình khởi chạy các giá trị đều là `0x00`

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 28.png)

Sau khi thực thi lệnh khởi tạo ***HAL_TIM1_Init()*** thì các thông số ***PSC, ARR, CCR1*** đã được nạp vào thanh ghi

- ***PSC `0x0AEF` (2799)***
- ***ARR `0x03E7` (999)***
- ***CCR1 `0x01C2` (450)***

Hiện tại, chuẩn bị thực thi hàm Start PWM ***`HAL_TIM_PWM_Start(&htim1,TIM_CHANNEL_1);`***

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 29.png)

#### Để thay đổi độ rộng xung

Để thay đổi độ rộng xung thì chúng ta sử dụng ***`__HAL_TIM_SetCompare(&htim1, TIM_CHANNEL_1, xxx);`***

- Với XXX là giá trị CCR1

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 30.png)

Vậy để thay đổi độ rộng xung thành 70% thì sao?

- 70% -> (70% * 1000)/100% = 700 CCR1

`__HAL_TIM_SetCompare(&htim1, TIM_CHANNEL_1, 700);`

Lúc này giá trị **CCR1** sẽ được cập nhật thành **0x2BC (700)**

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 31.png)

Vậy để thay đổi độ rộng xung tăng dần & giảm dần thì sao? Chúng ta sử dụng một biến ***var_CCR1*** để thay đổi.

![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 32.png)

```c
...
/* Initialize all configured peripherals */
MX_GPIO_Init();
MX_TIM1_Init();
/* USER CODE BEGIN 2 */
HAL_TIM_PWM_Start(&htim1,TIM_CHANNEL_1);
/* USER CODE END 2 */

/* Infinite loop */
/* USER CODE BEGIN WHILE */
int var_CCR1 = 100 ; // Khoi tao PWM voi Duty 10%
while (1)
{
/* USER CODE END WHILE */

/* USER CODE BEGIN 3 */
    HAL_Delay(50);
    var_CCR1 = var_CCR1 + 100;
    if (var_CCR1 >= 1000)
    {
        var_CCR1 = 100;
    }

    __HAL_TIM_SetCompare(&htim1, TIM_CHANNEL_1, var_CCR1);
}
/* USER CODE END 3 */

```


![Untitled](/img/2023-07-05-PWM-Pulse-Width-Modulation/Untitled 33.png)

Độ rộng xung đã được thay đổi từ 10% → 100% → 10% …


<div class="post-img-post">
<iframe width="560" height="315" src="https://www.youtube.com/embed/DIJTJSrLtGw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
<br>
Duty 10% → 100% → 10% …
</div>

[KEIL-C-STM32F407/TIMER1_CN1_PWM · bangnguyendev/KEIL-C-STM32F407](https://github.com/bangnguyendev/KEIL-C-STM32F407/tree/master/TIMER1_CN1_PWM)

Cám ơn mọi người đã xem!
