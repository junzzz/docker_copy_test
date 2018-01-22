#! /usr/bin/make
#
# Makefile for ebica-api
#
# Targets:
# - depend		get all needed dependencies
# - clean     delete all generated files
# - generate  generate all goagen-generated files
# - build     compile executable
#
# Meta targets:
# - all is the default target, it runs all the targets in the order above
#
DEPEND=	golang.org/x/tools/cmd/goimports \
	github.com/jteeuwen/go-bindata/...

DESIGN_PATH := $(shell go list -f {{.ImportPath}} ./design)
APP_PATH := $(shell dirname $(DESIGN_PATH))/app
GOAGEN := $(GOPATH)/src/github.com/ebisol/ebica-api/bin/goagen

all: depend clean generate

depend:
	@go get $(DEPEND)

clean:
	@rm -rf app
	@rm -rf public/swagger

generate:
	@$(GOAGEN) app        -d $(DESIGN_PATH)
	@$(GOAGEN) controller -d $(DESIGN_PATH) -o controllers --pkg controllers --app-pkg $(APP_PATH)
	@$(GOAGEN) swagger    -d $(DESIGN_PATH) -o public
	@go-bindata        -ignore bindata.go -pkg public -o public/bindata.go ./public/...

genall:
	@dep ensure -v
	# @go build -o ./bin/goagen ./vendor/github.com/goadesign/goa/goagen
	# @./make.sh . ebica hera hera/ares hera/panet panet tecpos webrsv

build: genall
	@go build -o ebica-api
