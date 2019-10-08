FROM opensciencegrid/software-base:fresh

RUN yum -y install glideinwms-vofrontend-standalone

ADD 10-gwms-fe.conf /etc/10-gwms-fe.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"] 


