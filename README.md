# gwms-fe-docker

## Ingredients needed to containerize frontend:
1. pilot_certs
2. voms_certs
3. frontend.xml
4. proxies.ini
5. frontend.conf
6. image-config.d
7. DockerFile 
8. frontend_yaml files:
	- frontend.yaml
	- service.yaml
	- ingress.yaml
	- persistentVolClaim.yaml


## Setup:
1. Make certs secrets using command:
	
`kubectl create secret --from-file=file_name_as_appears_in_container=cert_1_path --from-file=file_name_as_appears_in_container=cert_2_path  -n -namespace`

1. Make configMap using 3) and 4):
	
`kubectl create configmap --from-file=file_name_as_appears_in_container=file_name -n -namespace`

1. Make supervisord_fe.conf (5) file as appears in repo. Should be standard.

1. make dir image-config.d with the scripts inside. Should be standard as well.

1. Make Dockerfile (7). Also Standard. (Here can change vim for emacs)

1. Make .yaml files with correct name of frontend in each file.
   Make sure to have correct name of frontend in ingress host.

1. Create the PersistentVolumeClaim for the frontend web files ex,

   ```
   kubectl create -f k8s/jlabperVolClaim.yaml -n osg-frontends
   ```