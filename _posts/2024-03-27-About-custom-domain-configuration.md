---
layout: post
title: "Custom domain configuration Github Page"
meta-title: "Setup DNS Squarespace"
subtitle: "... Custom domain configuration Github Page"
bigimg:
  - "/img/2024-03-27-About-custom-domain-configuration/banner.webp"
image: "/img/2024-03-27-About-custom-domain-configuration/dns-la-gi.jpg"
tags: [dns, gtihub-page, domain, Squarespace]
category: ngoai-luong
# gh-repo: bangnguyendev/Documents
# gh-badge: [star, watch, fork, follow]
comments: true
---
Đối với trải nghiệm của bạn trên môi trường internet, DNS là một yếu tố vô cùng quan trọng. DNS duy trì một thư mục tên miền và dịch chúng sang địa chỉ IP trên internet.

### ⚙️ Giới thiệu DNS

**DNS**, viết tắt của **Domain Name System**, là hệ thống quản lý và phân giải tên miền trên Internet. Tưởng tự như một "danh bạ khổng lồ", DNS chuyển đổi các tên miền dễ nhớ như "example.com" thành địa chỉ IP tương ứng như "192.0.2.1" để máy tính có thể hiểu và kết nối với máy chủ web.

Quá trình hoạt động của DNS bắt đầu khi **người dùng nhập tên miền vào trình duyệt**. **Trình duyệt gửi yêu cầu tới máy chủ DNS gần nhất**. **Máy chủ DNS** này sẽ **kiểm tra** xem nó **có thông tin về tên miền** đó không. Nếu có, **nó trả về địa chỉ IP tương ứng**. Nếu không, máy chủ DNS này sẽ tiếp tục truy vấn các máy chủ DNS khác cho đến khi tìm thấy địa chỉ IP.

Khi **trình duyệt nhận được địa chỉ IP từ máy chủ DNS**, nó sẽ sử dụng **địa chỉ này để thiết lập kết nối đến máy chủ web và tải nội dung** trang web tương ứng. Quá trình này diễn ra một cách **nhanh chóng và tự động**, cho phép **người dùng** truy cập internet một cách thuận tiện mà **không cần nhớ các địa chỉ IP phức tạp**.

### ⚙️ Root-servers
Trang web [*https://root-servers.org*](https://root-servers.org) là một nguồn thông tin quan trọng về các máy chủ gốc (root servers) trên Internet. Nó cung cấp các thông tin liên quan đến cơ sở hạ tầng DNS và các máy chủ gốc, bao gồm danh sách các máy chủ gốc trên toàn cầu, thông tin về quản lý và phân phối của các máy chủ này, cũng như các tài liệu và tài nguyên liên quan đến DNS và hệ thống tên miền.

<div class="post-img-post" style="width: 70%;">
    <a href="https://root-servers.org/">
        <img src="/img/2024-03-27-About-custom-domain-configuration/root-server.png">
    </a>
    https://root-servers.org/
</div>

### ⚙️ Một số Broker Domain

**Broker domain** là các công ty hoặc dịch vụ cung cấp cho người dùng khả năng đăng ký và quản lý tên miền trên Internet. Các broker domain thường cung cấp một loạt các dịch vụ liên quan đến tên miền, bao gồm:

- **Đăng ký tên miền**: Cho phép người dùng đăng ký tên miền mới cho trang web của họ.

- **Chuyển nhượng tên miền**: Hỗ trợ quá trình mua bán hoặc chuyển nhượng tên miền giữa các bên.

- **Tùy chỉnh DNS**: Cho phép người dùng quản lý bản ghi DNS của tên miền, bao gồm các bản ghi A, CNAME, MX và TXT để điều hướng lưu lượng và cấu hình dịch vụ.

- **Bảo vệ quyền riêng tư**: Cung cấp các dịch vụ bảo vệ quyền riêng tư để ẩn thông tin liên lạc của chủ sở hữu tên miền trong các cơ sở dữ liệu công khai WHOIS.

- **Hỗ trợ kỹ thuật**: Cung cấp hỗ trợ kỹ thuật và tư vấn cho việc cấu hình và quản lý tên miền.


| Broker Domain Quốc Tế | Broker Domain Việt Nam |
|-------------------------|-------------------------|
| GoDaddy                 | Mat Bao                 |
| Namecheap               | PA Vietnam              |
| Squarespace             | Tenten                  |
| Bluehost                | VinaHost                |
| Hover                   | HostingViet             |
| NameSilo                | Nhân Hòa                |
| Dynadot                 | Viettel IDC             |
| Gandi                   | Mắt Việt                |


### ⚙️ Giới thiệu về Squarespace

**Squarespace** là một nền tảng xây dựng trang web và cửa hàng trực tuyến phổ biến với các ưu điểm và nhược điểm sau:

>**Free WHOIS Privacy, SSL, and Premium DNS included**. Host with us, or any provider of your choice. - *UPDATE 27/3/2024*

#### ⚙️ Ưu điểm Squarespace:

1. **Thiết kế đẹp mắt**: Cung cấp các mẫu thiết kế chuyên nghiệp và đẹp mắt, giúp người dùng tạo ra trang web ấn tượng một cách nhanh chóng.

2. **Dễ sử dụng**: Giao diện trực quan và công cụ kéo và thả giúp người dùng tạo và quản lý trang web một cách dễ dàng, không cần kiến thức về lập trình.

3. **Hỗ trợ bán hàng**: Có các tính năng tích hợp mạnh mẽ cho việc tạo cửa hàng trực tuyến và quản lý sản phẩm.

4. **Tích hợp tiếp thị**: Hỗ trợ tích hợp các công cụ tiếp thị và phân tích để giúp người dùng tối ưu hóa hiệu suất trang web của họ.

#### ⚙️ Nhược điểm Squarespace:

1. **Giá cả**: Dịch vụ của Squarespace có thể đắt hơn so với các nền tảng khác, đặc biệt đối với các gói dịch vụ cao cấp.

2. **Hạn chế tùy chỉnh**: Mặc dù Squarespace cung cấp các công cụ tùy chỉnh, nhưng nó có thể không linh hoạt như một số nền tảng tự lập trang web khác.

### ⚙️ Đăng ký tên miền của Squarespace

Đầu tiên, các bạn truy cập vào trang web [Squarespace](https://domains.squarespace.com) và thực hiện đăng ký hoặc Login bằng tài khoản Google

<div class="post-img-post"  style="width: 70%;">
    <a href="https://domains.squarespace.com/">
        <img src="/img/2024-03-27-About-custom-domain-configuration/Squarespace-index.png">
    </a><br>
    https://domains.squarespace.com/
</div>

Tiếp theo, nhập key-word tên domain mà các bạn muốn vào ô tìm kiếm.

- ***Squarespace** sẽ check toàn bộ hiện hành đã được đăng ký và chưa đăng ký kèm giá cho các bạn lựa chọn*

<div class="post-img-post">
    <a href="https://domains.squarespace.com/">
        <img src="/img/2024-03-27-About-custom-domain-configuration/search-domain.png">
    </a>
</div>

Thực hiện chọn lựa Domain rồi bấm tiếp tục như ảnh bên dưới

<div class="post-img-post">
    <img src="/img/2024-03-27-About-custom-domain-configuration/dang-ky-domain- 1.png"><br>
    Thực hiện chọn lựa Domain rồi bấm tiếp tục như ảnh
</div>

<div class="post-img-post">
    <img src="/img/2024-03-27-About-custom-domain-configuration/dang-ky-domain- 2.jpg"><br>
    Điền đầy đủ thông tin cá nhân, pháp lý và Bấm tiếp tục
</div>

<div class="post-img-post">
    <img src="/img/2024-03-27-About-custom-domain-configuration/dang-ky-domain- 3.jpg"><br>
    Điền thông tin để in hóa đơn (nếu cần)
</div>

<div class="post-img-post">
    <img src="/img/2024-03-27-About-custom-domain-configuration/dang-ky-domain- 4.jpg"><br>
    Nhập thông tin thẻ VISA/MASTERCARD để thanh toán
</div>

<div class="post-img-post">
    <img src="/img/2024-03-27-About-custom-domain-configuration/dang-ky-domain- 55.png"><br>
    Giao diện quản lý các Domain bạn sở hữu của hệ thống Squarespace
</div>

**Squarespace** hỗ trợ cung cấp **SSL/TLS miễn phí** cho các trang web được xây dựng trên nền tảng của họ thông qua **Let's Encrypt**. SSL/TLS (Secure Sockets Layer/Transport Layer Security) là một giao thức bảo mật dùng để bảo vệ dữ liệu truyền qua mạng internet, đảm bảo rằng thông tin nhạy cảm như thông tin cá nhân, mật khẩu, và giao dịch tài chính được mã hóa và an toàn.

Bằng cách tích hợp **Let's Encrypt** vào hệ thống của họ, **Squarespace** giúp người dùng dễ dàng **kích hoạt chứng chỉ SSL/TLS cho trang web của họ một cách tự động và miễn phí**. Điều này giúp tăng cường sự tin cậy và an toàn cho trang web, cũng như **cải thiện vị trí của trang web trên các công cụ tìm kiếm do SSL/TLS** được coi là một yếu tố quan trọng trong việc xếp hạng trang web trên các công cụ tìm kiếm như Google.

<div class="post-img-post">
    <img src="/img/2024-03-27-About-custom-domain-configuration/overview-squarespace.png"><br>
    Trang quản lý Domain có giao diện như ảnh
</div>

### ⚙️ Cấu hình DNS Squarespace

Ở phần này, chúng ta vào tab `DNS`-> `DNS Settings`

Chúng ta sẽ xóa hết các Preset cấu hình mặc định của Squarespace đi nhé!

Tiếp tục `Add Record` như ảnh dưới:

<div class="post-img-post">
    <img src="/img/2024-03-27-About-custom-domain-configuration/cau-hinh-dns.png"><br>
    Cấu hình DNS
</div>

### ⚙️ Kết quả Cấu hình DNS Squarespace

Sau khi cấu hình xong, chúng ta sử dụng `dig` trên Linux `terminal` để kiểm tra xem DNS cấu hình được chưa hen!

{: .box-note}
**Note:** The dig command, which can be used to verify correct configuration of DNS records, is ***not included in Windows***. Before you can verify that your DNS records are configured correctly, you must install [BIND](https://www.isc.org/bind/).

<div class="post-img-post">
    <img src="/img/2024-03-27-About-custom-domain-configuration/done-config-dns.png">
</div>

*Nếu không có Linux hoặc không thể sử dụng lệnh `dig`* chúng ta có thể sử dụng [ToolBox Google](https://toolbox.googleapps.com/apps/dig/?lang=vi#A/) và điền thông tin tên miền của chúng ta

<div class="post-img-post"  style="width: 70%;">
    <a href="https://toolbox.googleapps.com/apps/dig/?lang=vi#A/">
    <img src="/img/2024-03-27-About-custom-domain-configuration/google-admin-dig-1.png">
    </a><br>
    Google Admin Toolbox - Dig
</div>

*Output Google Admin Toolbox - Dig check*

```
id 43223
opcode QUERY
rcode NOERROR
flags QR RD RA
;QUESTION
www.mittochipzz.net. IN A
;ANSWER
www.mittochipzz.net. 14323 IN CNAME bangnguyendev.github.io.
bangnguyendev.github.io. 3523 IN A 185.199.108.153
bangnguyendev.github.io. 3523 IN A 185.199.109.153
bangnguyendev.github.io. 3523 IN A 185.199.110.153
bangnguyendev.github.io. 3523 IN A 185.199.111.153
;AUTHORITY
;ADDITIONAL
```

### ⚙️ Cấu hình CNAME Github-page

**Điều kiện tiên quyết** bước này là [***Check Output Dig***](#kết-quả-cấu-hình-dns-squarespace) phải có nhé!

- Truy cập vào repo chứa source code và làm theo các bước như hình

<div class="post-img-post">
    <img src="/img/2024-03-27-About-custom-domain-configuration/setup-github-page-CNAME.png">
</div>

- Bước 3, quá trình check DNS cần một vài phút nhé!

- Bước 4, đợi bước 3 check hoàn tất thì bạn cần phải tick HTTPS.

{: .box-note}
Note: DNS changes can take up to 24 hours to propagate.

### ⚙️ Giải thích thông số cấu hình

- *Lý do mình cấu hình như vậy ở đây hen!!!*

<div class="post-img-post">
    <a href="https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site">
    <img src="/img/2024-03-27-About-custom-domain-configuration/learn-more-about-config-DNS-githubpage.png">
    </a><br>
    Configuring a custom domain for your GitHub Pages site
</div>

***Nhấn vào ảnh trên***, chúng ta thấy ở hình dưới mục `About custom domains and GitHub Pages` -> `Supported custom domains`

Github-page hỗ trợ 3 loại **Domain subdomain, Custom subdomain, Apex domain**

- **Subdomain (Tên miền phụ)**: Phần của tên miền trước tên miền cấp cao nhất (TLD). Ví dụ: `blog.example.com`.

- **Custom Subdomain (Tên miền phụ tùy chỉnh)**: Subdomain được tạo ra để phản ánh một phần cụ thể của trang web hoặc dịch vụ. Ví dụ: "blog" trong `blog.example.com`.

- **Apex Domain (Tên miền gốc)**: Tên miền cấp cao nhất trong một hệ thống tên miền, thường được sử dụng cho trang chính của một trang web hoặc dịch vụ. Ví dụ: "example.com".

- ***Ví dụ, sở hữu tên miền mittochipzz.net từ Squarespace***

| Loại        | Tên Miền                  |
|-------------|---------------------------|
| Subdomain   | www.mittochipzz.net       |
| Custom Subdomain | blog.mittochipzz.net  |
| Apex Domain | mittochipzz.net           |

<div class="post-img-post">
    <a href="https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/about-custom-domains-and-github-pages#supported-custom-domains">
      <img src="/img/2024-03-27-About-custom-domain-configuration/support-domain-githubpage.png">
    </a>
</div>

#### ⚙️ Apex domain

*Ở bài viết này, tôi sử dụng **Apex domain** có nghĩa là sẽ truy cập trực tiếp ` ` để vào trang web.*

Lí do [***Cấu hình DNS Squarespace***](#cấu-hình-dns-squarespace) cho `A Record` là dựa vào các thông số như ảnh dưới đây

<div class="post-img-post">
    <a href="https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain
    ">
      <img src="/img/2024-03-27-About-custom-domain-configuration/configuring-an-apex-domain.png">
    </a>
</div>

### Kết quả config DNS cho Github-Page

Sau hơn 6 tiếng để DNS cấu hình thì trang Web nó đã hoạt động.

Như hình bên dưới thấy khi sử dụng địa chỉ gốc [bangnguyendev.github.io](https://bangnguyendev.github.io/) thì báo về `301 Moved Permanently`.

Trang web đã được chuyển tới [mittochipzz.net](https://mittochipzz.net)

<div class="post-img-post">
      <img src="/img/2024-03-27-About-custom-domain-configuration/output-config-DNS-done.png">
</div>


<div class="contact_NFC">
    <a href="https://zalo.me/{{ site.author.telephone }}" target="_blank" rel="noopener" title="Zalo">
    <span class="fa-stack fa-lg" aria-hidden="true">
      <i class="fa fa-circle fa-stack-2x"></i>
      <i class="fa fa-phone fa-stack-1x fa-inverse"></i>
    </span>
    <span class="sr-only">Zalo</span> Zalo Bằng Nguyễn 0784140494
  </a>
</div>