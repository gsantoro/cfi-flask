
build: 
	docker build --rm -t cfi-flask:latest .

stop:
	docker rm -f cfi-flask || true

run: build stop
	docker run -d -p 8081:8080 --name cfi-flask cfi-flask

test:
	curl http://0.0.0.0:8081/books

terminal:
	docker run -it cfi-flask sh