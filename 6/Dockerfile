FROM node:6
LABEL maintainer="Stéphane BARON <sbaron@galilee.fr>"

# Dependencies
RUN apt-get update --yes \
	&& apt-get install --no-install-recommends --yes --quiet \
		graphicsmagick \
		imagemagick \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Global npm module install
RUN npm --silent install --global gulp-cli grunt-cli \
	&& rm -rf ~/.npm