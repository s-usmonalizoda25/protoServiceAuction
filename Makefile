PROTO_DIR := proto
GEN_DIR := gen

PROTO_FILES := $(shell find $(PROTO_DIR) -name '*.proto')

.PHONY: gen
gen:
	@for file in $(PROTO_FILES); do \
		echo "generating $$file"; \
		protoc -I $(PROTO_DIR) \
			--go_out=$(GEN_DIR) --go_opt=paths=source_relative \
			--go-grpc_out=$(GEN_DIR) --go-grpc_opt=paths=source_relative \
			$$file; \
	done

.PHONY: clean
clean:
	rm -rf $(GEN_DIR)/*

.PHONY: tidy
tidy:
	go mod tidy