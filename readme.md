# Notes:

https://github.com/techschool/simplebank/

## create db schema using dbdiagram.io

```
use dbdiagram.io schema file
```

## Setup go and vscode in mac

```
vi ~/.bash_profile
export PATH=$PATH:$(go env GOPATH)/bin
source ~/.bash_profile
```

## Download docker desktop in mac and create postgres container, use TablePLus to connect db container and create tables

### container are instance of images

```
docker pull postgres:12-alpine
docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=xxxxx -d postgres:12-alpine
docker exec -it postgres12 psql -U root
\q
docker logs postgres12
docker stop postgres12
docker rm postgres12
docker start postgres12
docker exec -it postgres12 /bin/sh
```

## schema migration

### change schema in db is called migration

```
brew install golang-migrate
mkdir -p db/migration
migrate -version
migrate create -ext sql -dir db/migration -seq init_schema

docker exec -it postgres12 createdb --username=root --owner=root simple_bank
docker exec -it postgres12 psql -U root simple_bank
history | grep "docker run"

create Makefile including the statements above
migrate -path db/migration -database "postgresql://root:xxxxx@localhost:5432/simple_bank?sslmode=disable" -verbose up


```

## sqlc

```
brew install sqlc
sqlc version
sqlc help
sqlc init
set yaml
make sqlc => detects query folder and create sqlc folder and releated files
go mod init github.com/alldaygzchen/goService => go.mod
go mod tidy => install dependency
```
