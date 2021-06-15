docker build -t shared_db_app_migrations .
docker run --link postgres11:db --rm shared_db_app_migrations:latest python -c 'from shared_db_app.migration import migrate; migrate()'