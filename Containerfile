FROM ubi

WORKDIR /usr/local/bin

ADD files/download.sh .
RUN ./download.sh

RUN yum install -y procps-ng nmap iptables nmap-ncat mtr iputils net-tools iproute
