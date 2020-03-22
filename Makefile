DOCKER_REGISTRY := gsantoro


build: 
	docker build --rm -t cfi-books:latest .

stop:
	docker rm -f cfi-books || true

down: stop

run: stop
	docker run -d -p 8080:8080 --name cfi-books cfi-books

repo_push:
	docker tag cfi-books:latest ${DOCKER_REGISTRY}/cfi-books
	docker push ${DOCKER_REGISTRY}/cfi-books

up: run

debug:
	source ~/.pyenv/versions/cfi-books-3.7.1/bin/activate; \
		python ./app.py

test:
	curl http://0.0.0.0:8080/books

terminal:
	docker exec -it cfi-books sh