FROM opensciencegrid/software-base:fresh

RUN yum -y glideinwms-vofrontend-standalone && \
    yum -y install supervisor

RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"] 


