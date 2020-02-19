FROM opensciencegrid/software-base:fresh
LABEL maintainer OSG Software <help@opensciencegrid.org>

RUN yum -y install cronie && \
    yum -y install supervisor && \
    yum -y install glideinwms-vofrontend-standalone && \
    yum -y install vim && \
    yum -y install git

ADD gwms_renew_proxies /usr/libexec/gwms_renew_proxies
ADD renew_proxies /etc/cron.d/renew_proxies
ADD 10-gwms-fe.conf /etc/supervisord.d/
ADD image-config.d/* /etc/osg/image-config.d/
ADD 99-k8s-fe.config /etc/condor/config.d/99-k8s-fe.config
