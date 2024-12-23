FROM python:3.9-alpine

WORKDIR /usr/src/app

RUN apk update
RUN apk add pkgconfig
RUN apk add gcc musl-dev mariadb-connector-c-dev

COPY requirements.txt .
RUN pip install mysqlclient
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]
