# ========================
# CONFIG
# ========================

LIB_NAME=movie_reservation

PROTO_DIR=proto
GEN_DIR=$(LIB_NAME)

PROTOC=protoc

# ========================
# PHONY
# ========================

.PHONY: all proto proto-clean tidy fmt lint

# ========================
# DEFAULT
# ========================

all: proto

# ========================
# GENERATE GO LIBRARY
# ========================

proto:
	@echo "⚡ Generating protobuf Go library..."

	@mkdir -p $(GEN_DIR)

	$(PROTOC) \
		-I $(PROTO_DIR) \
		--go_out=$(GEN_DIR) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(GEN_DIR) \
		--go-grpc_opt=paths=source_relative \
		$$(find $(PROTO_DIR) -type f -name "*.proto")

proto-clean:
	@echo "🧹 Cleaning generated protobuf files..."

	find $(GEN_DIR) -name "*.pb.go" -delete
	find $(GEN_DIR) -name "*_grpc.pb.go" -delete

# ========================
# UTILITIES
# ========================

tidy:
	go mod tidy

fmt:
	go fmt ./...

lint:
	golangci-lint run || true
