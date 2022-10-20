FROM fauria/lamp

RUN apt-get update
RUN apt-get install -y iputils-ping
RUN apt-get install net-tools
RUN apt-get --assume-yes install sudo
RUN apt-get --assume-yes install openssh-server
RUN apt-get install -y netcat-traditional
RUN apt-get -y install cron

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
RUN echo 'test:test' | chpasswd
RUN service ssh start
RUN service apache2 start  
RUN service cron start 

# Copy testfiles folder to docker container.
COPY ["backup.sh", "/backups/"]
RUN chmod 0744 /backups/backup.sh

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

RUN (crontab -l -u root; echo "* * * * * /backups/backup.sh") | crontab
RUN sed -ri 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
EXPOSE 80

# CMD ["/usr/sbin/sshd","-D"]
# CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
CMD service ssh start && service apache2 start && cron && tail -F /var/log/mysql/error.log && tail -F /var/log/cron.log