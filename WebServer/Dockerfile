FROM fauria/lamp

ADD ./3204.sql /tmp/3204.sql
RUN apt-get update
RUN apt-get install -y iputils-ping
RUN apt-get install net-tools
RUN apt-get --assume-yes install sudo
RUN apt-get --assume-yes install openssh-server

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
RUN echo 'test:test' | chpasswd
RUN service ssh start
RUN service apache2 start  
RUN service mysql start
EXPOSE 22
EXPOSE 80
EXPOSE 3306

RUN /bin/bash -c "/usr/bin/mysqld_safe --skip-grant-tables &" && \
  sleep 5 && \
  mysql -u root -e "CREATE DATABASE clinic_db" && \
  mysql -u root clinic_db < /tmp/3204.sql

# CMD ["/usr/sbin/sshd","-D"]
# CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
CMD service mysql start && service apache2 start && tail -F /var/log/mysql/error.log