
stop:
	docker-compose down

build:
	docker-compose build

run: stop
	docker-compose up -d

up: run

test:
	curl --location \
		--request GET '0.0.0.0:8080/books' \
		--header 'Host: cfi.books.com'

terminal:
	docker-compose exec app sh