
build: 
	docker build --rm -t cfi-flask:latest .

run: build
	docker run -d -p 8081:8080 cfi-flask

test:
	curl http://0.0.0.0:8081/books

terminal:
	docker run -it cfi-flask sh