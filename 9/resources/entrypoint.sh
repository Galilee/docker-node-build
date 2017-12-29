#! /bin/bash

set -e

if [ -n "$NPM_CUSTOM_REGISTRY" ]; then
	npm config set registry "${CI_NPM_CONFIG_REGISTRY}"
fi

if [ -n "$NPM_CUSTOM_REGISTRY_USER" -a -n "$NPM_CUSTOM_REGISTRY_PASSWORD" ]; then
	npm config set _auth $(echo -n "$NPM_CUSTOM_REGISTRY_USER:$NPM_CUSTOM_REGISTRY_PASSWORD"|base64)
	npm config set always-auth true
fi

# Fix cache location
if [ -n "$NPM_CONFIG_CACHE" ]; then
	npm config set cache "${NPM_CONFIG_CACHE}"
fi

exec "$@"