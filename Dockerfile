# Sử dụng Ubuntu 22.04 làm base image
FROM ubuntu:22.04
 
LABEL maintainer="Bang Nguyen <duybang140494@gmail.com>"
LABEL version="1.0"
LABEL description="This is a my Docker image."


# Khai báo các biến ARG
ARG TZ_VALUE="Asia/Ho_Chi_Minh"

# Thiết lập môi trường không tương tác và các biến môi trường
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=$TZ_VALUE \
    LANG=en_US.UTF-8 \
    TERM=xterm-256color \
	LC_ALL=en_US.UTF-8

# Cập nhật package và cài đặt các gói cần thiết
RUN apt-get update && \
    apt-get install -y \
    tzdata \
	git curl wget \
	sudo tree nano\
    build-essential \
    ruby-dev \
    libgmp-dev \
    libffi-dev \
    zlib1g-dev \
    libyaml-dev \
    libssl-dev \
    ruby-full \
    locales && \
    ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ_VALUE > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


# Cài đặt Bundler và Jekyll mới nhất tương thích với Ruby hiện tại
RUN gem install bundler jekyll

# Thiết lập thư mục làm việc
WORKDIR /home/app-jekyll

# Copy Gemfile vào container WORKDIR
COPY Gemfile Gemfile.lock /home/app-jekyll

# Copy all vào container WORKDIR
# COPY . /home/$USERNAME/app-jekyll

# Cài đặt các gem từ Gemfile, để sau USERNAME bởi vì cảnh báo không cài bằng root
RUN bundle install


# Mở port 
EXPOSE 35729
EXPOSE 4000

# Lệnh mặc định để chạy bash
CMD ["/bin/bash"]

### how to run?
#### Terminal:
### $ docker build -t jekyll-bangnguyendev .  
### $ docker run -it --name="bangnguyendev_web" \
### 	-p 4000:4000 \
### 	-p 35729:35729 \
### 	--volume="D:\Github\bangnguyendev.github.io":"/home/app-jekyll" \
### 	jekyll-bangnguyendev  \
### 	/bin/bash
#### Container:
### root$: jekyll serve -H 0.0.0.0 --livereload --force_polling --incremental