find ./lambda/terraform/module/python/ -not -name '.gitkeep' -delete

docker build -t shared_db_app_migrations .

cp -R ./migrations ./lambda/terraform/module/python/

docker run --link postgres11:db --mount type=bind,source="$(pwd)"/lambda/terraform/module/python/migrations,target=/usr/src/app/lambda/terraform/module/python/migrations --rm shared_db_app_migrations:latest python -c 'from shared_db_app.migration import migrate; migrate()'
