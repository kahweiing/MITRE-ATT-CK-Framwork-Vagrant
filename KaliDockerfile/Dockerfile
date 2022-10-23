FROM kalilinux/kali-rolling

RUN apt-get update
RUN apt-get install -y net-tools
RUN apt-get install iputils-ping -y
RUN apt-get --assume-yes install nano
RUN apt-get install net-tools
RUN apt-get --assume-yes install python3
RUN apt-get --assume-yes install sudo
RUN apt-get --assume-yes install openssh-server
RUN apt-get --assume-yes install systemctl
RUN apt-get --assume-yes install python3-pip
RUN apt-get install -y netcat-traditional
RUN pip install requests
RUN apt install gobuster
RUN apt -y install curl
RUN apt -y install wget
RUN apt-get -y install nmap
RUN service ssh start
ENTRYPOINT ["tail", "-f", "/dev/null", "service ssh restart", "bash"]