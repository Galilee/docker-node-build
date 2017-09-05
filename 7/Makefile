SHELL_NAME ?= /bin/bash
BUILD_DIR := $(shell pwd)
TAG_NAME := node-$(shell basename $(BUILD_DIR))-build

.PHONY: build shell

build:
	docker build -t $(TAG_NAME) .

shell:
	docker run --rm -ti $(TAG_NAME) $(ENV) $(SHELL_NAME)