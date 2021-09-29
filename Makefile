minikube-test:
	kubectl config use-context minikube
	- kubectl create namespace efk
	- kubectl delete -n efk job initializer
	- mkdir build
	$(eval BUILD_NUMBER=$(shell od -An -N10 -i /dev/urandom | tr -d ' -'))
	eval $$(minikube docker-env) && docker build ./initializer -t initializer:${BUILD_NUMBER}
	helm template -n efk efk . --set-string initializer.image=initializer,initializer.imageVersion=${BUILD_NUMBER} > ./build/efk-manifests.yaml
	kubectl apply -n efk -f ./build/efk-manifests.yaml
