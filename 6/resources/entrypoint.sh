#! /bin/bash

set -e

# Custom NPM config 
if [ -n "$NPM_CONFIG_EMAIL" ]; then
	npm config set email "${NPM_CONFIG_EMAIL}"
fi

if [ -n "$NPM_CONFIG_REGISTRY" ]; then
	npm config set registry "${NPM_CONFIG_REGISTRY}"
fi

if [ -n "$NPM_CONFIG_USER" -a -n "$NPM_CONFIG_PASSWORD" ]; then
	npm config set _auth $(echo -n "$NPM_CONFIG_USER:$NPM_CONFIG_PASSWORD"|base64)
	npm config set always-auth true
fi

# Fix cache location
if [ -n "$NPM_CONFIG_CACHE" ]; then
	npm config set cache "${NPM_CONFIG_CACHE}"
fi