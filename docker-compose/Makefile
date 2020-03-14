
stop:
	docker-compose down

build:
	docker-compose build

run: build stop
	docker-compose up -d

test:
	curl --location \
		--request GET '0.0.0.0:8080/books' \
		--header 'Host: cfi.flask.com'