postgres:	
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=xxxxx -d postgres:12-alpine
createdb:
	sleep 10  # Wait for the database to be ready
	docker exec -it postgres12 createdb --username=root --owner=root simple_bank
dropdb:
	docker exec -it postgres12 dropdb simple_bank
migrateup: postgres createdb
	migrate -path db/migration -database "postgresql://root:xxxxx@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:xxxxx@localhost:5432/simple_bank?sslmode=disable" -verbose down
remove:
	docker stop postgres12
	sleep 5
	docker rm postgres12
sqlc:
	sqlc generate
.PHONY: postgres createdb dropdb migrateup migratedown remove sqlc
