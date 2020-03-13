FROM python:3.7.1-alpine3.7

RUN mkdir /tmp/workdir
WORKDIR /tmp/workdir

COPY requirements.txt /tmp/workdir
RUN pip install -r requirements.txt

COPY app.py /tmp/workdir

EXPOSE 8080

CMD [ "gunicorn", "-b 0.0.0.0:8080", "app:app" ]