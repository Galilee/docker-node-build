FROM node:6
LABEL maintainer="Stéphane BARON <sbaron@galilee.fr>"

# Dependencies
RUN apt-get update --yes \
	&& apt-get install --no-install-recommends --yes --quiet \
		apt-transport-https \
		graphicsmagick \
		imagemagick \
	&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
	&& apt-get update --yes \
	&& apt-get install --no-install-recommends --yes --quiet \
		yarn \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Global npm module install
RUN npm --silent install --global gulp-cli grunt-cli \
	&& rm -rf ~/.npm

COPY resources/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]