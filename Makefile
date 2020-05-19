.PHONY: configmap

all: jlab gluex igwn
	-kubectl delete configmap proxy-generator -n osg-frontends
	-kubectl create configmap proxy-generator --from-file=gwms_renew_proxies=gwms_renew_proxies -n osg-frontends
jlab:
	-kubectl delete secret jlabproxycerts -n osg-frontends
	-kubectl create secret generic jlabproxycerts --from-file=frontendkey.pem=../jlabcerts/osg-jlab-1.t2.ucsd.edu-key.pem --from-file=frontendcert.pem=../jlabcerts/osg-jlab-1.t2.ucsd.edu.pem -n osg-frontends	
	-kubectl delete secret jlabvomscerts -n osg-frontends
	-kubectl create secret generic jlabvomscerts --from-file=../jlabvomscerts/vomscert.pem --from-file=../jlabvomscerts/vomskey.pem -n osg-frontends
	-kubectl delete secret eicvomscerts -n osg-frontends
	-kubectl create secret generic eicvomscerts --from-file=../eicvomscerts/vomscert.pem --from-file=../eicvomscerts/vomskey.pem -n osg-frontends
	-kubectl delete configmap jlab-fexml -n osg-frontends
	-kubectl create configmap jlab-fexml --from-file=frontend.xml.k8s=jlab-frontend.xml -n osg-frontends
	-kubectl delete configmap jlab-proxies-config -n osg-frontends
	-kubectl create configmap jlab-proxies-config --from-file=proxies.ini -n osg-frontends
gluex:
	-kubectl delete secret gluexproxycerts -n osg-frontends
	-kubectl create secret generic gluexproxycerts --from-file=frontendkey.pem=../gluex-pilot-certs/hostkey.pem  --from-file=frontendcert.pem=../gluex-pilot-certs/hostcert.pem -n osg-frontends
	-kubectl delete configmap gluex-fexml -n osg-frontends
	-kubectl create configmap gluex-fexml --from-file=frontend.xml.k8s=GluexConfig/gluex-frontend.xml -n osg-frontends
	-kubectl delete configmap gluex-proxies-config -n osg-frontends
	-kubectl create configmap gluex-proxies-config --from-file=proxies.ini=GluexConfig/gluex-proxies.ini -n osg-frontends

igwn:
	-kubectl delete secret igwnproxycerts -n osg-frontends
	-kubectl create secret generic igwnproxycerts --from-file=frontendkey.pem=../igwn-pilot-certs/hostkey.pem --from-file=frontendcert.pem=../igwn-pilot-certs/hostcert.pem -n osg-frontends
	-kubectl delete secret osgvomscerts -n osg-frontends
	-kubectl create secret generic osgvomscerts --from-file=../osgvomscerts/vomscert.pem --from-file=../osgvomscerts/vomskey.pem -n osg-frontends
	-kubectl delete configmap igwn-fexml -n osg-frontends
	-kubectl create configmap igwn-fexml --from-file=frontend.xml.k8s=IGWNConfig/frontend.xml -n osg-frontends
	-kubectl delete configmap igwn-proxies-config -n osg-frontends
	-kubectl create configmap igwn-proxies-config --from-file=proxies.ini=IGWNConfig/proxies.ini -n osg-frontends
