FROM ubuntu:14.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TERM=xterm

RUN apt-get update -y &&\ 
    apt-get install -y aptitude &&\
    aptitude install -y software-properties-common python-software-properties nfs-kernel-server nfs-common nano &&\
    apt-add-repository ppa:nikratio/s3ql &&\
    aptitude update &&\
    aptitude install -y s3ql

#NFS ports
EXPOSE 111/udp 2049/tcp

COPY run.sh /usr/local/bin/run.sh
#COPY run_s.sh /usr/local/bin/run_s.sh

ENTRYPOINT ["run.sh"]
