#! /bin/bash

set -e

# SSH key
if [ -n "$SSH_PRIVATE_KEY" ]; then
	eval $(ssh-agent -s)
	ssh-add <(echo "$SSH_PRIVATE_KEY") >/dev/null 2>&1
	unset SSH_PRIVATE_KEY
fi

if [ -n "$NPM_CUSTOM_REGISTRY" ]; then
	npm config set registry "${NPM_CUSTOM_REGISTRY}"
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