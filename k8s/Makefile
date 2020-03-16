
#DOCKER_REGISTRY := 192.168.99.100:30000
DOCKER_REGISTRY := gsantoro

pass:
	docker run --rm -it frapsoft/openssl rand -base64 14 | tr -d "\n\r" > .pass

htpasswd: pass
	docker run --rm --entrypoint htpasswd registry:2 -Bbn admin $$(cat .pass) | tr -d "\n\r" > .htpasswd

repo_rm:
	#docker rm -f registry
	helm delete docker-registry

repo_setup: repo_rm
	#docker run -d -p 5000:5000 --restart=always --name registry registry:2
	helm install --set secrets.htpasswd=$$(cat .htpasswd) --set service.nodePort=30000 --set service.type=NodePort docker-registry stable/docker-registry

repo_expose:
	POD_NAME=$$(kubectl get pods --namespace default -l "app=docker-registry,release=docker-registry" -o jsonpath="{.items[0].metadata.name}") ;\
	echo $${POD_NAME} ;\
	kubectl -n default port-forward $${POD_NAME} 5000:5000

repo_push:
	docker tag cfi-books:latest ${DOCKER_REGISTRY}/cfi-books
	docker push ${DOCKER_REGISTRY}/cfi-books

	docker tag cfi-books-gateway:latest ${DOCKER_REGISTRY}/cfi-books-gateway
	docker push ${DOCKER_REGISTRY}/cfi-books-gateway

repo_check:
	curl -u admin:$$(cat .pass) http://${DOCKER_REGISTRY}/v2/_catalog

repo_login:
	cat .pass | docker login ${DOCKER_REGISTRY} --username admin --password-stdin

build:
	docker build --rm -t cfi-books:latest ..
	docker build --rm -t cfi-books-gateway:latest -f nginx.Dockerfile .

rmi:
	docker rmi cfi-books
	docker rmi cfi-books-gateway

stop:

apply: delete
	kubectl apply -f main.yaml

logs:
	kubectl logs cfi-books-pod

delete:
	kubectl delete -f main.yaml

test:
	curl http://0.0.0.0:8080/books

terminal: