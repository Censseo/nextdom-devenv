# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.140.1/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version: buster, stretch
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

ENV ROOT_PASSWORD nextdom
ENV APACHE_PORT 8080
ENV SSH_PORT 8022
ENV MODE_HOST 0
ENV VERSION docker
ENV BRANCH develop
ENV locale-gen fr_FR.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE DontWarn

RUN mkdir /usr/share/nextdom
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends git software-properties-common gnupg wget ca-certificates
RUN add-apt-repository non-free
RUN wget -qO -  http://debian.nextdom.org/debian/nextdom.gpg.key  | apt-key add -
RUN echo "deb http://debian.nextdom.org/debian  nextdom main" >/etc/apt/sources.list.d/nextdom.list
RUN apt update
RUN apt -y install nextdom-mysql nextdom-common
RUN apt-get install php-xdebug --yes \
    && echo "xdebug.remote_enable=on" >> /etc/php/7.3/mods-available/xdebug.ini \
    && echo "xdebug.remote_autostart=on" >> /etc/php/7.3/mods-available/xdebug.ini \
    && echo "xdebug.remote_port=9900" >> /etc/php/7.3/mods-available/xdebug.ini
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]