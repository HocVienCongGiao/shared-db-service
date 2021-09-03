# shared-db-service

Make sure no program/db is running on port 5432
1. Open a terminal at project location where you just cloned shared-db-service
2. `chmod +x ./scripts/*.sh`
3. Run `./scripts/start-postgres.sh` in a terminal and keep it open
4. Open a new terminal and run `./scripts/run-migrations.sh`
5. Use your preferred DB Client to connect and validate the results. If you don't have a preferred DB Client, run `docker run --env PGADMIN_DEFAULT_EMAIL=test@local.com --env PGADMIN_DEFAULT_PASSWORD=password  -p 127.0.0.1:5050:80 --rm dpage/pgadmin4` and open http://localhost:5050 and login with test@local.com/password

If you get `docker: invalid reference format`
do the following
```
sudo apt-get update -y
sudo apt-get install -y dos2unix
dos2unix ./scripts/*.sh
```
Then, run the 2 scripts again.

