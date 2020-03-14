
build: 
	docker build --rm -t cfi-flask:latest .

stop:
	docker rm -f cfi-flask || true

run: build stop
	docker run -d -p 8080:8080 --name cfi-flask cfi-flask

debug:
	python ./app.py

test:
	curl http://0.0.0.0:8080/books

terminal:
	docker run -it cfi-flask sh