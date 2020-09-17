INSTALL	= /usr/bin/install
PREFIX	= /usr/local

.PHONY: all base buildpack-deps-curl buildpack-deps-scm buildpack-deps go python

all:	go python

base:
	docker build --build-arg USER=$(USER) -t ktnyt/base base

buildpack-deps-curl:	base
	docker build -t ktnyt/buildpack-deps-curl buildpack-deps/curl

buildpack-deps-scm:	buildpack-deps-curl
	docker build -t ktnyt/buildpack-deps-scm buildpack-deps/scm

buildpack-deps:	buildpack-deps-scm
	docker build -t ktnyt/buildpack-deps buildpack-deps

go:	buildpack-deps-curl
	docker build -t ktnyt/go go

python:	buildpack-deps
	docker build -t ktnyt/python python

install:
	$(INSTALL) docker-runuser $(PREFIX)/bin

uninstall:
	rm $(PREFIX)/bin/docker-runuser