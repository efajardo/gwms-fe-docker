.PHONY: configmap

jlab:
	-kubectl delete secret jlabproxycerts -n osg-frontends
	-kubectl create secret generic jlabproxycerts --from-file=frontendkey.pem=../jlabcerts/osg-jlab-1.t2.ucsd.edu-key.pem --from-file=frontendcert.pem=../jlabcerts/osg-jlab-1.t2.ucsd.edu.pem -n osg-frontends
	
	-kubectl delete secret jlabvomscerts -n osg-frontends
	-kubectl create secret generic jlabvomscerts --from-file=../jlabvomscerts/vomscert.pem --from-file=../jlabvomscerts/vomskey.pem -n osg-frontends
	
	-kubectl delete configmap jlab-fexml -n osg-frontends
	-kubectl create configmap jlab-fexml --from-file=frontend.xml.k8s=jlab-frontend.xml -n osg-frontends
	
	-kubectl delete configmap jlab-proxies-config -n osg-frontends
	-kubectl create configmap jlab-proxies-config --from-file=proxies.ini -n osg-frontends
gluex:
	-kubectl delete secret gluexproxycerts -n osg-frontends
	-kubectl create secret generic gluexproxycerts --from-file=frontendkey.pem=../gluex-pilot-certs/hostkey.pem  --from-file=frontendcert.pem=../gluex-pilot-certs/hostcert.pem -n osg-frontends
	-kubectl delete configmap gluex-fexml -n osg-frontends
	-kubectl create configmap gluex-fexml --from-file=frontend.xml.k8s=gluex-frontend.xml -n osg-frontends
	-kubectl delete configmap gluex-proxies-config -n osg-frontends
	-kubectl create configmap gluex-proxies-config --from-file=proxies.ini=gluex-proxies.ini -n osg-frontends

