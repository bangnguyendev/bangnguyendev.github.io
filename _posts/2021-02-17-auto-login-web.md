---
layout: post
title: "Auto login account web"
meta-title: "Tips: Auto đăng nhập account web"
subtitle: "...với Python và Selenium"
bigimg:
  - "/img/2021-02-17-auto-login-web/AutomatableTasks.jpg"
image: /img/2021-02-17-auto-login-web/AutomatableTasks.jpg
tags: [python, Selenium, AutomatableTasks]
# gh-repo: bangnguyendev/Documents
# gh-badge: [star, watch, fork, follow]
# comments: true
---
### Giới thiệu về mẹo
- Áp dụng với **máy tính cá nhân** vì `scrip có thể làm lộ thông tin cá nhân của bạn`.
- Tài khoản có tính `Sign Out` hằng ngày và việc chúng ta phải liên tục đăng nhập mỗi ngày (hoặc sau mỗi 4 tiếng với B2b) khiến mọi thứ khó chịu.

Chúng ta có thể áp dụng cho các trường hợp đăng nhập khác.

### Chuẩn bị một vài thứ
- Kiến thức về Python.
- Máy tính đã cài đặt Python.
- Dùng Pip tải Selenium.
- [IEDriverServer.exe](https://github.com/bangnguyendev/Documents/blob/master/Workspace/_FreeCommander/B2B/IEDriverServer.exe) có thể tải ở đây.
- [Java SE Runtime Environment](https://www.oracle.com/java/technologies/javase-jre8-downloads.html) lựa chọn phiên bản phù hợp với máy tính của bạn.

### Lý thuyết áp dụng
Ở bài viết này chúng ta thử nghiệm login vào trang B2b.

<div class="post-img-post">
    <img src="/img/2021-02-17-auto-login-web\login-id-b2b.png">
	Trang login.
</div>
<div class="post-img-post">
    <img src="/img/2021-02-17-auto-login-web\login-pass-b2b.png">
	Hình 1.
</div>
<div class="post-img-post">
    <img src="/img/2021-02-17-auto-login-web\login-pass2-b2b.png">
	Hình 2.
</div>

- Với `mật khẩu dạng ma trận` như vậy thì `mỗi lần đăng nhập` sẽ `là một số khác nhau` (hình 1 và hình 2). Mật khẩu `được quy ước` là một `cột`, `hàng` hay cột hàng `hình vẽ bất kỳ`.
- Mật khẩu ví dụ cho bài này sẽ bôi màu đỏ.
<div class="post-img-post">
    <img src="/img/2021-02-17-auto-login-web\login-pass3-b2b.png">
	Mật khẩu hình "L" gồm 8 ký tự.
</div>

- Thuộc tính của mật khẩu được thể hiện qua hình dưới đây.
- Mật khẩu ví dụ cho bài này sẽ bôi màu đỏ.
	- Ký tự đầu tiên của "L" bắt đầu với mật khẩu là số "8" thì có `id=SMX_BTN_16`.
	- Kế bên `id` là `alt=8` là số tương ứng tại thời điểm đó là mật khẩu.
<div class="post-img-post">
    <img src="/img/2021-02-17-auto-login-web\login-pass4-b2b.png">
	Thuộc tính chứa mật khẩu.
</div>

- Chúng ta có bảng quy luật `id=SMX_BTN_XX` như sau:
<div class="post-img-post">
    <img src="/img/2021-02-17-auto-login-web\login-pass5-b2b.png">
	Thuộc tính chứa mật khẩu.
</div>

- Như vậy mật khẩu cố định của chúng ta sẽ là `"SMX_BTN_16", "SMX_BTN_20", "SMX_BTN_24", "SMX_BTN_28", "SMX_BTN_29", "SMX_BTN_30", "SMX_BTN_31", "SMX_BTN_44"`.
- Ứng với mỗi `SMX_BTN` chúng ta đọc về thuộc tính `atl` kế bên là sẽ được mật khẩu.

### Code thực tế với Python và Selenium

#### Khai báo thư viện
- Cách `cài đặt thư viện` ở [link đây](https://selenium-python.readthedocs.io/installation.html)
```python
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
```

#### Khai báo hằng số cơ bản

```python
 # ID login (mình xin giấu ID login theo Policy)
id_B2B = "a5124XXXX"
 # đường dẫn để file IEDriverServer (đối với trình duyệt IE thôi nha :))
link_IEDriverServer = "D:\\_FreeCommander\\B2B\\IEDriverServer.exe"
 # link đường dẫn vào trang cần đăng nhập (ở đây mình xin che link nhé)
link_B2B = "https://b2b-gateway.XXXXXXXX.com/login/ssl"
 # một mảng các phần tử cấu thành mật khẩu đẫ lấy ở trên
arr = ["SMX_BTN_16", "SMX_BTN_20", "SMX_BTN_24", "SMX_BTN_28", "SMX_BTN_29", "SMX_BTN_30", "SMX_BTN_31", "SMX_BTN_44"]
```

### Khởi chạy trình duyệt

```python
 # khởi chạy trình duyệt với IEDriverServer
driver = webdriver.Ie(link_IEDriverServer)
 # truy cập vào link đã khai báo ở trên
driver.get(link_B2B)
 # chờ hồi đáp và làm tiếp nhiệm vụ tiếp theo
driver.implicitly_wait(30) # seconds
```

### Xử lý sự kiện
- Mình sử dụng `try--except` để sử dụng để phòng các trường hợp không mong muốn xảy ra.
- Khởi chạy cơ bản với các thông số input đã được cấp ở trên:
```python
# tìm kiếm thuộc tính LOGIN_ID, điền ID login vào đó
driver.find_element_by_name('LOGIN_ID').send_keys(id_B2B)
# và Click vào Button 'Login'.
driver.find_element_by_class_name("btnCustom").click()
# khởi tạo password với giá trị trống
password=""
print("Login: " + id_B2B)
# Tìm kiếm các phần tử `BTN` ở trên và tìm giá trị của nó lưu vào mảng `password`
for i in arr:
	ID_BTN = driver.find_element_by_id(i)
	pass_temp = ID_BTN.get_attribute("alt")
	password += pass_temp
# Tìm kiếm ô password và điền mảng password đã tìm được ở vòng for trên
driver.find_element_by_name("PASSWORD").send_keys(password)
print("Pass : " + password)
# Tìm nút nhấn OK thôi.
driver.find_element_by_class_name("btnCustom").click()
print("Waiting...")
```

- Hình ảnh minh họa:
<div class="post-img-post">
    <img src="/img/2021-02-17-auto-login-web\login-id2-b2b.png">
	Thông tin html ô chứa text ID Login.
</div>
<div class="post-img-post">
    <img src="/img/2021-02-17-auto-login-web\login-pass7-b2b.png">
	Thông tin html ô chứa text Password Login.
</div>

#### Try-except 
- Với trường hợp đầu tiên trong vòng 30 giây nếu `selenium` tìm thấy ID `table_LoginPage_5` có nghĩa là nó chưa được connect to VPN. (Trong 30 giây đó củng là time chờ kết nối.)
- ở trường hợp này `table_LoginPage_5` ứng với thông báo (hình mô tả phía dưới):

{: .box-warning}
*You are not allowed to sign in. Please contact your administrator.*

```python
try:
	element = WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.ID, "table_LoginPage_5")))    
	print("Please connect VPN.")
	print("Could not connect to B2b. Please try again")
except:
	element = WebDriverWait(driver, 70).until(EC.presence_of_element_located((By.ID, "table_welcome_2")))    
	print("Welcome to the Secure Access SSL VPN, " + driver.find_element_by_class_name("cssSmall").text)
	print("Quit IE.")
	driver.quit()
finally:
	print("Done.")
```

- Tiếp đó nếu tìm thấy ID `table_welcome_2` có nghĩa là đã kết nối tới B2b thành công.
- Xác nhận thành công thì chạy lệnh thoát trình duyệt `driver.quit()`.

<div class="post-img-post">
    <img src="/img/2021-02-17-auto-login-web\login-fail-b2b.png">
	Không thể đăng nhập vì chưa connect VPN.
</div>

***Lưu ý:** ở mỗi web khác nhau, mỗi trường hợp khác nhau đều có ID khác nhau và chúng ta nên `lựa` những `ID có tính chất đặc biệt` để làm dấu hiệu nhận biết **Fail** hay **Pass**.*

### *Link tham khảo:*
*	*Refer from [networld.co.jp](https://www.networld.co.jp/product/secure_matrix/overview/feature/)*
*	*Refer from [selenium-python](https://selenium-python.readthedocs.io/locating-elements.html)*
*	*Refer from [Anh Kiệt Trần](https://kietanhtran.github.io/)*