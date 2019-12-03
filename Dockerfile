FROM opensciencegrid/software-base:fresh

RUN yum -y install cronie && \
    yum -y install supervisor && \
    yum -y install glideinwms-vofrontend-standalone && \
    yum -y install vim

RUN mkdir -p /var/log/supervisor

ADD 10-gwms-fe.conf /etc/10-gwms-fe.conf/
ADD image-config.d/* /etc/osg/image-config.d/

CMD ["/usr/bin/supervisord", "-c", "/etc/10-gwms-fe.conf"] 

