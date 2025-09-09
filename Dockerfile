FROM dunglas/frankenphp:1.9-php8.4
ARG USER=user
RUN \
	useradd ${USER} -m; \
	setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/frankenphp; \
	chown -R ${USER}:${USER} /app /config/caddy /data/caddy
RUN apt update && apt install -y git fzf vim vim-fugitive
USER ${USER}
RUN echo "eval \"\$(fzf --bash)\"" >> ~/.bashrc
