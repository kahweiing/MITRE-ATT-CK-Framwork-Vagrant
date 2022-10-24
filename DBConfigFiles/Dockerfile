FROM mariadb/server:10.3

RUN apt-get update
RUN apt-get install -y iputils-ping
RUN apt-get install net-tools
RUN apt-get --assume-yes install sudo
RUN apt-get --assume-yes install openssh-server
RUN apt-get --assume-yes install curl


RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
RUN echo 'test:test' | chpasswd
RUN service ssh start
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.4.3-amd64.deb
RUN sudo dpkg -i filebeat-8.4.3-amd64.deb
RUN chmod 777 /etc/init.d
COPY ["my.cnf", "/etc/mysql/my.cnf"]
RUN chown mysql:mysql /etc/mysql/my.cnf
RUN chmod 600 /etc/mysql/my.cnf
RUN chmod -R 777 /var/log/mysql/
COPY ["filebeat.yml", "/etc/filebeat/filebeat.yml"]
COPY ["initFilebeat", "/etc/init.d/initFilebeat"]
RUN chmod 0744 /etc/filebeat/filebeat.yml
RUN chmod 777 /etc/init.d/initFilebeat
RUN chown root /etc/filebeat/filebeat.yml
RUN chown root /etc/init.d/initFilebeat
RUN sudo update-rc.d initFilebeat defaults
RUN sudo update-rc.d initFilebeat enable
RUN filebeat modules enable mysql


EXPOSE 22
EXPOSE 3306

