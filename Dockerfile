FROM opensciencegrid/software-base:fresh

RUN yum -y install glideinwms-vofrontend-standalone

ADD 10-gwms-fe.conf /etc/supervisord.d

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"] 


