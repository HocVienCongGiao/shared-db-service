# shared-db-service

Make sure no program/db is running on port 5432
1. Open a terminal at project location where you just cloned shared-db-service
2. `chmod +x ./scripts/*.sh`
3. Run `./scripts/start-postgres.sh` in a terminal and keep it open
4. Open a new terminal and run `./scripts/run-migrations.sh`

If you get `docker: invalid reference format`
do the following
```
sudo apt-get update -y
sudo apt-get install -y dos2unix
dos2unix ./scripts/*.sh
```
Then, run the 2 scripts again.
