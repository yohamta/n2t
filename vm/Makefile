.PHONY: all build

all: build
build:
	rm -rf build/*.go
	mkdir -p build
	cp lang.txt build/
	cgmerge
	mv _merged.go build/VMTranslator.go
	go fmt build/VMTranslator.go

install:
	go install go install github.com/yohamta/merger/cmd/cgmerge@1.0.0
