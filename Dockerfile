FROM ubuntu:22.04

RUN apt update && apt install openssh-server sudo -y
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test
RUN echo 'test:testpassw123' | chpasswd
ENV PORT=22

RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
