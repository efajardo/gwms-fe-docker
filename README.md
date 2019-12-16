# gwms-fe-docker

Ingredients needed to containerize frontend:
	1) pilot_certs
	2) voms_certs
	3) frontend.xml
	4) proxies.ini
	5) frontend.conf
	6) image-config.d
	7) DockerFile 
	8) frontend_yaml files:
		i. frontend.yaml
		ii. service.yaml
		iii. ingress.yaml
		iv. persistentVolClaim.yaml


Setup:
	a) Make certs secrets using command:
		```
		kubectl create secret --from-file=file_name_as_appears_in_container=cert_1_path --from-file=file_name_as_appears_in_container=cert_2_path  -n -namespace
		```

	b) Make configMap using 3) and 4):
		```
		kubectl create configmap --from-file=file_name_as_appears_in_container=file_name -n -namespace
		```

	c) Make supervisord_fe.conf (5) file as appears in repo. Should be standard.

	d) make dir image-config.d with the scripts inside. Should be standard as well.

	e) Make Dockerfile (7). Also Standard. (Here can change vim for emacs)

	f) Make .yaml files with correct name of frontend in each file.
	   Make sure to have correct name of frontend in ingress host.
