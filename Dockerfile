FROM centos:7
MAINTAINER T.Konishi

EXPOSE 8080

RUN yum -y install httpd
RUN echo 'Hello, World!' > /var/www/html/index.html
RUN useradd www && chmod -R a+rwx /run/httpd && chmod -R a+rwx /var/log/httpd
COPY httpd.conf /etc/httpd/conf/

USER www
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
