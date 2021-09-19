FROM python:3.8-alpine

WORKDIR /usr/src/app

## COPY requirements.txt ./
## RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV DB_USER=hocvien_dev
ENV DB_NAME=dev_hocvien
ENV DB_PASSWORD=123456
ENV DB_HOST=db

## RUN pip install --no-cache-dir -r requirements.txt
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install -r ./requirements.txt --target ./lambda/terraform/module/python

## RUN chmod +x ./scripts/package-python.sh
## RUN ./scripts/package-python.sh
RUN cp -R ./lambda/*.py ./lambda/terraform/module/python/
RUN cp -R ./shared_db_app ./lambda/terraform/module/python/
# RUN cp -R ./migrations ./lambda/terraform/module/python/

WORKDIR /usr/src/app/lambda/terraform/module/python

CMD [ "python", "-c", "'from shared_db_app.migration import migrate; migrate()'" ]
