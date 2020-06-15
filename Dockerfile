FROM ubuntu:latest
# Imagen Para Slave De Jenkins - Beta

RUN apt-get update -y \
  && apt-get install openssh-server -y \
  && mkdir -p /var/run/sshd \
  && apt-get install openjdk-8-jdk -y \
  && useradd -d /home/ubuntu -ms /bin/bash -g root -G sudo -p jenkins jenkins \
  && useradd -d /home/ubuntu -ms /bin/bash -g root -G sudo -p ansible ansible \
  && apt-get install software-properties-common -y \
  && apt-add-repository -y ppa:ansible/ansible \
  && apt-get update -y \
  && apt-get install ansible -y

CMD ["ansible","--version"]
