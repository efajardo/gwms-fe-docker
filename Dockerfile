FROM opensciencegrid/software-base:20190912-2036

RUN yum -y install cronie && \
    yum -y install supervisor && \
    yum -y install glideinwms-vofrontend-standalone && \
    yum -y install vim

RUN mkdir -p /var/log/supervisor

ADD 10-gwms-fe.conf /etc/supervisord.d/

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"] 
