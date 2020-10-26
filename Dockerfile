FROM opensciencegrid/software-base:fresh
LABEL maintainer OSG Software <help@opensciencegrid.org>

# Create the frontend user with a fixed GID/UID
RUN groupadd -o -g 993 frontend
RUN useradd -o -u 996 -g 993 -s /bin/sh frontend

RUN yum -y install glideinwms-vofrontend-standalone --enablerepo=osg-upcoming-testing && \
    yum -y install vim emacs && \
    yum -y update vo-client --enablerepo=osg-development &&\
    yum -y install git

ADD gwms_renew_proxies /usr/libexec/gwms_renew_proxies
ADD renew_proxies /etc/cron.d/renew_proxies
ADD 10-gwms-fe.conf /etc/supervisord.d/
ADD image-config.d/* /etc/osg/image-config.d/
ADD 99-k8s-fe.config /etc/condor/config.d/99-k8s-fe.config
