FROM centos:centos7

RUN yum -y install http://repo.opensciencegrid.org/osg/3.4/osg-3.4-el7-release-latest.rpm && \
    yum -y install epel-release \
                   yum-plugin-priorities && \
    yum -y install cronie && \
    yum -y install stashcache-cache-server --enablerepo=osg-testing && \
    yum -y install stashcache-cache-server-auth --enablerepo=osg-testing && \
    yum -y update xrootd* --enablerepo=hcc-testing && \
    yum -y install globus-proxy-utils && \
    yum -y install supervisor && \
    yum -y install glideinwms-vofrontend-standalone

ADD fetch-crl-kubernetes /etc/cron.d/fetch-crl-kubernetes
ADD refresh_proxy /usr/local/sbin/refresh_proxy
ADD fix_certs.sh /usr/local/sbin/fix_certs.sh
ADD refresh_proxy.cron  /etc/cron.d/refresh-proxy 

RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisord.conf/
ADD 10-gwms-fe.conf /etc/supervisord.d/


CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"] 
