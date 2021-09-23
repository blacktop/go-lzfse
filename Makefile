REPO=blacktop
NAME=go-lzfse
CUR_VERSION=$(shell svu current)
NEXT_VERSION=$(shell svu patch)


.PHONY: test
test: ## Run tests
	@echo " > Running tests\n"
	@go test -v

.PHONY: release
release: ## Create a new release from the NEXT_VERSION
	@echo " > Creating Release ${NEXT_VERSION}"
	@gh release create ${NEXT_VERSION}

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help