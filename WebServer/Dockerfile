FROM fauria/lamp

RUN apt-get update
RUN apt-get install -y iputils-ping
RUN apt-get install net-tools
RUN apt-get --assume-yes install sudo
RUN apt-get --assume-yes install openssh-server
RUN apt-get install -y netcat-traditional
RUN apt-get -y install cron
RUN apt-get --assume-yes install rsyslog

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
RUN echo 'test:test' | chpasswd
RUN service ssh start
RUN service apache2 start
RUN service cron start   

# Copy backup script to docker container.
COPY ["backup.sh", "/backups/"]
RUN chmod 0744 /backups/backup.sh

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

RUN (crontab -l -u root; echo "* * * * * /backups/backup.sh") | crontab
RUN sed -ri 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.4.3-amd64.deb
RUN sudo dpkg -i filebeat-8.4.3-amd64.deb
RUN chmod 777 /etc/init.d
COPY ["filebeat.yml", "/etc/filebeat/filebeat.yml"]
COPY ["initFilebeat", "/etc/init.d/initFilebeat"]
RUN chmod 0744 /etc/filebeat/filebeat.yml
RUN chmod 0777 /var/log/apache2/*.log
RUN chmod 777 /etc/init.d/initFilebeat
RUN chown root /etc/init.d/initFilebeat
RUN sudo update-rc.d initFilebeat defaults
RUN echo "LogFormat "%h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\" %{ms}T %p %{Host}i" vhost_combined" >> /etc/apache2/apache2.conf
RUN filebeat modules enable apache


EXPOSE 22
EXPOSE 80

CMD service ssh start && service apache2 start && cron && service rsyslog start && service initFilebeat start && tail -F /var/log/cron.log