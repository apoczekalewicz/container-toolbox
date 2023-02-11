FROM registry.access.redhat.com/ubi8

WORKDIR /usr/local/bin

ADD files/download.sh .
RUN ./download.sh

RUN INSTALL_PKGS="sos redhat-support-tool vim-minimal tcpdump mtr strace telnet procps-ng traceroute nmap-ncat iputils iproute jq bind-utils openssh-clients tcpdump nmap-ncat iptables" && \
    yum -y install $INSTALL_PKGS && \
    rpm -V --nosize --nofiledigest --nomtime $INSTALL_PKGS && \
    yum clean all && \
    rm -rf /usr/local/man

RUN pip3 install s4cmd
CMD ["/usr/bin/bash"]
