FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y iputils-ping
RUN apt-get install net-tools

ENTRYPOINT ["tail", "-f", "/dev/null"]

