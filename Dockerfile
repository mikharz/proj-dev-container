FROM dunglas/frankenphp:1.9-php8.4

# Composer
ADD https://getcomposer.org/download/latest-2.x/composer.phar .
RUN mv composer.phar /usr/local/bin/composer && \
    chmod 0755 /usr/local/bin/composer

# Packages
RUN apt update && \
    apt install -y git fzf vim vim-fugitive && \
    apt clean

# User
ARG USER=user
RUN useradd ${USER} -m && \
	setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/frankenphp && \
	chown -R ${USER}:${USER} /app /config/caddy /data/caddy
USER ${USER}

# Environment
RUN echo "eval \"\$(fzf --bash)\"" >> ~/.bashrc
