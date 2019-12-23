.PHONY: configmap

configmap:
	-kubectl delete secret proxycerts -n osg-frontends
	-kubectl create secret generic proxycerts --from-file=frontendkey.pem=../jlabcerts/osg-jlab-1.t2.ucsd.edu-key.pem --from-file=frontendcert.pem=../jlabcerts/osg-jlab-1.t2.ucsd.edu.pem -n osg-frontends
	
	-kubectl delete secret vomscerts -n osg-frontends
	-kubectl create secret generic vomscerts --from-file=../jlabvomscerts/vomscert.pem --from-file=../jlabvomscerts/vomskey.pem -n osg-frontends
	
	-kubectl delete configmap fexml -n osg-frontends
	-kubectl create configmap fexml --from-file=frontend.xml.k8s=jlab-frontend.xml -n osg-frontends
	
	-kubectl delete configmap proxies -n osg-frontends
	-kubectl create configmap proxies --from-file=proxies.ini -n osg-frontends
