FROM ubuntu:xenial
ENV DISPLAY ":1"
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -f -y \
    net-tools \
    htop \
    nano \
    xorg \
    curl \
    grep \
    less \
    rxvt \
    i3-wm \
    i3status

RUN curl --progress-bar -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg --unpack google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    rm google-chrome-stable_current_amd64.deb

RUN wget -q -O /tmp/tigervnc-1.8.0.x86_64.tar.gz https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc-1.8.0.x86_64.tar.gz && \
    cd /tmp && tar -xf tigervnc-1.8.0.x86_64.tar.gz && cp -R tigervnc-1.8.0.x86_64/* /


RUN useradd -ms /bin/bash ubuntu
USER ubuntu

RUN echo "password\npassword\nn\n" | vncpasswd
RUN touch /home/ubuntu/.Xresources

ADD bashrc.sh /home/ubuntu/.bashrc
ADD Xresources /home/ubuntu/.Xresources
ADD xstartup.sh /home/ubuntu/.vnc/xstartup
ADD i3.conf /home/ubuntu/.i3/config

ADD script.sh /home/ubuntu/script.sh

WORKDIR /home/ubuntu

ENTRYPOINT ["/home/ubuntu/script.sh"]
