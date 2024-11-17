
# Sử dụng Ubuntu 22.04 làm base image
FROM ubuntu:22.04

# Khai báo các biến ARG
ARG host_uid=1000
ARG host_gid=1000
ARG USERNAME=bv_rzvt
ARG TZ_VALUE="Asia/Ho_Chi_Minh"

# Thiết lập môi trường không tương tác và các biến môi trường
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=$TZ_VALUE \
    LANG=en_US.UTF-8 \
    TERM=xterm-256color

# Cập nhật package và cài đặt các gói cần thiết
RUN apt-get update && \
    apt-get install -y \
    tzdata \
    build-essential \
    ruby-dev \
    libgmp-dev \
    git \
    curl \
    wget \
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
WORKDIR /usr/src/app

# Copy toàn bộ thư mục vào container
COPY . /usr/src/app/

# Cài đặt các gem từ Gemfile
RUN bundle install

EXPOSE 35729
EXPOSE 4000

# Lệnh mặc định để chạy bash
CMD ["/bin/bash"]
