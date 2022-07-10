gen:
	protoc --proto_path=proto proto/*.proto --go_out=pb --go_opt=paths=source_relative --go-grpc_out=pb --go-grpc_opt=paths=source_relative

clean:
	del pb\*.go

run:
	go run main.go

server:
	go run cmd/server/main.go -port 8081

client:
	go run cmd/client/main.go -address 0.0.0.0:8081

test:
	go test -cover -race ./...

.PHONY: gen clean server client test