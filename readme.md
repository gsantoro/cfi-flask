# README

Sample app to learn more about web development for REST APIs

## Running
Debug mode with hot reloading of code at any changes

```bash
make run_debug
```

Run inside a container with gunicorn

```bash
make run
```

Run with docker-compose. Two containers, one for gunicorn and one for nginx

```bash
make run_compose
```

## Helm charts
https://github.com/helm/charts/tree/master/stable/docker-registry
