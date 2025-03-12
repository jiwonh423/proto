.PHONY: gen clean

gen:

	protoc --go_out=. --go-grpc_out=. --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative services/user/v1/*.proto

clean:
	find . -name "*.pb.go" -delete
	find . -name "*_grpc.pb.go" - delete