FROM  --platform=linux/arm/v7 arm32v7/ubuntu:22.10

RUN apt-get update 
RUN apt-get install -y openssh-server bash git vim lighttpd libcgi-pm-perl busybox-syslogd
RUN rm -rf /var/lib/apt/lists/*
RUN rm /etc/update-motd.d/*
RUN addgroup --gid 1000 git
RUN adduser --home /home/git --shell /bin/bash --uid 1000 --gid 1000 --gecos "" --disabled-password git
RUN mkdir /var/run/sshd
RUN /usr/bin/ssh-keygen -A
RUN rm /etc/pam.d/sshd

ADD start.sh /start.sh

EXPOSE 22

# CMD ["/start.sh"]
