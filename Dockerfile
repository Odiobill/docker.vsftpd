# debian-based container for vsftpd
# VERSION               0.1
FROM debian
MAINTAINER Davide Lucchesi  "davide@lucchesi.nl"

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y --no-install-recommends vsftpd
RUN apt-get clean

RUN echo "local_enable=YES" >> /etc/vsftpd.conf
RUN echo "chroot_local_user=YES" >> /etc/vsftpd.conf
RUN echo "write_enable=YES" >> /etc/vsftpd.conf
RUN echo "local_umask=022" >> /etc/vsftpd.conf
RUN sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd.conf
RUN sed -i "s/xferlog_enable=YES/xferlog_enable=NO/" /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty

VOLUME /etc

EXPOSE 21

CMD ["vsftpd"]

