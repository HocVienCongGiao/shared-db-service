docker run --rm --name postgres11 -p 127.0.0.1:5432:5432/tcp -e POSTGRES_PASSWORD=123456 -e POSTGRES_USER=hocvien_dev -e POSTGRES_DB=dev_hocvien --rm postgres:11-alpine
