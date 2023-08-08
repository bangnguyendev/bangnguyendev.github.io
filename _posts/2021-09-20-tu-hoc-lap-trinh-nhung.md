---
layout: post
title: "Lập trình nhúng là gì?"
meta-title: "Lập trình nhúng là gì?"
subtitle: "... Tại sao lại gọi là hệ thống nhúng?"
bigimg:
  - "/img/2021-09-20-tu-hoc-lap-trinh-nhung/Embedded_Software_Engineer_2.1-1-scaled.jpg"
image: /img/2021-09-20-tu-hoc-lap-trinh-nhung/a39il8uU.jpeg
tags: [embedded programing, embedded, embedded developer]
category: ngoai-luong
# gh-repo: bangnguyendev/Documents
# gh-badge: [star, watch, fork, follow]
# comments: true
---

### Lập trình nhúng là gì?

Lập trình nhúng (embedded programing) là công việc của một embedded developer (lập trình viên nhúng) có nhiệm vụ viết các phần mềm để nạp vào vi điều khiển hoặc vi xử lý, để chúng điều khiển các phần tử trong mạch điện hoạt động theo đúng yêu cầu.

Các mạch điện có thể lập trình được thường được gọi là mạch nhúng.

Các hệ thống bị chi phối hoạt động bởi vi điều khiển hoặc vi xử lý gọi là hệ thống nhúng.

### Tại sao lại gọi là hệ thống nhúng?

Lấy một ví dụ cho đơn giản. Bạn có 1 cái ly, nước và 1 gói trà. Cái ly là cố định không thể thay đổi, nhưng nước và gói trà có thể thay đổi. Khi chúng ta thay đổi gói trà, thì ly nước đó sẽ có vị khác nhau. Người ta gọi nôm na là “nhúng”.

Vì vậy một hệ thống có sự góp mặt của phần cứng (cái ly) và phần mềm (nước trà) là hệ thống nhúng.

Phần cứng sẽ là phần không thể thay đổi: mạch điện, vi xử lý
Phần mềm chính là phần có thể lập trình và thay đổi theo yêu cầu của khách hàng.
Tuy nhiên phần cứng và phần mềm sẽ có sự liên kết chặt chẽ với nhau, người viết phần mềm nhúng cũng phải tuân theo những thiết kế về phần cứng.

### Phân loại?
Học lập trình nhúng tạm mình chia làm 2 phần, và mỗi phần điều có các yêu cầu về KIẾN THỨC & KĨ NĂNG riêng:

1. Lập trình: Lập trình nhúng đa phần sử dụng C/C++ để phát triển ứng dụng, việc hiểu sâu về ngôn ngữ và hoạt động của trình biên dịch là rất quan trọng.

2. Nhúng: Các kiến thức liên quan đến sử dụng ngoại vi của vi điều khiển, hệ điều hành thời gian thực RTOS, hệ thống Linux, các design partten dành cho embedded system.

![Untitled](/img/2021-09-20-tu-hoc-lap-trinh-nhung/Lo-trinh-tro-thanh-Embedded-software-develope-1-scaled.jpg)

### KIẾN THỨC VÀ KĨ NĂNG LẬP TRÌNH

Hệ thống nhúng đa phần sử dụng ngôn ngữ C/C++ để lập trình, đối với các bạn học các ngành điện tử, điện tử viễn thông, tự động hóa thường không có thế mạnh lập trình, do lượng kiến thức xung quanh bộ môn lập trình rất ít, thời lượng thực hành lập trình cũng hạn chế nên khó xây dựng cho mình được tư duy lập trình tốt.

Càng ngày, hệ thống nhúng ngày càng phức tạp, lượng code ngày càng lớn. Để phát triển ứng dụng nhúng lập trình viên hay làm việc trên các SDK (Software Development Kit), SDK tổ chức thành các lớp khác nhau, và thường người lập trình sẽ viết ở lớp ứng dụng trên cùng, việc nắm được các Design Pattern của SDK là rất quan trọng để phát triển nhanh ứng dụng.

Tham khảo chuỗi bài viết ở link sau để hiểu rõ ý trên hơn: Tự nghiên cứu kiến thức cơ bản về hệ điều hành thời gian thực - RTOS

Để nâng cao kĩ năng lập trình, ngoài các kiến thức và kĩ năng liên quan đến ngôn ngữ lập trình C/C++, các kiến thức xung quanh như cấu trúc dữ liệu và thuật toán cũng như tư duy lập trình cũng cần được rèn luyện thêm, thầy Tùng trường khoa học tự nhiên có mở khóa học này, sau khóa học tư duy lập trình của các bạn sẽ cải thiện rất đáng kể: https://bigocoding.com/

Quay lại về kiến thức C/C++, việc nắm vững kiến thức về address và pointer là rất cần thiết, khi nào có thời gian mình sẽ có 1 bài viết về chủ đề này sẽ đơn giản và dễ hiểu. Về phần này có một môn của trường đại học Stanford dạy khá dễ hiểu là: https://www.youtube.com/watch?v=Ps8jOj7diA0 ,các bạn xem ở các video đầu tiên.

Học C, bạn cần nắm thêm 1 phần cũng rất quan trọng để có thể nắm được cấu trúc của các source lớn đó là hướng đối tượng trong C, nghe có vẻ lạ nhỉ ? Link hướng dẫn chi tiết cho phần này: https://www.state-machine.com/oop

Việc hiểu rõ các hoạt động của Startup code, phân vùng bộ nhớ trên Linker file cũng là khác biệt giữa lập trình nhúng và phần còn lại, kiến thức này rất quan trọng đối với các bạn làm sản phẩm production cho các công ty. Các bạn có thể tham khảo tại: AK Embedded Base Kit - STM32L151 - Application Startup Code

### KIẾN THỨC VÀ KĨ NĂNG VỀ HỆ THỐNG NHÚNG

Đa phần, các chương trình học hiện tại ở VN tập trung chính vào học sử dụng ngoại vi, TIMER, UART, SPI,... và hiện nay có xu hướng sử dụng các trình generate code, như Cube MX, tùy vào dòng chip.

Việc tiếp cận nhúng theo phương pháp này ban đầu tạo sự hào hứng ban đầu tốt, code và chạy thực tế rất nhanh, tuy nhiên khi làm các dự án thực tế việc thiếu các kiến thức cơ bản sẽ là rào cản rất lớn.

Dự án thực tế tùy thuộc vào nhu cầu sản phẩm sẽ lựa chọn loại chip và compiler khác nhau. cũng như effort thực sự khi làm dự án thực tế là xử lý các issue phát sinh, cách tiếp cận học không đi từ cơ bản sẽ là rào cản lớn.

Một chương trình học nhúng vi điều khiển mình thấy khá sát với thực tế dự án, cũng như bao quát nhiều vấn đề là chương trình tranning của state-machine.com:

Link khóa học: https://www.state-machine.com/video-course

Trong khóa học này có 1 nội dung rất quan trọng là hướng dẫn các bạn tự viết 1 hệ điều hành thời gian thực RTOS, việc tự viết RTOS giúp các bạn hiểu sâu sắc hoạt động bên trong RTOS, việc sử dụng các RTOS bản thương mại như FreeRTOS, Zephyr,... sẽ rất dễ dàng hơn rất nhiều.

state-machine.com cũng giới thiệu cho bạn các kiến thức nâng cao giúp các bạn tổ chức được các dự án phức tạp như event-driven programing, các loại state-machine,... Nếu đã từng làm việc qua các SDK về Zigbee, BLE,... các bạn để ý gần như tất cả stack trên đều sử dụng mô hình event-driven, tùy từng hãng sẽ xây dựng các mô hình khác nhau.

Các bạn tham khảo tại: https://www.state-machine.com/category/concepts

Debug trong hệ thống nhúng vi điều khiển có nhiều điểm khác biệt so với các loại lập trình khác, đa phần là do giới hạn bộ nhớ của MCU (vi điều khiển), bạn cần có các phương pháp ghi log đặc biệt, để log khi sản phẩm chạy thực tế, các kĩ năng debug trên trình debug, cũng như sử dụng Logic Analyzer,... phần này khá dài và phức tạp mình sẽ chia sẻ ở các bài viết khác.

Hiện tại ngành nhúng đang hot với các nhu cầu ở các mảng Automotive và IoT, nhu cầu việc làm là rất lớn, chúc các bạn học tốt và tìm được công việc phù hợp.

### Tổng kết
Tự học lập trình là một hành trình không chỉ đòi hỏi kiên nhẫn và nỗ lực, mà còn yêu cầu sự linh hoạt trong việc áp dụng các phương pháp học hiệu quả. Bài viết trên đã tổng hợp một số phương pháp tự học tốt nhất dành cho lập trình viên mà bạn có thể áp dụng.

Tuy nhiên, không có một phương pháp tự học duy nhất phù hợp với tất cả mọi người. Quan trọng là bạn phải tìm ra phương pháp hoặc kết hợp các phương pháp phù hợp với bản thân để tiến bộ và phát triển trong lĩnh vực lập trình. Hãy kiên nhẫn, kiên trì và luôn tìm cách học hỏi, nâng cao kỹ năng của mình. Với sự đam mê và nỗ lực, bạn có thể trở thành một lập trình viên giỏi và thành công trong sự nghiệp của mình.


